class WeatherCodeHandler {
    
    func getWeatherCodeFrom(id: Int) -> WeatherCode {
        if (isMostlyClear(id: id)) {
            return WeatherCode(rawValue: id)!
        }
        return simplify(code: id)
    }
    
    func isMostlyClear(id: Int) -> Bool {
        return id == 800 || id == 801 || id == 802
    }
    
    func simplify(code: Int) -> WeatherCode {
        let code = code/100
        return WeatherCode(rawValue: code)!
    }
}
