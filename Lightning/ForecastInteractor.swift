import Foundation

class ForecastInteractor: ForecastServiceDelegate, LocationDelegate {
    
    let service: ForecastService
    let geolocator: GeoLocator
    let delegate: ForecastInteractorDelegate
    
    init(service: ForecastService, geolocator: GeoLocator, delegate: ForecastInteractorDelegate) {
        self.service = service
        self.geolocator = geolocator
        self.delegate = delegate
        service.delegate = self
        geolocator.delegate = self
    }
    
    func forecast() {
        geolocator.getCurrentLocation()
    }
    
    //MARK: - ServiceDelegate
    func onDataReceived(data: [ForecastWeather]) {
        delegate.present(forecast: data)
    }
    
    func onError() {
        delegate.presentError()
    }
    
    //MARK: - LocationDelegate
    func onLocationServicesDisabled() {
        delegate.presentError()
    }
    
    func onLocationGot(location: Location) {
        service.forecast(basedOn: location)
    }
}

