//
//  ViewController.m
//  googleMapKitApp
//
//  Created by Aditya Kumar on 20/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>
@import GooglePlaces;

@interface ViewController ()<GMSMapViewDelegate>
{
    GMSPlacesClient* _placeClient;
    
    CLLocationManager* locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadView
{
    [super loadView];
    locationManager = [[CLLocationManager alloc]init];
    
    
    GMSCameraPosition* cameraPosition = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude zoom:16];
    GMSMapView* mapView = [GMSMapView mapWithFrame:CGRectZero camera:cameraPosition];
    mapView.myLocationEnabled = YES;
    [mapView setDelegate:self];
    self.view = mapView;
    
    
    GMSMarker* marker = [[GMSMarker alloc]init];
    marker.position = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
    

    marker.map = mapView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position
{
    [mapView setCamera:position];

}

@end
