//
//  SystemServicesDemoViewController.m
//  SystemServicesDemo
//
//  Created by Shmoopi LLC on 9/15/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SystemServicesDemoViewController.h"
#import "SystemServices.h"
#import "SSAccelerometerInfo.h"

#define SystemSharedServices [SystemServices sharedServices]

@interface SystemServicesDemoViewController () {
    SSAccelerometerInfo *accel;
}

@end

@implementation SystemServicesDemoViewController
@synthesize TextView = _TextView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Let's find the accelerometer information (if we're not in the simulator)
#if !TARGET_IPHONE_SIMULATOR
    accel = [[SSAccelerometerInfo alloc] init];
    [accel startLoggingMotionData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        // Log any accelerometer data
        NSLog(@"Raw Accelerometer String: %@", [accel rawAccelerometerString]);
        [accel stopLoggingMotionData];
    });
#endif
    
    [self performSelector:@selector(getAllHardwareInformation) withObject:nil afterDelay:0.01];
}

// Get all the system information
- (void)getAllHardwareInformation {
    
    // Set the textview text to nothing
    self.TextView.text = @"";
    
    // Get an array from the system uptime (to format it)
    NSArray *uptimeFormat = [[SystemSharedServices systemsUptime] componentsSeparatedByString:@" "];
    // Get all Harware Information
    NSString *SystemUptime = [NSString stringWithFormat:@"System Uptime: %@ Days %@ Hours %@ Minutes", [uptimeFormat objectAtIndex:0], [uptimeFormat objectAtIndex:1], [uptimeFormat objectAtIndex:2]];
    NSString *DeviceModel = [NSString stringWithFormat:@"Device Model: %@", [SystemSharedServices deviceModel]];
    NSString *DeviceName = [NSString stringWithFormat:@"Device Name: %@", [SystemSharedServices deviceName]];
    NSString *SystemName = [NSString stringWithFormat:@"System Name: %@", [SystemSharedServices systemName]];
    NSString *SystemVersion = [NSString stringWithFormat:@"System Version: %@", [SystemSharedServices systemsVersion]];
    NSString *SystemDeviceTypeFormattedNO = [NSString stringWithFormat:@"System Device Type Unformatted: %@", [SystemSharedServices systemDeviceTypeNotFormatted]];
    NSString *SystemDeviceTypeFormattedYES = [NSString stringWithFormat:@"System Device Type Formatted: %@", [SystemSharedServices systemDeviceTypeFormatted]];
    NSString *ScreenWidth = [NSString stringWithFormat:@"Screen Width: %ld Pixels", (long)[SystemSharedServices screenWidth]];
    NSString *ScreenHeight = [NSString stringWithFormat:@"Screen Height: %ld Pixels", (long)[SystemSharedServices screenHeight]];
    NSString *ScreenBrightness = [NSString stringWithFormat:@"Screen Brightness: %.0f%%", [SystemSharedServices screenBrightness]];
    NSString *MultitaskingEnabled = ([SystemSharedServices multitaskingEnabled]) ? @"Multitasking Enabled: Yes" : @"Multitasking: No";
    NSString *ProximitySensorEnabled = ([SystemSharedServices proximitySensorEnabled]) ? @"Proximity Sensor: Yes" : @"Proximity Sensor: No";
    NSString *DebuggerAttached = ([SystemSharedServices debuggerAttached]) ? @"Debugger Attached: Yes" : @"Debugger Attached: No";
    NSString *PluggedIn = ([SystemSharedServices pluggedIn]) ? @"Plugged In: Yes" : @"Plugged In: No";
    NSString *Jailbroken = ([SystemSharedServices jailbroken] != NOTJAIL) ? @"Jailbroken: Yes" : @"Jailbroken: No";
    NSString *NumberProcessors = [NSString stringWithFormat:@"Number of Processors: %ld", (long)[SystemSharedServices numberProcessors]];
    NSString *NumberActiveProcessors = [NSString stringWithFormat:@"Number of Active Processors: %ld", (long)[SystemSharedServices numberActiveProcessors]];
    NSString *ProcessorSpeed = [NSString stringWithFormat:@"Processor Speed: %ldMhz", (long)[SystemSharedServices processorSpeed]];
    NSString *ProcessorBusSpeed = [NSString stringWithFormat:@"Processor Bus Speed: %ldMhz", (long)[SystemSharedServices processorBusSpeed]];
    NSString *AccessoriesAttached = ([SystemSharedServices accessoriesAttached]) ? @"Accessories Attached: Yes" : @"Accessories Attached: No";
    NSString *HeadphonesAttached = ([SystemSharedServices headphonesAttached]) ? @"Headphones Attached: Yes" : @"Headphones Attached: No";
    NSString *NumberAttachedAccessories = [NSString stringWithFormat:@"Number of Attached Accessories: %ld", (long)[SystemSharedServices numberAttachedAccessories]];
    NSString *NameAttachedAccessories = [NSString stringWithFormat:@"Name of Attached Accessories: %@", [SystemSharedServices nameAttachedAccessories]];
    NSString *BatteryLevel = [NSString stringWithFormat:@"Battery Level: %f%%", [SystemSharedServices batteryLevel]];
    NSString *Charging = ([SystemSharedServices charging]) ? @"Charging: Yes" : @"Charging: No";
    NSString *FullyCharged = ([SystemSharedServices fullyCharged]) ? @"Fully Charged: Yes" : @"Fully Charged: No";
    NSString *DeviceOrientation = [NSString stringWithFormat:@"Device Orientation: %ld", [SystemSharedServices deviceOrientation]];
    NSString *Country = [NSString stringWithFormat:@"Country: %@", [SystemSharedServices country]];
    NSString *Language = [NSString stringWithFormat:@"Language: %@", [SystemSharedServices language]];
    NSString *TimeZone = [NSString stringWithFormat:@"TimeZone: %@", [SystemSharedServices timeZoneSS]];
    NSString *Currency = [NSString stringWithFormat:@"Currency: %@", [SystemSharedServices currency]];
    NSString *ApplicationVersion = [NSString stringWithFormat:@"Application Version: %@", [SystemSharedServices applicationVersion]];
    NSString *ClipboardContent = [NSString stringWithFormat:@"ClipBoard Content: \"%@\"", [SystemSharedServices clipboardContent]];
    NSString *UniqueID = [NSString stringWithFormat:@"Unique ID: %@", [SystemSharedServices uniqueID]];
    NSString *DeviceSignature = [NSString stringWithFormat:@"Device Signature: %@", [SystemSharedServices deviceSignature]];
    NSString *CFUUID = [NSString stringWithFormat:@"CFUUID: %@", [SystemSharedServices cfuuid]];
    
    // Make an array of all the hardware information
    NSArray *arrayofHW = [[NSArray alloc] initWithObjects:SystemUptime, DeviceModel, DeviceName, SystemName, SystemVersion, SystemDeviceTypeFormattedNO, SystemDeviceTypeFormattedYES, ScreenWidth, ScreenHeight, ScreenBrightness, MultitaskingEnabled, ProximitySensorEnabled, DebuggerAttached, PluggedIn, Jailbroken, NumberProcessors, NumberActiveProcessors, ProcessorSpeed, ProcessorBusSpeed, AccessoriesAttached, HeadphonesAttached, NumberAttachedAccessories, NameAttachedAccessories, BatteryLevel, Charging, FullyCharged, DeviceOrientation, Country, Language, TimeZone, Currency, ApplicationVersion, ClipboardContent, UniqueID, DeviceSignature, CFUUID, nil];
    
    // Run through all the information
    for (NSString *objects in arrayofHW) {
        if (![self.TextView.text isEqualToString:@""]) {
            // Output all the names and values to the textview
            self.TextView.text = [NSString stringWithFormat:@"%@\n%@", self.TextView.text, objects];
        } else {
            // Output all the names and values to the textview
            self.TextView.text = [NSString stringWithFormat:@"%@", objects];
        }
    }
    
    // End of this
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)refresh:(id)sender {
    // Reload the hardware info
    [self getAllHardwareInformation];
}
@end
