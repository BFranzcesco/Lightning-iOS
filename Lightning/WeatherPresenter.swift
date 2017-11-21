import Foundation

class WeatherPresenter: WeatherServiceDelegate {

    let service: WeatherService
    weak var view: WeatherView?

    init(service: WeatherService, view: WeatherView) {
        self.service = service
        self.view = view
        service.delegate = self
    }

    func weather(for location: Location) {
        service.getWeatherDataBasedOnLocation(location: location)
    }

    func onDataReceived(data: Data) {
        let weather = Converter().convertDataToWeather(weatherData: data)
        view?.show(weather: weather)
    }

    func onError() {
        view?.showError()
    }
}
