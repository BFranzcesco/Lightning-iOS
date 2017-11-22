import Foundation

class WeatherPresenter: WeatherServiceDelegate, LocationProtocol {

    let service: WeatherService
    let geolocator: GeoLocator
    weak var view: WeatherView?

    init(service: WeatherService, geolocator: GeoLocator, view: WeatherView) {
        self.service = service
        self.geolocator = geolocator
        self.view = view
        service.delegate = self
        geolocator.delegate = self
    }

    func weather() {
        geolocator.getCurrentLocation()
    }

    func onDataReceived(data: Data) {
        let weather = Converter().convertDataToWeather(weatherData: data)
        view?.show(weather: weather)
    }

    func onError() {
        view?.showError()
    }

    func onLocationGot(location: Location) {
        service.getWeatherDataBasedOnLocation(location: location)
    }

    func onLocationServicesDisabled() {
        view?.showError()
    }
}
