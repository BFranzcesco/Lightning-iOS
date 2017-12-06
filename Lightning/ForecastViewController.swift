import UIKit

class ForecastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ForecastView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var forecast = [DisplayedForecastWeather]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var service: ForecastService?
    
    override func viewDidLoad() {
        setupTableView()
        
        let service = ForecastService()
        let geolocator = GeoLocator()
        let presenter = ForecastPresenter(view: self)
        let interactor = ForecastInteractor(service: service, geolocator: geolocator, delegate: presenter)
        
        interactor.forecast()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ForecastTableViewCell", owner: self, options: nil)?.first as! ForecastTableViewCell
        cell.descriptionLabel.text = forecast[indexPath.row].description
        cell.temperatureLabel.text = forecast[indexPath.row].temperature
        cell.icon.image = forecast[indexPath.row].icon
        cell.dateLabel.text = forecast[indexPath.row].date
        
        return cell
    }
    
    func show(forecast: [DisplayedForecastWeather]) {
        self.forecast = forecast
    }
    
    func showError() {
        
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 180
    }
    
}
