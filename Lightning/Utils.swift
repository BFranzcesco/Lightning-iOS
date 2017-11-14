import Foundation

class Utils {
    
    let METRIC = "metric"
    let IMPERIAL = "imperial"
    
    let METRIC_SYMBOL = "°C"
    let IMPERIAL_SYMBOL = "°F"
    
    func getUnits() -> String {
        if(isMetric()) {
            return METRIC
        }
        return IMPERIAL
    }
    
    func getPhonePreferredLanguageCode() -> String {
        return Locale.preferredLanguages[0]
    }
    
    func isMetric() -> Bool {
        return Locale.current.usesMetricSystem
    }
    
    func symbolBasedOnLocalUnits() -> String {
        if(isMetric()) {
            return METRIC_SYMBOL
        }
        return IMPERIAL_SYMBOL
    }
    
    func isAppFirstLaunch() -> Bool {
        let launchedBefore = UserDefaults.standard.bool(forKey: "first_launch")
        if launchedBefore  {
            return false
        } else {
            UserDefaults.standard.set(true, forKey: "first_launch")
            return true
        }
    }
        
}
