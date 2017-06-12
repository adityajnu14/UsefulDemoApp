//
//  ViewController.h
//  MapLocationApp
//
//  Created by Aditya Kumar on 31/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *labelLatitude;
@property (weak, nonatomic) IBOutlet UILabel *labelLongitude;
@property (weak, nonatomic) IBOutlet UILabel *labelAltitude;


@end

