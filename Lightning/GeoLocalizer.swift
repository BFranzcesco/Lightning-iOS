import Foundation
import CoreLocation

class GeoLocalizer: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var delegate:LocationProtocol?
    
    func getCurrentLocation() {
        
        if(!areLocationServiceEnabled()) {
            self.delegate!.onLocationServicesDisabled()
        } else {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let latitude = locationObj.coordinate.latitude
        let longitude = locationObj.coordinate.longitude
        
        let location = Location(latitude: latitude, longitude: longitude)
        
        self.delegate!.onLocationGot(location)
    }
    
    func areLocationServiceEnabled() -> Bool {
        if (CLLocationManager.locationServicesEnabled()) {
            switch(CLLocationManager.authorizationStatus()) {
                case .NotDetermined, .Restricted, .Denied:
                    return false
                case .AuthorizedAlways, .AuthorizedWhenInUse:
                    return true
            }
        }
        return false
    }
}