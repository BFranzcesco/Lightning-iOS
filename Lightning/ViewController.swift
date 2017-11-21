import UIKit

class ViewController: UIViewController, LocationProtocol, WeatherView {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var nightVeil: UIView!
    
    var locationUserDefaults = LocationUserDefaults()
    
    let service = WeatherService()
    let geolocator = GeoLocator()
    var presenter: WeatherPresenter?

    let darkStatusBarColor = UIColor(red:0.00, green:0.24, blue:0.33, alpha:1.0)
    let lightStatusBarColor = UIColor(red:0.00, green:0.61, blue:0.72, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        changeStatusBarColor(to: lightStatusBarColor)
        
        geolocator.delegate = self
        geolocator.getCurrentLocation()

        let service = WeatherService()
        presenter = WeatherPresenter(service: service, view: self)
    }

    func show(weather: Weather) {
        renderWeather(weather: weather)
    }

    func showError() {

    }
    
    private func renderWeather(weather: Weather) {
        
        cityNameLabel.text = weather.cityName
        
        if(weather.weatherID != nil){
            weatherIcon.image = WeatherIconHandler().getIconImageBasedOnCurrentTime(weatherID: weather.weatherID!, sunriseTime: weather.sunriseTime!, sunsetTime: weather.sunsetTime!)
            
            if(WeatherIconHandler().isDay(sunriseTime: weather.sunriseTime!, sunsetTime: weather.sunsetTime!)) {
                nightVeil.isHidden = true
                changeStatusBarColor(to: lightStatusBarColor)
            } else {
                nightVeil.isHidden = false
                changeStatusBarColor(to: darkStatusBarColor)
            }
        }
        
        if(weather.temperature != nil) {
            temperatureLabel.text = String(format: "%.1f", weather.temperature!) + Utils().symbolBasedOnLocalUnits()
        }
        
        if(weather.description != nil) {
            descriptionLabel.text = weather.description!.capitalized
        }
        
    }

    private func changeStatusBarColor(to color: UIColor) {
        UIApplication.shared.statusBarView?.backgroundColor = color
    }
    
    //CurrentLocationProtocol
    func onLocationGot(location: Location) {
        presenter?.weather(for: location)
        locationUserDefaults.store(location: location)
    }
    
    func onLocationServicesDisabled() {
        presenter?.weather(for: locationUserDefaults.read())
    }

}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

