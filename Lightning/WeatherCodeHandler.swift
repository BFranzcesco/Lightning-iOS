class WeatherCodeHandler {
    
    func code(from weather: Weather) -> WeatherCode {
        if (weather.isMostlyClear()) {
            return WeatherCode(rawValue: weather.id!)!
        }
        return simplify(id: weather.id!)
    }
    
    private func simplify(id: Int) -> WeatherCode {
        let id = id/100
        return WeatherCode(rawValue: id)!
    }
}
