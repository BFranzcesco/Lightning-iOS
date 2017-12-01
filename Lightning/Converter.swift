import Foundation
import SwiftyJSON

class Converter {

    func dataToWeather(weatherData: Data) -> Weather {
        
        let json = JSON(weatherData)
    
        let cityName = json["name"].string
        let description = json["weather"].first?.1["description"].string
        let temperature = json["main"]["temp"].double
        let sunriseTime = json["sys"]["sunrise"].double
        let sunsetTime = json["sys"]["sunset"].double
        let id = json["weather"].first?.1["id"].int
        
        return Weather(cityName: cityName, temperature: temperature, description: description, sunriseTime: sunriseTime, sunsetTime: sunsetTime, id: id)
    }
}
