import XCTest
@testable import Lightning

class ForecastInteractorTests: XCTestCase {

    var service = FakeForecastService()
    var geolocator = FakeGeolocator()
    var delegate = SpyForecastInteractorDelegate()

    func testCallGeolocatorWhenAskedForWeather() {
        let interactor = ForecastInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.forecast()

        XCTAssertTrue(geolocator.getCurrentLocationIsCalled)
    }

    func testCallServiceWhenLocationGot() {
        let interactor = ForecastInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.forecast()

        XCTAssertTrue(service.getForecastDataBasedOnLocationIsCalled)
    }

    func testShowErrorWhenLocationServicesDisabled() {
        geolocator.locationServicesShouldBeDisabled = true
        let interactor = ForecastInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.forecast()

        XCTAssertTrue(delegate.presentErrorIsCalled)
    }

    func testShowForecastIsCalledWhenServiceSuccess() {
        let interactor = ForecastInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.forecast()

        XCTAssertTrue(delegate.presentForecastIsCalled)
        XCTAssertFalse(delegate.presentErrorIsCalled)
    }

    func testShowErrorIsCalledWhenServiceFailure() {
        service.shouldFail = true
        let interactor = ForecastInteractor(service: service, geolocator: geolocator, delegate: delegate)

        interactor.forecast()

        XCTAssertTrue(delegate.presentErrorIsCalled)
        XCTAssertFalse(delegate.presentForecastIsCalled)
    }

    class FakeForecastService: ForecastService {
        var shouldFail = false
        var getForecastDataBasedOnLocationIsCalled = false

        override func forecast(basedOn location: Location) {
            getForecastDataBasedOnLocationIsCalled = true

            if (shouldFail) {
                delegate?.onError()
                return
            }
            delegate?.onDataReceived(data: [ForecastWeather]())
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

    class SpyForecastInteractorDelegate: ForecastInteractorDelegate {

        var presentForecastIsCalled = false
        var presentErrorIsCalled = false

        func present(forecast: [ForecastWeather]) {
            presentForecastIsCalled = true
        }

        func presentError() {
            presentErrorIsCalled = true
        }
    }

}


