import XCTest
@testable import Lightning

class WeatherCodeTests: XCTestCase {
    
    func testTwo() {
        let code = 203
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.THUNDER, weatherID)
    }
    
    func testThree() {
        let code = 304
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.DRIZZLE, weatherID)
    }
    
    func test800() {
        let code = 800
            
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(code)
            
        XCTAssertEqual(WeatherCode.CLEAR, weatherID)
    }
    
    func test8() {
        let code = 803
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.CLOUDY, weatherID)
    }
    
    func test801() {
        let code = 801
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.FEW_CLOUDS, weatherID)
    }
    
    func test802() {
        let code = 802
        
        let weatherID = WeatherCodeHandler().getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.SCATTERED_CLOUDS, weatherID)
    }
}
