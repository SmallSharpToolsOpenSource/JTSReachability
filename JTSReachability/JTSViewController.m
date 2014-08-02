//
//  JTSViewController.m
//  JTSReachability
//
//  Created by Brennan Stehling on 8/1/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSViewController.h"

#import "JTSReachabilityResponder.h"

@interface JTSViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation JTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.statusLabel.text = @"Checking status...";
    
    JTSReachabilityResponder *responder = [JTSReachabilityResponder sharedInstance];
    [responder addHandler:^(JTSNetworkStatus status) {
        [self updateStatus:status];
    } forKey:@"MyReachabilityKey"];
    
    [self updateStatus:[[JTSReachabilityResponder sharedInstance] networkStatus]];
}

- (void)dealloc {
    JTSReachabilityResponder *responder = [JTSReachabilityResponder sharedInstance];
    [responder removeHandlerForKey:@"MyReachabilityKey"];
}

- (void)updateStatus:(JTSNetworkStatus)status {
    switch (status) {
        case NotReachable:
            self.statusLabel.text = @"Not Reachable";
            break;
        case ReachableViaWiFi:
            self.statusLabel.text = @"WiFi";
            break;
        case ReachableViaWWAN:
            self.statusLabel.text = @"WWAN";
            break;
            
        default:
            NSAssert(FALSE, @"Condition is not defined");
            self.statusLabel.text = @"Unknown";
            break;
    }
}

@end
