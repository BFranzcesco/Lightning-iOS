import Foundation
import UIKit

class WeatherIconHandler {
    
    func getIconImageBasedOnCurrentTime(weatherID: Int, sunriseTime: Double, sunsetTime: Double) -> UIImage {
        
        var imageName = "sunny"
        
        if (weatherID == 800) {
            if (isDay(sunriseTime: sunriseTime, sunsetTime: sunsetTime)) {
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
                    if (weatherID == 801 || weatherID == 802) {
                        if (isDay(sunriseTime: sunriseTime, sunsetTime: sunsetTime)) {
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
    
    func isDay(sunriseTime: Double, sunsetTime: Double) -> Bool {
        let currentTime = NSDate().timeIntervalSince1970
        return  currentTime >= sunriseTime && currentTime < sunsetTime;
    }

}
