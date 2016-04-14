import XCTest
@testable import Lightning

class WeatherCodesTests: XCTestCase {
    
    enum WeatherCode: Int {
        case THUNDER = 2
        case DRIZZLE = 3
        case FOGGY = 7
        case CLEAR = 800
        case FEW_CLOUDS = 801
        case SCATTERED_CLOUDS = 802
        case CLOUDY = 8
        case SNOWY = 6
        case RAINY = 5
    }
    
    func testTwo() {
        let code = 203
        
        let weatherID = getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.THUNDER, weatherID)
    }
    
    func testThree() {
        let code = 304
        
        let weatherID = getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.DRIZZLE, weatherID)
    }
    
    func test800() {
        let code = 800
            
        let weatherID = getWeatherCodeFrom(code)
            
        XCTAssertEqual(WeatherCode.CLEAR, weatherID)
    }
    
    func test8() {
        let code = 803
        
        let weatherID = getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.CLOUDY, weatherID)
    }
    
    func test801() {
        let code = 801
        
        let weatherID = getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.FEW_CLOUDS, weatherID)
    }
    
    func test802() {
        let code = 802
        
        let weatherID = getWeatherCodeFrom(code)
        
        XCTAssertEqual(WeatherCode.SCATTERED_CLOUDS, weatherID)
    }
    
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
