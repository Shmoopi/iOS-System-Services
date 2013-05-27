//
//  SystemServicesConstants.h
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#ifndef SystemServicesDemo_SystemServicesConstants_h
#define SystemServicesDemo_SystemServicesConstants_h

// System Frameworks
#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import <ExternalAccessory/EAAccessoryManager.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <AudioToolbox/AudioToolbox.h>

// Headers
#import <arpa/inet.h>
#include <errno.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#import <sys/sysctl.h>
#import <sys/utsname.h>
#import <sys/times.h>
#import <sys/stat.h>
#import <sys/_structs.h>
#import <asl.h>
#import <ifaddrs.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#include <stdio.h>
#import <TargetConditionals.h>

#import "SSHardwareInfo.h"
#import "SSJailbreakCheck.h"
#import "SSProcessorInfo.h"
#import "SSAccessoryInfo.h"
#import "SSCarrierInfo.h"
#import "SSBatteryInfo.h"
#import "SSNetworkInfo.h"
#import "SSProcessInfo.h"
#import "SSDiskInfo.h"
#import "SSMemoryInfo.h"
#import "SSAccelerometerInfo.h"
#import "SSLocalizationInfo.h"
#import "SSApplicationInfo.h"
#import "SSUUID.h"

// Defines
#define MB (1024*1024)
#define GB (MB*1024)

// System Services error status return values
typedef enum
{
	// General status
	SS_STATUS_GOOD,
	SS_INVALID_REQUEST,
	SS_INVALID_VALUE,
	SS_STATUS_EXCEPTION,
	SS_STATUS_ERROR,
	SS_SIMULATOR_BUILD,
	
	// System Services Hardware status
	
	SS_STATUS_MIN = SS_STATUS_GOOD,
	SS_STATUS_MAX = SS_STATUS_ERROR
}SS_STATUS;

#endif
