import XCTest
@testable import Lightning

class WeatherPresenterTests: XCTestCase {

    var service = FakeWeatherService()
    var view = SpyWeatherView()
    let location = Location(latitude: 12.00, longitude: 12.00, cityName: "A_CITY_NAME")

    func testCallServiceWhenAskedForACityWeather() {
        let presenter = WeatherPresenter(service: service, view: view)

        presenter.weather(for: location)

        XCTAssertTrue(service.getWeatherDataBasedOnLocationIsCalled)
    }

    func testShowWeatherIsCalledWhenServiceSuccess() {
        let presenter = WeatherPresenter(service: service, view: view)
        presenter.weather(for: location)

        XCTAssertTrue(view.showWeatherIsCalled)
        XCTAssertFalse(view.showErrorIsCalled)
    }

    func testShowErrorIsCalledWhenServiceFailure() {
        service.shouldFail = true
        let presenter = WeatherPresenter(service: service, view: view)

        presenter.weather(for: location)

        XCTAssertTrue(view.showErrorIsCalled)
        XCTAssertFalse(view.showWeatherIsCalled)
    }

    class FakeWeatherService: WeatherService {
        var shouldFail = false
        var getWeatherDataBasedOnLocationIsCalled = false

        override func getWeatherDataBasedOnLocation(location: Location) {
            getWeatherDataBasedOnLocationIsCalled = true

            if (shouldFail) {
                delegate?.onError()
                return
            }
            delegate?.onDataReceived(data: Data())
        }
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
