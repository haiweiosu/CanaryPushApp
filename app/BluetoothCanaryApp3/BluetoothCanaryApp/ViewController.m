//
//  ViewController.m
//  BluetoothCanaryApp
//
//  Created by Jeff Ponnor and Haiwei Su on 10/23/15.
//  Copyright © 2015 Jeff Ponnor. All rights reserved.
//

#import "ViewController.h"
#import "CBManagerDelegate.h"

@interface ViewController ()
@property CBManagerDelegate *CBC;
@property (weak, nonatomic) IBOutlet UILabel *signalLevelLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *signalSlider;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.CBC = [CBManagerDelegate alloc];
    
    if(self.CBC){
        self.CBC.cBCM = [[CBCentralManager alloc] initWithDelegate:self.CBC queue:nil];
        
        
    }
    
    //set NSUserStart
    NSInteger startSignal = 0;
    [[NSUserDefaults standardUserDefaults] setInteger:startSignal forKey:@"Start"];

    
    
    
}
- (IBAction)generateList:(id)sender {

    if(    [[NSUserDefaults standardUserDefaults] integerForKey:@"Start"] == 0){
    [self.CBC.cBCM scanForPeripheralsWithServices:nil options:nil];
    }
    else{
        
        //display signal level
        NSNumber *signalLevel = [[NSUserDefaults standardUserDefaults] objectForKey:@"Signal"];
        self.signalLevelLabel.text = [signalLevel stringValue];
        if([signalLevel doubleValue]>-50){
            self.statusLabel.text = @"Canary Disarmed";
        }
        
        else{
            self.statusLabel.text = @"Canary Armed";
            
            
        
        }
        
        //restart search
        NSInteger startSignal = 0;
        [[NSUserDefaults standardUserDefaults] setInteger:startSignal forKey:@"Start"];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


