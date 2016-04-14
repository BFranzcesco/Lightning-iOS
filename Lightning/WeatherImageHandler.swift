import Foundation

class WeatherImageHandler {
    
    let context: DateUtils
    
    init(managedObjectContext: DateUtils) {
        self.context = managedObjectContext
    }
    
    func getImageNameFrom(weatherCode: WeatherCode, sunriseTime: Double, sunsetTime: Double, isDayTime: Bool = false) -> String {
        let MOON = "_moon"
        if(WeatherCodeHandler().isMostlyClear(weatherCode.rawValue)) {
            if (!isDay(sunriseTime, sunsetTime: sunsetTime) || isDayTime) {
                var imageName = WeatherImageName[weatherCode]!
                imageName.appendContentsOf(MOON)
                return imageName
            }
        }
        return WeatherImageName[weatherCode]!
    }
    
    func isDay(sunriseTime: Double, sunsetTime: Double) -> Bool {
        let currentTime = NSDate().timeIntervalSince1970
        return currentTime >= sunriseTime && currentTime < sunsetTime
    }
}