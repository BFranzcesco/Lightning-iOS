import Foundation

protocol WeatherServiceDelegate {
    func onDataReceived(data: Data)
    func onError()
}
