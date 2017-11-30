protocol WeatherInteractorDelegate: class {
    func present(weather: Weather)
    func presentError()
}
