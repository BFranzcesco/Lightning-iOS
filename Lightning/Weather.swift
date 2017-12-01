import Foundation

struct Weather {
    let cityName:String?
    let temperature:Double?
    let description: String?
    let sunriseTime: Double?
    let sunsetTime: Double?
    let id: Int?

    func isDayTime() -> Bool {
        let currentTime = NSDate().timeIntervalSince1970
        return  currentTime >= sunriseTime! && currentTime < sunsetTime!;
    }

    func isMostlyClear() -> Bool {
        return id == 800 || id == 801 || id == 802
    }
}
