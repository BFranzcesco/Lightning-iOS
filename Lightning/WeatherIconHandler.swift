import Foundation
import UIKit

class WeatherIconHandler {
    
    func getIconImageBasedOnCurrentTime(weatherID: Int, sunriseTime: Double, sunsetTime: Double) -> UIImage {
        let sunrise = sunriseTime * 1000;
        let sunset = sunsetTime * 1000;
        
        var imageName = "sunny"
        
        if (weatherID == 800) {
            if (isDay(sunrise, sunsetTime: sunset)) {
                imageName = "sunny"
            } else {
                imageName =  "moon"
            }
        } else {
            switch (weatherID / 100) {
                case 2:
                    imageName =  "thunder"
                case 3:
                    imageName =  "drizzle"
                case 7:
                    imageName =  "foggy"
                case 8:
                    imageName =  "cloudy"
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
    
    func isDay(sunriseTime: Double, sunsetTime: Double) -> Bool {
        let currentTime = Double(NSDate().timeIntervalSince1970)
        return  currentTime >= sunriseTime && currentTime < sunsetTime;
    }

}