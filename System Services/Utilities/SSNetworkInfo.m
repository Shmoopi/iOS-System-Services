//
//  SSNetworkInfo.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/18/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SSNetworkInfo.h"

// ifaddrs
#import <ifaddrs.h>

// inet
#import <arpa/inet.h>

// route
#include "route.h"

// sysctl
#import <sys/sysctl.h>

#include <net/if.h>
#include <net/if_dl.h>
#include <sys/ioctl.h>

# pragma mark - Router Info

#define RTF_PRCLONING	0x10000		/* protocol requires cloning */
#define RTF_WASCLONED	0x20000		/* route generated through cloning */
#define RTF_PROTO3	0x40000		/* protocol specific routing flag */

#define RTAX_DST	0	/* destination sockaddr present */
#define RTAX_GATEWAY	1	/* gateway sockaddr present */
#define RTAX_NETMASK	2	/* netmask sockaddr present */
#define RTAX_GENMASK	3	/* cloning mask sockaddr present */
#define RTAX_IFP	4	/* interface name sockaddr present */
#define RTAX_IFA	5	/* interface addr sockaddr present */
#define RTAX_AUTHOR	6	/* sockaddr for author of redirect */
#define RTAX_BRD	7	/* for NEWADDR, broadcast or p-p dest addr */
#define RTAX_MAX	8	/* size of array to allocate */

#define RTA_DST		0x1	/* destination sockaddr present */
#define RTA_GATEWAY	0x2	/* gateway sockaddr present */
#define RTA_NETMASK	0x4	/* netmask sockaddr present */
#define RTA_GENMASK	0x8	/* cloning mask sockaddr present */
#define RTA_IFP		0x10	/* interface name sockaddr present */
#define RTA_IFA		0x20	/* interface addr sockaddr present */
#define RTA_AUTHOR	0x40	/* sockaddr for author of redirect */
#define RTA_BRD		0x80	/* for NEWADDR, broadcast or p-p dest addr */

@interface Route_Info : NSObject
{
    struct sockaddr     m_addrs[RTAX_MAX];
    struct rt_msghdr2   m_rtm;
    int                 m_len;      /* length of the sockaddr array */
}
- initWithRtm: (struct rt_msghdr2*) rtm;

+ (NSMutableArray*) getRoutes;
+ (nullable Route_Info*) getRoute:(struct rt_msghdr2 *)rtm;

- (nullable NSString*) getDestination;
- (nullable NSString*) getNetmask;
- (nullable NSString*) getGateway;
- (nullable NSString*) getAddrStringByIndex: (int)rtax_index;

- (void) setAddr:(struct sockaddr*)sa index:(int)rtax_index;
@end

@implementation Route_Info

-initWithRtm: (struct rt_msghdr2*) rtm
{
    int i;
    struct sockaddr* sa = (struct sockaddr*)(rtm + 1);
    
    memcpy(&(m_rtm), rtm, sizeof(struct rt_msghdr2));
    for(i = 0; i < RTAX_MAX; i++)
    {
        [self setAddr:&(sa[i]) index:i];
    }
    
    return self;
}

+ (NSMutableArray*) getRoutes
{
    NSMutableArray* routeArray = [NSMutableArray array];
    Route_Info* route = nil;
    
    size_t len;
    int mib[6];
    char *buf;
    register struct rt_msghdr2 *rtm;
    
    mib[0] = CTL_NET;
    mib[1] = PF_ROUTE;
    mib[2] = 0;
    mib[3] = 0;
    mib[4] = NET_RT_DUMP2;
    mib[5] = 0;
    
    sysctl(mib, 6, NULL, &len, NULL, 0);
    buf = malloc(len);
    if (buf && sysctl(mib, 6, buf, &len, NULL, 0) == 0)
    {
        for (char * ptr = buf; ptr < buf + len; ptr += rtm->rtm_msglen)
        {
            rtm = (struct rt_msghdr2 *)ptr;
            route = [self getRoute:rtm];
            if(route != nil)
            {
                [routeArray addObject:route];
                break;
            }
        }
    }
    
    free(buf);
    
    return routeArray;
}


+ (nullable Route_Info*) getRoute:(struct rt_msghdr2 *)rtm
{
    struct sockaddr* dst_sa = (struct sockaddr *)(rtm + 1);
    Route_Info* route = nil;
    
    if(rtm->rtm_addrs & RTA_DST)
    {
        if(dst_sa->sa_family == AF_INET && !((rtm->rtm_flags & RTF_WASCLONED) && (rtm->rtm_parentflags & RTF_PRCLONING)))
        {
            route = [[Route_Info alloc] initWithRtm:rtm];
        }
    }
    
    return route;
}

-(void) setAddr:(struct sockaddr*)sa index:(int)rtax_index
{
    if(rtax_index >= 0 && rtax_index < RTAX_MAX)
    {
        memcpy(&(m_addrs[rtax_index]), sa, sizeof(struct sockaddr));
    }
}

-(nullable NSString*) getDestination
{
    return [self getAddrStringByIndex:RTAX_DST];
}

-(nullable NSString*) getNetmask
{
    return [self getAddrStringByIndex:RTAX_NETMASK];
}

-(nullable NSString*) getGateway
{
    return [self getAddrStringByIndex:RTAX_GATEWAY];
}


-(nullable NSString*) getAddrStringByIndex: (int)rtax_index
{
    NSString * routeString = nil;
    struct sockaddr* sa = &(m_addrs[rtax_index]);
    int flagVal = 1 << rtax_index;
    
    if(!(m_rtm.rtm_addrs & flagVal))
    {
        return nil;
    }
    
    if(rtax_index >= 0 && rtax_index < RTAX_MAX)
    {
        switch(sa->sa_family)
        {
            case AF_INET:
            {
                struct sockaddr_in* si = (struct sockaddr_in *)sa;
                if(si->sin_addr.s_addr == INADDR_ANY)
                    routeString = @"default";
                else
                    routeString = [NSString stringWithCString:(char *)inet_ntoa(si->sin_addr) encoding:NSASCIIStringEncoding];
            }
                break;
                
            case AF_LINK:
            {
                struct sockaddr_dl* sdl = (struct sockaddr_dl*)sa;
                if(sdl->sdl_nlen + sdl->sdl_alen + sdl->sdl_slen == 0)
                {
                    routeString = [NSString stringWithFormat: @"link #%d", sdl->sdl_index];
                }
                else
                    routeString = [NSString stringWithCString:link_ntoa(sdl) encoding:NSASCIIStringEncoding];
            }
                break;
                
            default:
            {
                char a[3 * sa->sa_len];
                char *cp;
                char *sep = "";
                int i;
                
                if(sa->sa_len == 0)
                {
                    routeString = nil;
                }
                else
                {
                    a[0] = '\0';
                    for(i = 0, cp = a; i < sa->sa_len; i++)
                    {
                        cp += sprintf(cp, "%s%02x", sep, (unsigned char)sa->sa_data[i]);
                        sep = ":";
                    }
                    routeString = [NSString stringWithCString:a encoding:NSASCIIStringEncoding];
                }
            }
        }
    }
    
    return routeString;
}

@end

@implementation SSNetworkInfo

// Network Information

// Get Current IP Address
+ (nullable NSString *)currentIPAddress {
    // Get the current IP Address
    
    // Check which interface is currently in use
    if ([self connectedToWiFi]) {
        // WiFi is in use
        
        // Get the WiFi IP Address
        NSString *wiFiAddress = [self wiFiIPAddress];
        
        // Check that you get something back
        if (wiFiAddress == nil || wiFiAddress.length <= 0) {
            // Error, no address found
            return nil;
        }
        
        // Return Wifi address
        return wiFiAddress;
    } else if ([self connectedToCellNetwork]) {
        // Cell Network is in use
        
        // Get the Cell IP Address
        NSString *cellAddress = [self cellIPAddress];
        
        // Check that you get something back
        if (cellAddress == nil || cellAddress.length <= 0) {
            // Error, no address found
            return nil;
        }
        
        // Return Cell address
        return cellAddress;
    } else {
        // No interface in use
        return nil;
    }
}

// Get the External IP Address
+ (nullable NSString *)externalIPAddress {
    @try {
        // Check if we have an internet connection then try to get the External IP Address
        if (![self connectedToCellNetwork] && ![self connectedToWiFi]) {
            // Not connected to anything, return nil
            return nil;
        }
        
        // Get the external IP Address based on icanhazip.com
        NSError *error = nil;
        
        // Using https://icanhazip.com
        NSString *externalIP = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://icanhazip.com/"] encoding:NSUTF8StringEncoding error:&error];
        
        if (!error) {
            
            // Format the IP Address
            externalIP = [externalIP stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
            
            // Check that you get something back
            if (externalIP == nil || externalIP.length <= 0) {
                // Error, no address found
                return nil;
            }
            
            // Return External IP
            return externalIP;
        } else {
            // Error, no address found
            return nil;
        }
    }
    @catch (NSException *exception) {
        // Error, no address found
        return nil;
    }
}

// Get Cell IP Address
+ (nullable NSString *)cellIPAddress {
    // Get the Cell IP Address
    @try {
        // Set a string for the address
        NSString *ipAddress;
        // Set up structs to hold the interfaces and the temporary address
        struct ifaddrs *interfaces;
        struct ifaddrs *temp;
        struct sockaddr_in *s4;
        char buf[64];
        
        // If it's 0, then it's good
        if (!getifaddrs(&interfaces))
        {
            // Loop through the list of interfaces
            temp = interfaces;
            
            // Run through it while it's still available
            while(temp != NULL)
            {
                // If the temp interface is a valid interface
                if(temp->ifa_addr->sa_family == AF_INET)
                {
                    // Check if the interface is Cell
                    if([[NSString stringWithUTF8String:temp->ifa_name] isEqualToString:@"pdp_ip0"])
                    {
                        s4 = (struct sockaddr_in *)temp->ifa_addr;
                        
                        if (inet_ntop(temp->ifa_addr->sa_family, (void *)&(s4->sin_addr), buf, sizeof(buf)) == NULL) {
                            // Failed to find it
                            ipAddress = nil;
                        } else {
                            // Got the Cell IP Address
                            ipAddress = [NSString stringWithUTF8String:buf];
                        }
                    }
                }
                
                // Set the temp value to the next interface
                temp = temp->ifa_next;
            }
        }
        
        // Free the memory of the interfaces
        freeifaddrs(interfaces);
        
        // Check to make sure it's not empty
        if (ipAddress == nil || ipAddress.length <= 0) {
            // Empty, return not found
            return nil;
        }
        
        // Return the IP Address of the WiFi
        return ipAddress;
    }
    @catch (NSException *exception) {
        // Error, IP Not found
        return nil;
    }
}

// Get Cell IPv6 Address
+ (nullable NSString *)cellIPv6Address {
    // Get the Cell IP Address
    @try {
        // Set a string for the address
        NSString *ipAddress;
        // Set up structs to hold the interfaces and the temporary address
        struct ifaddrs *interfaces;
        struct ifaddrs *temp;
        struct sockaddr_in6 *s6;
        char buf[INET6_ADDRSTRLEN];
        
        // If it's 0, then it's good
        if (!getifaddrs(&interfaces))
        {
            // Loop through the list of interfaces
            temp = interfaces;
            
            // Run through it while it's still available
            while(temp != NULL)
            {
                // If the temp interface is a valid interface
                if(temp->ifa_addr->sa_family == AF_INET6)
                {
                    // Check if the interface is Cell
                    if([[NSString stringWithUTF8String:temp->ifa_name] isEqualToString:@"pdp_ip0"])
                    {
                        s6 = (struct sockaddr_in6 *)temp->ifa_addr;
                        
                        if (inet_ntop(AF_INET6, (void *)&(s6->sin6_addr), buf, sizeof(buf)) == NULL) {
                            // Failed to find it
                            ipAddress = nil;
                        } else {
                            // Got the Cell IP Address
                            ipAddress = [NSString stringWithUTF8String:buf];
                        }
                    }
                }
                
                // Set the temp value to the next interface
                temp = temp->ifa_next;
            }
        }
        
        // Free the memory of the interfaces
        freeifaddrs(interfaces);
        
        // Check to make sure it's not empty
        if (ipAddress == nil || ipAddress.length <= 0) {
            // Empty, return not found
            return nil;
        }
        
        // Return the IP Address of the WiFi
        return ipAddress;
    }
    @catch (NSException *exception) {
        // Error, IP Not found
        return nil;
    }
}

// Get Cell Netmask Address
+ (nullable NSString *)cellNetmaskAddress {
    // Get the Cell Netmask Address
    @try {
        // Set up the variable
        struct ifreq afr;
        // Copy the string
        strncpy(afr.ifr_name, [@"pdp_ip0" UTF8String], IFNAMSIZ-1);
        // Open a socket
        int afd = socket(AF_INET, SOCK_DGRAM, 0);
        
        // Check the socket
        if (afd == -1) {
            // Error, socket failed to open
            return nil;
        }
        
        // Check the netmask output
        if (ioctl(afd, SIOCGIFNETMASK, &afr) == -1) {
            // Error, netmask wasn't found
            // Close the socket
            close(afd);
            // Return error
            return nil;
        }
        
        // Close the socket
        close(afd);
        
        // Create a char for the netmask
        char *netstring = inet_ntoa(((struct sockaddr_in *)&afr.ifr_addr)->sin_addr);
        
        // Create a string for the netmask
        NSString *Netmask = [NSString stringWithUTF8String:netstring];
        
        // Check to make sure it's not nil
        if (Netmask == nil || Netmask.length <= 0) {
            // Error, netmask not found
            return nil;
        }
        
        // Return successful
        return Netmask;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Get Cell Broadcast Address
+ (nullable NSString *)cellBroadcastAddress {
    // Get the Cell Broadcast Address
    @try {
        // Set up strings for the IP and Netmask
        NSString *ipAddress = [self cellIPAddress];
        NSString *nmAddress = [self cellNetmaskAddress];
        
        // Check to make sure they aren't nil
        if (ipAddress == nil || ipAddress.length <= 0) {
            // Error, IP Address can't be nil
            return nil;
        }
        if (nmAddress == nil || nmAddress.length <= 0) {
            // Error, NM Address can't be nil
            return nil;
        }
        
        // Check the formatting of the IP and NM Addresses
        NSArray *ipCheck = [ipAddress componentsSeparatedByString:@"."];
        NSArray *nmCheck = [nmAddress componentsSeparatedByString:@"."];
        
        // Make sure the IP and NM Addresses are correct
        if (ipCheck.count != 4 || nmCheck.count != 4) {
            // Incorrect IP Addresses
            return nil;
        }
        
        // Set up the variables
        NSUInteger ip = 0;
        NSUInteger nm = 0;
        NSUInteger cs = 24;
        
        // Make the address based on the other addresses
        for (NSUInteger i = 0; i < 4; i++, cs -= 8) {
            ip |= [[ipCheck objectAtIndex:i] intValue] << cs;
            nm |= [[nmCheck objectAtIndex:i] intValue] << cs;
        }
        
        // Set it equal to the formatted raw addresses
        NSUInteger ba = ~nm | ip;
        
        // Make a string for the address
        NSString *broadcastAddress = [NSString stringWithFormat:@"%ld.%ld.%ld.%ld", (long)(ba & 0xFF000000) >> 24,
                                      (long)(ba & 0x00FF0000) >> 16, (long)(ba & 0x0000FF00) >> 8, (long)(ba & 0x000000FF)];
        
        // Check to make sure the string is valid
        if (broadcastAddress == nil || broadcastAddress.length <= 0) {
            // Error, no address
            return nil;
        }
        
        // Return Successful
        return broadcastAddress;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Get WiFi IP Address
+ (nullable NSString *)wiFiIPAddress {
    // Get the WiFi IP Address
    @try {
        // Set a string for the address
        NSString *ipAddress;
        // Set up structs to hold the interfaces and the temporary address
        struct ifaddrs *interfaces;
        struct ifaddrs *temp;
        // Set up int for success or fail
        int Status = 0;
        
        // Get all the network interfaces
        Status = getifaddrs(&interfaces);
        
        // If it's 0, then it's good
        if (Status == 0)
        {
            // Loop through the list of interfaces
            temp = interfaces;
            
            // Run through it while it's still available
            while(temp != NULL)
            {
                // If the temp interface is a valid interface
                if(temp->ifa_addr->sa_family == AF_INET)
                {
                    // Check if the interface is WiFi
                    if([[NSString stringWithUTF8String:temp->ifa_name] isEqualToString:@"en0"])
                    {
                        // Get the WiFi IP Address
                        ipAddress = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp->ifa_addr)->sin_addr)];
                    }
                }
                
                // Set the temp value to the next interface
                temp = temp->ifa_next;
            }
        }
        
        // Free the memory of the interfaces
        freeifaddrs(interfaces);
        
        // Check to make sure it's not empty
        if (ipAddress == nil || ipAddress.length <= 0) {
            // Empty, return not found
            return nil;
        }
        
        // Return the IP Address of the WiFi
        return ipAddress;
    }
    @catch (NSException *exception) {
        // Error, IP Not found
        return nil;
    }
}

// Get WiFi IPv6 Address
+ (nullable NSString *)wiFiIPv6Address {
    // Get the WiFi IP Address
    @try {
        // Set a string for the address
        NSString *ipAddress;
        // Set up structs to hold the interfaces and the temporary address
        struct ifaddrs *interfaces;
        struct ifaddrs *temp;
        // Set up int for success or fail
        int status = 0;
        
        // Get all the network interfaces
        status = getifaddrs(&interfaces);
        
        // If it's 0, then it's good
        if (status == 0)
        {
            // Loop through the list of interfaces
            temp = interfaces;
            
            // Run through it while it's still available
            while(temp != NULL)
            {
                // If the temp interface is a valid interface
                if(temp->ifa_addr->sa_family == AF_INET6)
                {
                    // Check if the interface is WiFi
                    if([[NSString stringWithUTF8String:temp->ifa_name] isEqualToString:@"en0"])
                    {
                        // Get the WiFi IP Address
                        struct sockaddr_in6 *addr6 = (struct sockaddr_in6 *)temp->ifa_addr;
                        char buf[INET6_ADDRSTRLEN];
                        if (inet_ntop(AF_INET6, (void *)&(addr6->sin6_addr), buf, sizeof(buf)) == NULL) {
                            // Failed to find it
                            ipAddress = nil;
                        } else {
                            // Got the Cell IP Address
                            ipAddress = [NSString stringWithUTF8String:buf];
                        }
                    }
                }
                
                // Set the temp value to the next interface
                temp = temp->ifa_next;
            }
        }
        
        // Free the memory of the interfaces
        freeifaddrs(interfaces);
        
        // Check to make sure it's not empty
        if (ipAddress == nil || ipAddress.length <= 0) {
            // Empty, return not found
            return nil;
        }
        
        // Return the IP Address of the WiFi
        return ipAddress;
    }
    @catch (NSException *exception) {
        // Error, IP Not found
        return nil;
    }
}

// Get WiFi Netmask Address
+ (nullable NSString *)wiFiNetmaskAddress {
    // Get the WiFi Netmask Address
    @try {
        // Set up the variable
        struct ifreq afr;
        // Copy the string
        strncpy(afr.ifr_name, [@"en0" UTF8String], IFNAMSIZ-1);
        // Open a socket
        int afd = socket(AF_INET, SOCK_DGRAM, 0);
        
        // Check the socket
        if (afd == -1) {
            // Error, socket failed to open
            return nil;
        }
        
        // Check the netmask output
        if (ioctl(afd, SIOCGIFNETMASK, &afr) == -1) {
            // Error, netmask wasn't found
            // Close the socket
            close(afd);
            // Return error
            return nil;
        }
        
        // Close the socket
        close(afd);
        
        // Create a char for the netmask
        char *netstring = inet_ntoa(((struct sockaddr_in *)&afr.ifr_addr)->sin_addr);
        
        // Create a string for the netmask
        NSString *netmask = [NSString stringWithUTF8String:netstring];
        
        // Check to make sure it's not nil
        if (netmask == nil || netmask.length <= 0) {
            // Error, netmask not found
            return nil;
        }
        
        // Return successful
        return netmask;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Get WiFi Broadcast Address
+ (nullable NSString *)wiFiBroadcastAddress {
    // Get the WiFi Broadcast Address
    @try {
        // Set up strings for the IP and Netmask
        NSString *ipAddress = [self wiFiIPAddress];
        NSString *nmAddress = [self wiFiNetmaskAddress];
        
        // Check to make sure they aren't nil
        if (ipAddress == nil || ipAddress.length <= 0) {
            // Error, IP Address can't be nil
            return nil;
        }
        if (nmAddress == nil || nmAddress.length <= 0) {
            // Error, NM Address can't be nil
            return nil;
        }
        
        // Check the formatting of the IP and NM Addresses
        NSArray *ipCheck = [ipAddress componentsSeparatedByString:@"."];
        NSArray *nmCheck = [nmAddress componentsSeparatedByString:@"."];
        
        // Make sure the IP and NM Addresses are correct
        if (ipCheck.count != 4 || nmCheck.count != 4) {
            // Incorrect IP Addresses
            return nil;
        }
        
        // Set up the variables
        NSUInteger ip = 0;
        NSUInteger nm = 0;
        NSUInteger cs = 24;
        
        // Make the address based on the other addresses
        for (NSUInteger i = 0; i < 4; i++, cs -= 8) {
            ip |= [[ipCheck objectAtIndex:i] intValue] << cs;
            nm |= [[nmCheck objectAtIndex:i] intValue] << cs;
        }
        
        // Set it equal to the formatted raw addresses
        NSUInteger ba = ~nm | ip;
        
        // Make a string for the address
        NSString *broadcastAddress = [NSString stringWithFormat:@"%lu.%lu.%lu.%lu", (long)(ba & 0xFF000000) >> 24,
                                      (long)(ba & 0x00FF0000) >> 16, (long)(ba & 0x0000FF00) >> 8, (long)(ba & 0x000000FF)];
        
        // Check to make sure the string is valid
        if (broadcastAddress == nil || broadcastAddress.length <= 0) {
            // Error, no address
            return nil;
        }
        
        // Return Successful
        return broadcastAddress;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

// Connected to WiFi?
+ (BOOL)connectedToWiFi {
    // Check if we're connected to WiFi
    NSString *wiFiAddress = [self wiFiIPAddress];
    // Check if the string is populated
    if (wiFiAddress == nil || wiFiAddress.length <= 0) {
        // Nothing found
        return false;
    } else {
        // WiFi in use
        return true;
    }
}

// Connected to Cellular Network?
+ (BOOL)connectedToCellNetwork {
    // Check if we're connected to cell network
    NSString *cellAddress = [self cellIPAddress];
    // Check if the string is populated
    if (cellAddress == nil || cellAddress.length <= 0) {
        // Nothing found
        return false;
    } else {
        // Cellular Network in use
        return true;
    }
}

+ (nullable NSString *)wiFiRouterAddress {
    // Get the WiFi Router Address
    @try {
        // Set the ip address variable
        NSString *routerIP = nil;
        // Set the router array variable with the routing information
        NSMutableArray *routerArray = [Route_Info getRoutes];
        // Run through the array
        for(int i = 0; i < (int)[routerArray count]; i++)
        {
            // Set the router info
            Route_Info* router = (Route_Info*)[routerArray objectAtIndex:i];
            routerIP = [router getGateway];
        }
        // Return Successful
        return routerIP;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

@end


