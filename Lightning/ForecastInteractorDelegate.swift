protocol ForecastInteractorDelegate: class {
    func present(forecast: [ForecastWeather])
    func presentError()
}
