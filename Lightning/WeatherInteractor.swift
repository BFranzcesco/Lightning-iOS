import Foundation

class WeatherInteractor: WeatherServiceDelegate, LocationDelegate {

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

    func weather() {
        geolocator.getCurrentLocation()
    }

    //MARK: - ServiceDelegate

    func onDataReceived(data: Data) {
        let weather = Converter().dataToWeather(weatherData: data)
        delegate.present(weather: weather)
    }

    func onError() {
        delegate.presentError()
    }

    //MARK: - LocationDelegate

    func onLocationServicesDisabled() {
        delegate.presentError()
    }

    func onLocationGot(location: Location) {
        service.getWeatherDataBasedOnLocation(location: location)
    }
}
