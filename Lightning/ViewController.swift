import UIKit

class ViewController: UIViewController, ServiceProtocol, LocationProtocol {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var nightVeil: UIView!
    
    var locationUserDefaults = LocationUserDefaults()
    
    let service = Service()
    let geolocalizer = GeoLocalizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        geolocalizer.delegate = self
        geolocalizer.getCurrentLocation()
        
        service.delegate = self
    }
    
    func renderWeather(weather: Weather) {
        
        cityNameLabel.text = weather.cityName
        
        if(weather.weatherID != nil){
            weatherIcon.image = WeatherIconHandler().getIconImageBasedOnCurrentTime(weatherID: weather.weatherID!, sunriseTime: weather.sunriseTime!, sunsetTime: weather.sunsetTime!)
            
            if(WeatherIconHandler().isDay(sunriseTime: weather.sunriseTime!, sunsetTime: weather.sunsetTime!)) {
                nightVeil.isHidden = true
            } else {
                nightVeil.isHidden = false
            }
        }
        
        if(weather.temperature != nil) {
            temperatureLabel.text = String(format: "%.1f", weather.temperature!) + Utils().symbolBasedOnLocalUnits()
        }
        
        if(weather.description != nil) {
            descriptionLabel.text = weather.description!.capitalized
        }
        
    }
    
    //ServiceProtocol
    func onDataReceived(data: Data?) {
        let weather = Converter().convertDataToWeather(weatherData: data!)
        renderWeather(weather: weather)
    }
    
    func onError() {
    }
    
    //CurrentLocationProtocol
    func onLocationGot(location: Location) {
        service.getWeatherDataBasedOnLocation(location: location)
        locationUserDefaults.store(location: location)
    }
    
    func onLocationServicesDisabled() {
        service.getWeatherDataBasedOnLocation(location: locationUserDefaults.read())
    }
}

