import Foundation

class WeatherImageHandler {

    let MOON = "_moon"

    func getImageNameFrom(weather: Weather) -> String {

        let weatherCode = WeatherCodeHandler().getWeatherCodeFrom(id: weather.weatherID!)

        if(WeatherCodeHandler().isMostlyClear(id: weather.weatherID!)) {
            if (!weather.isDayTime()) {
                var imageName = WeatherImageName[weatherCode]!
                imageName.append(MOON)
                return imageName
            }
        }
        return WeatherImageName[weatherCode]!
    }
}
