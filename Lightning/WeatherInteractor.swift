import Foundation

class WeatherInteractor: WeatherServiceDelegate, LocationProtocol {

    let service: WeatherService
    let geolocator: GeoLocator
    let delegate: WeatherInteractorDelegate

    init(service: WeatherService, geolocator: GeoLocator, delegate: WeatherInteractorDelegate) {
        self.service = service
        self.geolocator = geolocator
        self.delegate = delegate
        service.delegate = self
        geolocator.delegate = self
    }

    func onDataReceived(data: Data) {
        let weather = Converter().convertDataToWeather(weatherData: data)
        delegate.present(weather: weather)
    }

    func onError() {
        delegate.presentError()
    }

    func onLocationServicesDisabled() {
        delegate.presentError()
    }

    func onLocationGot(location: Location) {
        service.getWeatherDataBasedOnLocation(location: location)
    }

    func weather() {
        geolocator.getCurrentLocation()
    }
}
