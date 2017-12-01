import XCTest
@testable import Lightning

class WeatherImageHandlerTests: XCTestCase {

    func testWhenIsClearImageNameIsClear() {
        let weather = weatherWith(id: 800, sunsetTime: 2000000000.0)

        let weatherImageName = WeatherImage().name(from: weather)

        XCTAssertEqual(weatherImageName, "clear")
    }

    func testWhenIsThunderImageNameIsThunder() {
        let weather = weatherWith(id: 200)

        let weatherImageName = WeatherImage().name(from: weather)

        XCTAssertEqual(weatherImageName, "thunder")
    }

    func testWhenIsRainyImageNameIsRainy() {
        let weather = weatherWith(id: 500)

        let weatherImageName = WeatherImage().name(from: weather)

        XCTAssertEqual(weatherImageName, "rainy")
    }

    func testWhenIsClearAndIsNotDayImageNameIsClearMoon() {
        let weather = weatherWith(id: 800)

        let weatherImageName = WeatherImage().name(from: weather)

        XCTAssertEqual(weatherImageName, "clear_moon")
    }

    private func weatherWith(id: Int, sunsetTime: Double = 1.0) -> Weather {
        return Weather(cityName: "A_CITY_NAME", temperature: 12.00, description: "A_DESCRIPTION", sunriseTime: 0.0, sunsetTime: sunsetTime, id: id)
    }
}

