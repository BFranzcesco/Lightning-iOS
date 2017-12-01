import UIKit

class WeatherTheme {

    static let Day = WeatherTheme(lightMode: true, statusBarColor: UIColor(red: 0.00, green: 0.61, blue: 0.72, alpha: 1.0))
    static let Night = WeatherTheme(lightMode: false, statusBarColor: UIColor(red: 0.00, green: 0.24, blue: 0.33, alpha: 1.0))

    let lightMode: Bool
    let statusBarColor: UIColor

    init(lightMode: Bool, statusBarColor: UIColor) {
        self.lightMode = lightMode
        self.statusBarColor = statusBarColor
    }

    static func == (lhs: WeatherTheme, rhs: WeatherTheme) -> Bool {
        return lhs.lightMode == rhs.lightMode && lhs.statusBarColor == rhs.statusBarColor
    }
}
