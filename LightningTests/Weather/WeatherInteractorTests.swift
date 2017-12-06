import XCTest
@testable import Lightning

class WeatherInteractorTests: XCTestCase {

    var service = FakeWeatherService()
    var geolocator = FakeGeolocator()
    var delegate = SpyWeatherInteractorDelegate()

    func testCallGeolocatorWhenAskedForWeather() {
        let interactor = WeatherInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.weather()

        XCTAssertTrue(geolocator.getCurrentLocationIsCalled)
    }

    func testCallServiceWhenLocationGot() {
        let interactor = WeatherInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.weather()

        XCTAssertTrue(service.getWeatherDataBasedOnLocationIsCalled)
    }

    func testShowErrorWhenLocationServicesDisabled() {
        geolocator.locationServicesShouldBeDisabled = true
        let interactor = WeatherInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.weather()

        XCTAssertTrue(delegate.presentErrorIsCalled)
    }

    func testShowWeatherIsCalledWhenServiceSuccess() {
        let interactor = WeatherInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.weather()

        XCTAssertTrue(delegate.presentWeatherIsCalled)
        XCTAssertFalse(delegate.presentErrorIsCalled)
    }

    func testShowErrorIsCalledWhenServiceFailure() {
        service.shouldFail = true
        let interactor = WeatherInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.weather()

        XCTAssertTrue(delegate.presentErrorIsCalled)
        XCTAssertFalse(delegate.presentWeatherIsCalled)
    }

    class FakeWeatherService: WeatherService {
        var shouldFail = false
        var getWeatherDataBasedOnLocationIsCalled = false

        override func weatherData(basedOn location: Location) {
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

    class SpyWeatherInteractorDelegate: WeatherInteractorDelegate {

        var presentWeatherIsCalled = false
        var presentErrorIsCalled = false

        func present(weather: Weather) {
            presentWeatherIsCalled = true
        }

        func presentError() {
            presentErrorIsCalled = true
        }
    }

}

