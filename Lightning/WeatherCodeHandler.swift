class WeatherCodeHandler {
    
    func code(from weather: Weather) -> WeatherCode {
        if (weather.isMostlyClear()) {
            return WeatherCode(rawValue: weather.id!)!
        }
        return simplify(id: weather.id!)
    }
    
    func code(from forecastWeather: ForecastWeather) -> WeatherCode {
        if (forecastWeather.isMostlyClear()) {
            return WeatherCode(rawValue: forecastWeather.id!)!
        }
        return simplify(id: forecastWeather.id!)
    }
    
    private func simplify(id: Int) -> WeatherCode {
        let id = id/100
        return WeatherCode(rawValue: id)!
    }
}
