import XCTest
@testable import Lightning

class WeatherPresenterTests: XCTestCase {

    let weather = Weather(cityName: "A_CITY_NAME", temperature: 12.00, description: "A_DESCRIPTION", sunriseTime: 1, sunsetTime: 2, weatherID: 200)

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
        var displayedWeather = DisplayedWeather(cityName: "", icon: UIImage(), theme: WeatherTheme.Day, temperature: "", description: "")

        func show(weather: DisplayedWeather) {
            displayedWeather = weather
            showWeatherIsCalled = true
        }

        func showError() {
            showErrorIsCalled = true
        }
    }
    
}
