import UIKit

class WeatherPresenter: WeatherInteractorDelegate {

    let view: WeatherView

    init(view: WeatherView) {
        self.view = view
    }

    func present(weather: Weather) {
        let cityName = weather.cityName!
        let icon = getIcon(for: weather)
        let theme = weather.isDayTime() ? WeatherTheme.Day : WeatherTheme.Night
        let temperature = String(format: "%.1f", weather.temperature!) + Utils().symbolBasedOnLocalUnits()
        let description = weather.description!.capitalized

        let displayedWeather = DisplayedWeather(cityName: cityName, icon: icon, theme: theme, temperature: temperature, description: description)

        view.show(weather: displayedWeather)
    }

    func presentError() {
        view.showError()
    }

    private func getIcon(for weather: Weather) -> UIImage {
        return UIImage(named: WeatherImage().name(from: weather))!
    }
}
