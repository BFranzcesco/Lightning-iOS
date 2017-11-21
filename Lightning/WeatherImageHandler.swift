import Foundation

class WeatherImageHandler {
    
    func getImageNameFrom(weatherCode: WeatherCode, sunriseTime: Double, sunsetTime: Double, isDayTime: Bool = false) -> String {
        let MOON = "_moon"
        if(WeatherCodeHandler().isMostlyClear(code: weatherCode.rawValue)) {
            if (!isDay(sunriseTime: sunriseTime, sunsetTime: sunsetTime) || isDayTime) {
                var imageName = WeatherImageName[weatherCode]!
                imageName.append(MOON)
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
