import XCTest
@testable import Lightning

class WeatherIconTests: XCTestCase {
    
    func testWhenIsClearImageNameIsClear() {
        let weatherCode = WeatherCode.CLEAR
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weatherCode, sunriseTime: 0.0, sunsetTime: 1.0)
        
        XCTAssertEqual(weatherImageName, "clear")
    }
    
    func testWhenIsThunderImageNameIsThunder() {
        let weatherCode = WeatherCode.THUNDER
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weatherCode, sunriseTime: 0.0, sunsetTime: 1.0)
        
        XCTAssertEqual(weatherImageName, "thunder")
    }
    
    func testWhenIsRainyImageNameIsRainy() {
        let weatherCode = WeatherCode.RAINY
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weatherCode, sunriseTime: 0.0, sunsetTime: 1.0)
        
        XCTAssertEqual(weatherImageName, "rainy")
    }
    
    func testWhenIsClearAndIsNotDayImageNameIsClearMoon() {
        let weatherCode = WeatherCode.CLEAR
        
        let weatherImageName = WeatherImageHandler().getImageNameFrom(weatherCode, sunriseTime: 0.0, sunsetTime: 1.0, isDayTime: true)
        
        XCTAssertEqual(weatherImageName, "clear_moon")
    }
}
