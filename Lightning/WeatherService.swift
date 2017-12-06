import Foundation
import Alamofire

class WeatherService {

    var delegate: WeatherServiceDelegate?
    
    func weatherData(basedOn location: Location) {
        let latitude = location.latitude
        let longitude = location.longitude
        
        let params = ["lat":latitude, "lon":longitude]
        
        dataWith(params: params as [String : AnyObject])
    }

    private func dataWith(params: [String:AnyObject]) {
        let baseURL = "http://api.openweathermap.org/data/2.5/weather?&appid=70dd46325ab4cc9a84786b6d73cc2662"
            + "&units=" + Utils().getUnits()
            + "&lang=" + Utils().getPhonePreferredLanguageCode()

        Alamofire.request(baseURL, method: .get, parameters: params , encoding: URLEncoding.default).responseJSON { response in
            
            if let data = response.data {
                self.delegate?.onDataReceived(data: data)
            } else {
                self.delegate?.onError()
            }
            }.responseString{ response in
        }

    }
}
