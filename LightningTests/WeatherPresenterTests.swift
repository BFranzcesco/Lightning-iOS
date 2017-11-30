import XCTest
@testable import Lightning

class WeatherPresenterTests: XCTestCase {

    let weather = Weather(cityName: "A_CITY_NAME", temperature: 12.00, description: "A_DESCRIPTION", sunriseTime: 1, sunsetTime: 2, weatherID: 100)

    var view = SpyWeatherView()

    func testShowErrorWhenLocationServicesDisabled() {
        let presenter = WeatherPresenter(view: view)

        presenter.present(weather: weather)

        XCTAssertTrue(view.showWeatherIsCalled)
        XCTAssertFalse(view.showErrorIsCalled)
    }

    func testShowWeatherIsCalledWhenServiceSuccess() {
        let presenter = WeatherPresenter(view: view)

        presenter.presentError()

        XCTAssertTrue(view.showErrorIsCalled)
        XCTAssertFalse(view.showWeatherIsCalled)
    }

    class SpyWeatherView: WeatherView {

        var showWeatherIsCalled = false
        var showErrorIsCalled = false

        func show(weather: Weather) {
            showWeatherIsCalled = true
        }

        func showError() {
            showErrorIsCalled = true
        }
    }
    
}
