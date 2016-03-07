import Foundation

class Utils {
    
    let METRIC = "metric"
    let IMPERIAL = "imperial"
    
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
}