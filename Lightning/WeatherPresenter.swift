class WeatherPresenter: WeatherInteractorDelegate {

    let view: WeatherView

    init(view: WeatherView) {
        self.view = view
    }

    func present(weather: Weather) {
        view.show(weather: weather)
    }

    func presentError() {
        view.showError()
    }
}
