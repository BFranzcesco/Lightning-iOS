import Foundation

protocol ForecastServiceDelegate {
    func onDataReceived(data: [ForecastWeather])
    func onError()
}
