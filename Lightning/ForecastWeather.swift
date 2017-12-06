import Foundation
import ObjectMapper
import Alamofire

struct ForecastWeather: Mappable {
    
    var temperature:Double?
    var description: String?
    var date: Double?
    var id: Int?

    init(temperature: Double, description: String, date: Double, id: Int) {
        self.temperature = temperature
        self.description = description
        self.date = date
        self.id = id
    }

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        temperature <- map["main.temp"]
        description <- map["weather.0.description"]
        date <- map["dt"]
        id <- map["weather.0.id"]
    }
    
    func isMostlyClear() -> Bool {
        return id == 800 || id == 801 || id == 802
    }
}

class WeatherResponse: Mappable {
    
    var list: [ForecastWeather]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        list <- map["list"]
    }
}
