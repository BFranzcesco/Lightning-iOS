import Foundation

class WeatherImage {

    let MOON = "_moon"

    func name(from weather: Weather) -> String {

        let weatherCode = WeatherCodeHandler().code(from: weather)

        if(weather.isMostlyClear()) {
            if (!weather.isDayTime()) {
                var imageName = WeatherImageName[weatherCode]!
                imageName.append(MOON)
                return imageName
            }
        }
        return WeatherImageName[weatherCode]!
    }
    
    func name(from forecastWeather: ForecastWeather) -> String {
        let weatherCode = WeatherCodeHandler().code(from: forecastWeather)
        return WeatherImageName[weatherCode]!
    }
}
