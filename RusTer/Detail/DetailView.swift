import UIKit

class DetailView: UIView {
    
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var personalLossesLabel: UILabel!
    @IBOutlet private weak var detailEquipmentTableView: UITableView!
    
    private var item: TotalLosses?
    
    func setData(dataToPass: TotalLosses?) {
        self.item = dataToPass
        guard let losses = self.item else { return }
        if let data = losses.date {
            dataLabel.text = data
        } else {
            dataLabel.text = Constants.Labels.Error
        }
        
        dayLabel.text = Constants.Labels.Day + String(losses.day)
        personalLossesLabel.text = String(losses.personnel)
        
        detailEquipmentTableView.delegate = self
        detailEquipmentTableView.dataSource = self
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item?.convertToDetailLossItems().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = detailEquipmentTableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.Identifiers.Detail, for: indexPath) as? DetailTableViewCell else {fatalError()}
        guard let itemToShow = item?.convertToDetailLossItems()[indexPath.row] else { fatalError() }
        cell.setCellUI(nameLoss: itemToShow.name, coutLoss: itemToShow.count)
        return cell
    }
}
