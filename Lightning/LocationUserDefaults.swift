import Foundation

class LocationUserDefaults {

    let preferences = NSUserDefaults.standardUserDefaults()
    let LATITUDE_KEY = "latitude_ud_key"
    let LONGITUDE_KEY = "longitude_ud_key"
    
    func store(location: Location) {
        preferences.setDouble(location.latitude!, forKey: LATITUDE_KEY)
        preferences.setDouble(location.longitude!, forKey: LONGITUDE_KEY)
        preferences.synchronize()
    }
    
    func read() -> Location {
        let latitude = preferences.doubleForKey(LATITUDE_KEY)
        let longitude = preferences.doubleForKey(LONGITUDE_KEY)
        
        return Location(latitude: latitude, longitude: longitude)
    }
    
}