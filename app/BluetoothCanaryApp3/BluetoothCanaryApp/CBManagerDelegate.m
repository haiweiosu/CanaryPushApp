//
//  CBManagerDelegate.m
//  BluetoothCanaryApp
//
//  Created by Jeff Ponnor and Haiwei Su on 10/23/15.
//  Copyright © 2015 Jeff Ponnor. All rights reserved.
//

#import "CBManagerDelegate.h"

//#define tile_id        @"196F0073-EF76-B2D9-DB07-85D81288C56B"
//#define tile_id         @"


@implementation CBManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
    self.cBReady = false;
    switch (central.state) {
        case CBCentralManagerStatePoweredOff:
            NSLog(@"CoreBluetooth BLE hardware is powered off");
            break;
        case CBCentralManagerStatePoweredOn:
            NSLog(@"CoreBluetooth BLE hardware is powered on and ready");
            self.cBReady = true;
            break;
        case CBCentralManagerStateResetting:
            NSLog(@"CoreBluetooth BLE hardware is resetting");
            break;
        case CBCentralManagerStateUnauthorized:
            NSLog(@"CoreBluetooth BLE state is unauthorized");
            break;
        case CBCentralManagerStateUnknown:
            NSLog(@"CoreBluetooth BLE state is unknown");
            break;
        case CBCentralManagerStateUnsupported:
            NSLog(@"CoreBluetooth BLE hardware is unsupported on this platform");
            break;
        default:
            break;
    }
}

- (void) centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
        //NSLog(@"Did discover peripheral. peripheral: %@ rssi: %@, UUID: %@ advertisementData: %@ ", peripheral, RSSI,peripheral.identifier.UUIDString, advertisementData);
        //Do something when a peripheral is discovered.
        //BC Beacon
    if([peripheral.name isEqualToString:@"estimote"]){
        NSLog(@"RSSI Distance: %@",RSSI);
        [[NSUserDefaults standardUserDefaults] setObject:RSSI forKey:@"Signal"];
        
        //if beacon detected stop search
        //set NSUserStart
        NSInteger startSignal = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:startSignal forKey:@"Start"];

    }
   

    
    
    }


    


@end
