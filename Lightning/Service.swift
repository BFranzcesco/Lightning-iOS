import Foundation
import Alamofire

class Service {
    
    var delegate:ServiceProtocol?

    func getWeatherDataWithParams(params: NSDictionary) {
        
        let baseURL = "http://api.openweathermap.org/data/2.5/weather?&appid=70dd46325ab4cc9a84786b6d73cc2662"
            + "&units=" + Utils().getUnits()
            + "&lang=" + Utils().getPhonePreferredLanguageCode()
        
        Alamofire.request(.GET, baseURL, parameters: params as? [String : AnyObject])
            .responseJSON { response in
                if let data = response.data {
                    self.delegate?.onDataReceived(data)
                } else {
                    self.delegate?.onError()
                }
            }.responseString{ response in
        }
        
    }
    
    func getWeatherDataBasedOnCity(cityName: String) {
        let params = ["q":cityName]
        getWeatherDataWithParams(params)
    }
    
    func getWeatherDataBasedOnLocation(location: Location) {
        let latitude = location.latitude
        let longitude = location.longitude
        
        let params = ["lat":latitude!, "lon":longitude!]
        
        getWeatherDataWithParams(params)
    }
}