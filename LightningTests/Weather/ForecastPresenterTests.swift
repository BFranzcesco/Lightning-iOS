
import XCTest
@testable import Lightning

class ForecastPresenterTests: XCTestCase {

    let forecast = [ForecastWeather(temperature: 12.0, description: "A_DESCRIPTION", date: 1512553697, id: 800)]

    var view = SpyForecastView()

    func testShowErrorWhenLocationServicesDisabled() {
        let presenter = ForecastPresenter(view: view)

        presenter.present(forecast: forecast)

        XCTAssertTrue(view.showForecastIsCalled)
        XCTAssertFalse(view.showErrorIsCalled)
    }

    func testShowForecastIsCalledWhenServiceSuccess() {
        let presenter = ForecastPresenter(view: view)

        presenter.presentError()

        XCTAssertTrue(view.showErrorIsCalled)
        XCTAssertFalse(view.showForecastIsCalled)
    }

    func testDisplayedForecastCreation() {
        let presenter = ForecastPresenter(view: view)

        presenter.present(forecast: forecast)

        XCTAssertEqual("A_Description", view.displayedForecast[0].description)
        XCTAssertEqual("12.0°F", view.displayedForecast[0].temperature)
        XCTAssertEqual(UIImage(named: WeatherImage().name(from: forecast[0])), view.displayedForecast[0].icon)
    }

    class SpyForecastView: ForecastView {

        var showForecastIsCalled = false
        var showErrorIsCalled = false
        var displayedForecast = [DisplayedForecastWeather(icon: UIImage(), date: "", temperature: "", description: "")]

        func show(forecast: [DisplayedForecastWeather]) {
            displayedForecast = forecast
            showForecastIsCalled = true
        }

        func showError() {
            showErrorIsCalled = true
        }
    }

}
