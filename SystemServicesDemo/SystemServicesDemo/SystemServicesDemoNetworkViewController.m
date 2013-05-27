//
//  SystemServicesDemoNetworkViewController.m
//  SystemServicesDemo
//
//  Created by Kramer on 4/4/13.
//  Copyright (c) 2013 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesDemoNetworkViewController.h"
#import "SystemServices.h"

#define SystemSharedServices [SystemServices sharedServices]

@interface SystemServicesDemoNetworkViewController ()

@end

@implementation SystemServicesDemoNetworkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Update the network info
    [self performSelector:@selector(getAllNetworkInformation)];
}

- (void)getAllNetworkInformation {
    
    // Empty the textview text
    self.textView.text = @"";
    
    // All Network Information
    NSString *CarrierName = [NSString stringWithFormat:@"Carrier Name: %@",[SystemSharedServices carrierName]];
    NSString *CarrierCountry = [NSString stringWithFormat:@"Carrier Country: %@",[SystemSharedServices carrierCountry]];
    NSString *CarrierMobileCountryCode = [NSString stringWithFormat:@"Carrier Mobile Country: %@",[SystemSharedServices carrierMobileCountryCode]];
    NSString *CarrierISOCountryCode = [NSString stringWithFormat:@"Carrier ISO Country Code: %@",[SystemSharedServices carrierISOCountryCode]];
    NSString *CarrierMobileNetworkCode = [NSString stringWithFormat:@"Carrier Mobile Network Code: %@",[SystemSharedServices carrierMobileNetworkCode]];
    NSString *CarrierAllowsVOIP = ([SystemSharedServices carrierAllowsVOIP]) ? @"Carrier Allows VOIP: Yes" : @"Carrier Allows VOIP: No";
    NSString *CurrentIPAddress = [NSString stringWithFormat:@"Current IP Address: %@",[SystemSharedServices currentIPAddress]];
    NSString *CurrentMACAddress = [NSString stringWithFormat:@"Current MAC Address: %@",[SystemSharedServices currentMACAddress]];
    NSString *ExternalIPAddress = [NSString stringWithFormat:@"External IP Address: %@",[SystemSharedServices externalIPAddress]];
    NSString *CellIPAddress = [NSString stringWithFormat:@"Cell IP Address: %@",[SystemSharedServices cellIPAddress]];
    NSString *CellMACAddress = [NSString stringWithFormat:@"Cell MAC Address: %@",[SystemSharedServices cellMACAddress]];
    NSString *CellNetmaskAddress = [NSString stringWithFormat:@"Cell Netmask Address: %@",[SystemSharedServices cellNetmaskAddress]];
    NSString *CellBroadcastAddress = [NSString stringWithFormat:@"Cell Broadcast Address: %@",[SystemSharedServices cellBroadcastAddress]];
    NSString *WiFiIPAddress = [NSString stringWithFormat:@"WiFi IP Address: %@",[SystemSharedServices wiFiIPAddress]];
    NSString *WiFiMACAddress = [NSString stringWithFormat:@"WiFi MAC Address: %@",[SystemSharedServices wiFiMACAddress]];
    NSString *WiFiNetmaskAddress = [NSString stringWithFormat:@"WiFi Netmask Address: %@",[SystemSharedServices wiFiNetmaskAddress]];
    NSString *WiFiBroadcastAddress = [NSString stringWithFormat:@"WiFi Broadcast Address: %@",[SystemSharedServices wiFiBroadcastAddress]];
    NSString *ConnectedToWiFi = ([SystemSharedServices connectedToWiFi]) ? @"Connected to WiFi: Yes" : @"Connected to WiFi: No";
    NSString *ConnectedToCellNetwork = ([SystemSharedServices connectedToCellNetwork]) ? @"Connected to Cell Network: Yes" : @"Connected to Cell Network: No";
    
    // Make an array to hold all the objects
    NSArray *array = [[NSArray alloc] initWithObjects:CarrierName, CarrierCountry, CarrierMobileCountryCode, CarrierISOCountryCode, CarrierMobileNetworkCode, CarrierAllowsVOIP, CurrentIPAddress, CurrentMACAddress, ExternalIPAddress, CellIPAddress, CellMACAddress, CellNetmaskAddress, CellBroadcastAddress, WiFiIPAddress, WiFiMACAddress, WiFiNetmaskAddress, WiFiBroadcastAddress, ConnectedToWiFi, ConnectedToCellNetwork, nil];
    
    // Run through all the information
    for (NSString *objects in array) {
        if (![self.textView.text isEqualToString:@""]) {
            // Output all the names and values to the textview
            self.textView.text = [NSString stringWithFormat:@"%@\n%@", self.textView.text, objects];
        } else {
            // Output all the names and values to the textview
            self.textView.text = [NSString stringWithFormat:@"%@", objects];
        }
    }
}

- (IBAction)refresh:(id)sender {
    // Reload the hardware info
    [self getAllNetworkInformation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextView:nil];
    [super viewDidUnload];
}

@end
