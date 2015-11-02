//
//  CBManagerDelegate.h
//  BluetoothCanaryApp
//
//  Created by Jeff Ponnor and Haiwei Su on 10/23/15.
//  Copyright © 2015 Jeff Ponnor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CBManagerDelegate : NSObject 

@property (nonatomic, strong) CBCentralManager *cBCM;
@property bool cBReady;


- (void) centralManagerDidUpdateState:(CBCentralManager *)central;
- (void) centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;
- (void) centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral;
- (void) centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error;
- (void) centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error;
- (void) centralManager:(CBCentralManager *)central didRetrieveConnectedPeripherals:(NSArray *)peripherals;
- (void) centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals;


@end
