import Foundation
import Alamofire
import AlamofireObjectMapper

class ForecastService {
    
    var delegate: ForecastServiceDelegate?
    
    func forecast(basedOn location: Location) {
        let latitude = location.latitude
        let longitude = location.longitude
        
        let params = ["lat":latitude, "lon":longitude]
        
        forecastData(with: params as [String : AnyObject])
    }
    
    private func forecastData(with params: [String:AnyObject]) {
        let baseURL = "http://api.openweathermap.org/data/2.5/forecast?&appid=70dd46325ab4cc9a84786b6d73cc2662"
            + "&units=" + Utils().getUnits()
            + "&lang=" + Utils().getPhonePreferredLanguageCode()
        
        Alamofire.request(baseURL, method: .get, parameters: params , encoding: URLEncoding.default).responseObject { (response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value
            
            if let list = weatherResponse?.list {
                self.delegate?.onDataReceived(data: list)
            }
        }
    }
}

