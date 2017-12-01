import XCTest
@testable import Lightning

class WeatherCodeTests: XCTestCase {

    func testTwo() {
        let weather = weatherWith(id: 203)

        let weatherID = WeatherCodeHandler().code(from: weather)

        XCTAssertEqual(WeatherCode.THUNDER, weatherID)
    }

    func testThree() {
        let weather = weatherWith(id: 304)

        let weatherID = WeatherCodeHandler().code(from: weather)

        XCTAssertEqual(WeatherCode.DRIZZLE, weatherID)
    }

    func test800() {
        let weather = weatherWith(id: 800)

        let weatherID = WeatherCodeHandler().code(from: weather)

        XCTAssertEqual(WeatherCode.CLEAR, weatherID)
    }

    func test8() {
        let weather = weatherWith(id: 803)

        let weatherID = WeatherCodeHandler().code(from: weather)

        XCTAssertEqual(WeatherCode.CLOUDY, weatherID)
    }

    func test801() {
        let weather = weatherWith(id: 801)

        let weatherID = WeatherCodeHandler().code(from: weather)

        XCTAssertEqual(WeatherCode.FEW_CLOUDS, weatherID)
    }

    func test802() {
        let weather = weatherWith(id: 802)

        let weatherID = WeatherCodeHandler().code(from: weather)

        XCTAssertEqual(WeatherCode.SCATTERED_CLOUDS, weatherID)
    }

    private func weatherWith(id: Int) -> Weather {
        return Weather(cityName: "A_CITY_NAME", temperature: 12.00, description: "A_DESCRIPTION", sunriseTime: 0.0, sunsetTime: 1.0, id: id)
    }
}

