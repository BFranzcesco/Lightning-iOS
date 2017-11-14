import Foundation

class LocationUserDefaults {

    let preferences = UserDefaults.standard
    let LATITUDE_KEY = "latitude_ud_key"
    let LONGITUDE_KEY = "longitude_ud_key"
    let CITY_NAME_KEY = "city_name_ud_key"
    
    func store(location: Location) {
        preferences.set(location.latitude!, forKey: LATITUDE_KEY)
        preferences.set(location.longitude!, forKey: LONGITUDE_KEY)
        preferences.setValue(location.cityName!, forKey: CITY_NAME_KEY)
        preferences.synchronize()
    }
    
    func read() -> Location {
        let latitude = preferences.double(forKey: LATITUDE_KEY)
        let longitude = preferences.double(forKey: LONGITUDE_KEY)
        let cityName = preferences.string(forKey: CITY_NAME_KEY)
        
        return Location(latitude: latitude, longitude: longitude, cityName: cityName)
    }
    
}
