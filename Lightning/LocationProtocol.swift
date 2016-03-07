import Foundation

protocol LocationProtocol {
    func onLocationGot(location: Location)
    func onLocationServicesDisabled()
}