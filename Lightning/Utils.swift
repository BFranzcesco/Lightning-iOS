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
    
    func getCountryCode() -> String {
        return NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String
    }
    
    func isMetric() -> Bool {
        return NSLocale.currentLocale().objectForKey(NSLocaleUsesMetricSystem) as! Bool
    }
    
    func symbolBasedOnLocalUnits() -> String {
        if(isMetric()) {
            return METRIC_SYMBOL
        }
        return IMPERIAL_SYMBOL
    }
    
    func isAppFirstLaunch() -> Bool {
        let launchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("first_launch")
        if launchedBefore  {
            return false
        } else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "first_launch")
            return true
        }
    }
        
}