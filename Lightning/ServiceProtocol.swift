import Foundation

protocol ServiceProtocol {
    func onDataReceived(data: NSData?)
    func onError()
}