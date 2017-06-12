//
//  ViewController.m
//  MapLocationApp
//
//  Created by Aditya Kumar on 31/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CLLocationManagerDelegate>
@end

#define METERS_MILE 1609.344
#define METERS_FEET 3.28084

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self mapView] setShowsUserLocation:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    [[self locationManager] setDelegate:self];
    
    // we have to setup the location manager with permission in later iOS versions
    if ([[self locationManager] respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [[self locationManager] requestWhenInUseAuthorization];
    }
    
    [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    [[self locationManager] startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = locations.lastObject;
    [[self labelLatitude] setText:[NSString stringWithFormat:@"%.6f",
                                   location.coordinate.latitude]];
    [[self labelLongitude] setText:[NSString stringWithFormat:@"%.6f",
                                    location.coordinate.longitude]];
    [[self labelAltitude] setText:[NSString stringWithFormat:@"%.2f feet",
                                   location.altitude*METERS_FEET]];
    
    // zoom the map into the users current location
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance
    (location.coordinate, 2*METERS_MILE, 2*METERS_MILE);
    [[self mapView] setRegion:viewRegion animated:YES];
}


@end
