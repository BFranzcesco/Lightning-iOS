import XCTest
@testable import Lightning

class WeatherImageHandlerTests: XCTestCase {
    
    func testWhenIsClearImageNameIsClear() {
        let weather = getWeatherWith(weatherId: 800, sunsetTime: 2000000000.0)
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weather: weather)
        
        XCTAssertEqual(weatherImageName, "clear")
    }
    
    func testWhenIsThunderImageNameIsThunder() {
        let weather = getWeatherWith(weatherId: 200)
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weather: weather)
        
        XCTAssertEqual(weatherImageName, "thunder")
    }
    
    func testWhenIsRainyImageNameIsRainy() {
        let weather = getWeatherWith(weatherId: 500)
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weather: weather)
        
        XCTAssertEqual(weatherImageName, "rainy")
    }
    
    func testWhenIsClearAndIsNotDayImageNameIsClearMoon() {
        let weather = getWeatherWith(weatherId: 800)
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weather: weather)
        
        XCTAssertEqual(weatherImageName, "clear_moon")
    }

    private func getWeatherWith(weatherId: Int, sunsetTime: Double = 1.0) -> Weather {
        return Weather(cityName: "A_CITY_NAME", temperature: 12.00, description: "A_DESCRIPTION", sunriseTime: 0.0, sunsetTime: sunsetTime, weatherID: weatherId)
    }
}
