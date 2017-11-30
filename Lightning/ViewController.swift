import UIKit

class ViewController: UIViewController, WeatherView {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var nightVeil: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent

        let service = WeatherService()
        let geolocator = GeoLocator()
        let presenter = WeatherPresenter(view: self)
        let interactor = WeatherInteractor(service: service, geolocator: geolocator, delegate: presenter)
        
        interactor.weather()
    }

    private func getIcon(for weather: Weather) -> UIImage {
        return WeatherIconHandler().getIconImageBasedOnCurrentTime(weatherID: weather.weatherID!, sunriseTime: weather.sunriseTime!, sunsetTime: weather.sunsetTime!)
    }
    
    func show(weather: Weather) {

        cityNameLabel.text = weather.cityName

        if(weather.weatherID != nil) {
            weatherIcon.image = getIcon(for: weather)
            if(WeatherIconHandler().isDay(sunriseTime: weather.sunriseTime!, sunsetTime: weather.sunsetTime!)) {
                Theme.Day.applyTo(darkView: nightVeil, statusBar: statusBar())
            } else {
                Theme.Night.applyTo(darkView: nightVeil, statusBar: statusBar())
            }
        }

        if(weather.temperature != nil) {
            temperatureLabel.text = String(format: "%.1f", weather.temperature!) + Utils().symbolBasedOnLocalUnits()
        }

        if(weather.description != nil) {
            descriptionLabel.text = weather.description!.capitalized
        }
    }

    func showError() {

    }

    private class Theme {

        static let Day = Theme(darkMode: false, statusBarColor: UIColor(red: 0.00, green: 0.24, blue: 0.33, alpha: 1.0))
        static let Night = Theme(darkMode: true, statusBarColor: UIColor(red: 0.00, green: 0.61, blue: 0.72, alpha: 1.0))

        let darkMode: Bool
        let statusBarColor: UIColor

        init(darkMode: Bool, statusBarColor: UIColor) {
            self.darkMode = darkMode
            self.statusBarColor = statusBarColor
        }

        func applyTo(darkView: UIView, statusBar: UIView) {
            darkView.isHidden = darkMode
            statusBar.backgroundColor = statusBarColor
        }
    }

    private func statusBar() -> UIView {
        return UIApplication.shared.statusBarView!
    }

}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

