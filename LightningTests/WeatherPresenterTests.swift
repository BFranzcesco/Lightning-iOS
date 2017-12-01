import XCTest
@testable import Lightning

class WeatherPresenterTests: XCTestCase {

    let weather = Weather(cityName: "A_CITY_NAME", temperature: 12.0, description: "A_DESCRIPTION", sunriseTime: 10, sunsetTime: 2000000000.0, weatherID: 200)

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

    func testDisplayedWeatherCreation() {
        let presenter = WeatherPresenter(view: view)

        presenter.present(weather: weather)

        XCTAssertEqual("A_CITY_NAME", view.displayedWeather.cityName)
        XCTAssertEqual("A_Description", view.displayedWeather.description)
        XCTAssertEqual("12.0°F", view.displayedWeather.temperature)
        XCTAssertEqual(UIImage(named: WeatherImageHandler().getImageNameFrom(weather: weather)), view.displayedWeather.icon)
        XCTAssertTrue(WeatherTheme.Day == view.displayedWeather.theme)
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
