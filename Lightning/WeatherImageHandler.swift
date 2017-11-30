import Foundation

class WeatherImageHandler {

    let MOON = "_moon"

    func getImageNameFrom(weatherCode: WeatherCode, sunriseTime: Double, sunsetTime: Double) -> String {

        if(WeatherCodeHandler().isMostlyClear(code: weatherCode.rawValue)) {
            if (!isDay(sunriseTime: sunriseTime, sunsetTime: sunsetTime)) {
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
