import UIKit

class WeatherViewController: UIViewController, WeatherView {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var nightVeil: UIView!

    @IBAction func iconTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ForecastViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent

        let service = WeatherService()
        let geolocator = GeoLocator()
        let presenter = WeatherPresenter(view: self)
        let interactor = WeatherInteractor(service: service, geolocator: geolocator, delegate: presenter)
        
        interactor.weather()
    }

    func show(weather: DisplayedWeather) {
        cityNameLabel.text = weather.cityName
        descriptionLabel.text = weather.description
        temperatureLabel.text = weather.temperature
        weatherIcon.image = weather.icon
        nightVeil.isHidden = weather.theme.lightMode
        statusBar().backgroundColor = weather.theme.statusBarColor
    }

    func showError() {

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

