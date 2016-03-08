import UIKit

class ViewController: UIViewController, ServiceProtocol, LocationProtocol {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    var locationUserDefaults = LocationUserDefaults()
    
    let service = Service()
    let geolocalizer = GeoLocalizer()
    
    @IBAction func refreshWeather(sender: AnyObject) {
        geolocalizer.getCurrentLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        geolocalizer.delegate = self
        geolocalizer.getCurrentLocation()
        
        service.delegate = self
    }
    
    func renderWeather(weather: Weather) {
        
        cityNameLabel.text = weather.cityName
        
        if(weather.weatherID != nil){
            weatherIcon.image = WeatherIconHandler().getIconImageBasedOnCurrentTime(weather.weatherID!, sunriseTime: weather.sunriseTime!, sunsetTime: weather.sunsetTime!)
        }
        
        if(weather.temperature != nil) {
            temperatureLabel.text = String(format: "%.1f", weather.temperature!) + Utils().symbolBasedOnLocalUnits()
        }
        
        if(weather.description != nil) {
            descriptionLabel.text = weather.description!.capitalizedString
        }
        
    }
    
    //ServiceProtocol
    func onDataReceived(data: NSData?) {
        let weather = Converter().convertDataToWeather(data!)
        renderWeather(weather)
    }
    
    func onError() {
        
    }
    
    //CurrentLocationProtocol
    func onLocationGot(location: Location) {
        service.getWeatherDataBasedOnLocation(location)
        locationUserDefaults.store(location)
    }
    
    func onLocationServicesDisabled() {
        service.getWeatherDataBasedOnLocation(locationUserDefaults.read())
    }
}

