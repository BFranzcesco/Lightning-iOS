class WeatherCodeHandler {
    
    func getWeatherCodeFrom(code: Int) -> WeatherCode {
        if (isMostlyClear(code)) {
            return WeatherCode(rawValue: code)!
        }
        return simplify(code)
    }
    
    func isMostlyClear(code: Int) -> Bool {
        return code == 800 || code==801 || code==802
    }
    
    func simplify(code: Int) -> WeatherCode {
        let code = code/100
        return WeatherCode(rawValue: code)!
    }
}