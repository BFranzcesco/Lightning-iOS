import XCTest
@testable import Lightning

class WeatherCodeTests: XCTestCase {
    
    func testTwo() {
        let id = 203
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(id: id)
        
        XCTAssertEqual(WeatherCode.THUNDER, weatherID)
    }
    
    func testThree() {
        let id = 304
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(id: id)
        
        XCTAssertEqual(WeatherCode.DRIZZLE, weatherID)
    }
    
    func test800() {
        let id = 800
            
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(id: id)
            
        XCTAssertEqual(WeatherCode.CLEAR, weatherID)
    }
    
    func test8() {
        let id = 803
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(id: id)
        
        XCTAssertEqual(WeatherCode.CLOUDY, weatherID)
    }
    
    func test801() {
        let id = 801
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(id: id)
        
        XCTAssertEqual(WeatherCode.FEW_CLOUDS, weatherID)
    }
    
    func test802() {
        let id = 802
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(id: id)
        
        XCTAssertEqual(WeatherCode.SCATTERED_CLOUDS, weatherID)
    }
}
