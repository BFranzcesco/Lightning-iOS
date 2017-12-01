import Foundation
import UIKit

class WeatherIconHandler {
    
    func getIconImageBasedOnCurrentTime(weather: Weather) -> UIImage {
        
        var imageName = "sunny"
        
        if (weather.weatherID! == 800) {
            if (weather.isDayTime()) {
                imageName = "sunny"
            } else {
                imageName =  "moon"
            }
        } else {
            switch (weather.weatherID! / 100) {
                case 2:
                    imageName =  "thunder"
                case 3:
                    imageName =  "drizzle"
                case 7:
                    imageName =  "foggy"
                case 8:
                    if (weather.weatherID == 801 || weather.weatherID == 802) {
                        if (weather.isDayTime()) {
                            imageName = "partly_cloudy"
                        } else {
                            imageName =  "partly_cloudy_moon"
                        }
                    } else {
                        imageName =  "cloudy"
                    }
                case 6:
                    imageName =  "snowy"
                case 5:
                    imageName =  "rainy"
                default:
                    imageName =  "sunny"
            }
        }
        
        return UIImage(named: imageName)!
    }

}
