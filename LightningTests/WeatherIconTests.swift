import XCTest
@testable import Lightning

class WeatherIconTests: XCTestCase {
    
    var WeatherImageName: [WeatherCode: String] = [
        WeatherCode.THUNDER: "thunder",
        WeatherCode.DRIZZLE: "drizzle",
        WeatherCode.FOGGY: "foggy",
        WeatherCode.CLEAR: "clear",
        WeatherCode.FEW_CLOUDS: "partly_cloudy",
        WeatherCode.SCATTERED_CLOUDS: "partly_cloudy",
        WeatherCode.CLOUDY: "cloudy",
        WeatherCode.SNOWY: "snowy",
        WeatherCode.RAINY: "rainy"
    ]
    
    func testWhenIsClearImageNameIsClear() {
        let weatherCode = WeatherCode.CLEAR
        
        let weatherImageName = getImageNameFrom(weatherCode)
        
        XCTAssertEqual(weatherImageName, "clear")
    }
    
    func testWhenIsThunderImageNameIsThunder() {
        let weatherCode = WeatherCode.THUNDER
        
        let weatherImageName = getImageNameFrom(weatherCode)
        
        XCTAssertEqual(weatherImageName, "thunder")
    }
    
    func testWhenIsRainyImageNameIsRainy() {
        let weatherCode = WeatherCode.RAINY
        
        let weatherImageName = getImageNameFrom(weatherCode)
        
        XCTAssertEqual(weatherImageName, "rainy")
    }
    
    func getImageNameFrom(weatherCode: WeatherCode) -> String {
        return WeatherImageName[weatherCode]!
    }
}
