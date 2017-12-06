import UIKit

class ForecastPresenter: ForecastInteractorDelegate {
    
    let view: ForecastView
    
    init(view: ForecastView) {
        self.view = view
    }
    
    func present(forecast: [ForecastWeather]) {
        var displayedForecast = [DisplayedForecastWeather]()
        for forecastWeather in forecast {
            let icon = getIcon(for: forecastWeather)
            let temperature = String(format: "%.1f", forecastWeather.temperature!) + Utils().symbolBasedOnLocalUnits()
            let description = forecastWeather.description!.capitalized
            
            let date = Date(timeIntervalSince1970: forecastWeather.date!)
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "EEEE, MMM d,' at 'hh"
            
            let dateString = String(describing: dateFormatterPrint.string(from: date))

            let displayedForecastWeather = DisplayedForecastWeather(icon: icon, date: dateString, temperature: temperature, description: description)
            displayedForecast.append(displayedForecastWeather)
        }
        
        view.show(forecast: displayedForecast)
    }
    
    func presentError() {
        view.showError()
    }
    
    private func getIcon(for weather: ForecastWeather) -> UIImage {
        return UIImage(named: WeatherImage().name(from: weather))!
    }
}

