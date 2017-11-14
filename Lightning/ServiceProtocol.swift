import Foundation

protocol ServiceProtocol {
    func onDataReceived(data: Data?)
    func onError()
}
