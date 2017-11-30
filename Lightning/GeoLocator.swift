import Foundation
import CoreLocation

class GeoLocator: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var delegate: LocationDelegate?
    
    func getCurrentLocation() {
        
        if(!areLocationServiceEnabled() && !Utils().isAppFirstLaunch()) {
            self.delegate!.onLocationServicesDisabled()
        } else {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let latitude = locationObj.coordinate.latitude
        let longitude = locationObj.coordinate.longitude

        let location = Location(latitude: latitude, longitude: longitude, cityName: "")

        self.delegate!.onLocationGot(location: location)
    }
    
    func areLocationServiceEnabled() -> Bool {
        if (CLLocationManager.locationServicesEnabled()) {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                    return false
                case .authorizedAlways, .authorizedWhenInUse:
                    return true
            }
        }
        return false
    }
}
