import XCTest
@testable import Lightning

class WeatherPresenterTests: XCTestCase {

    var service = FakeWeatherService()
    var geolocator = FakeGeolocator()
    var view = SpyWeatherView()

    func testCallGeolocatorWhenAskedForWeather() {
        let presenter = WeatherPresenter(service: service, geolocator: geolocator, view: view)

        presenter.weather()

        XCTAssertTrue(geolocator.getCurrentLocationIsCalled)
    }

    func testCallServiceWhenLocationGot() {
        let presenter = WeatherPresenter(service: service, geolocator: geolocator, view: view)

        presenter.weather()

        XCTAssertTrue(service.getWeatherDataBasedOnLocationIsCalled)
    }

    func testShowErrorWhenLocationServicesDisabled() {
        geolocator.locationServicesShouldBeDisabled = true
        let presenter = WeatherPresenter(service: service, geolocator: geolocator, view: view)

        presenter.weather()

        XCTAssertTrue(view.showErrorIsCalled)
    }

    func testShowWeatherIsCalledWhenServiceSuccess() {
        let presenter = WeatherPresenter(service: service, geolocator: geolocator, view: view)
        presenter.weather()

        XCTAssertTrue(view.showWeatherIsCalled)
        XCTAssertFalse(view.showErrorIsCalled)
    }

    func testShowErrorIsCalledWhenServiceFailure() {
        service.shouldFail = true
        let presenter = WeatherPresenter(service: service, geolocator: geolocator, view: view)

        presenter.weather()

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

    class FakeGeolocator: GeoLocator {
        let location = Location(latitude: 12.00, longitude: 12.00, cityName: "A_CITY_NAME")

        var locationServicesShouldBeDisabled = false
        var getCurrentLocationIsCalled = false

        override func getCurrentLocation() {
            getCurrentLocationIsCalled = true
            if(locationServicesShouldBeDisabled) {
                delegate?.onLocationServicesDisabled()
                return
            }

            delegate?.onLocationGot(location: location)
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
