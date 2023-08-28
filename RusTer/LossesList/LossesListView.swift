import UIKit

protocol Navigation: AnyObject {
    func presentDetailView(selectedItem item: TotalLosses)
}

class LossesListView: UIView {
    
    @IBOutlet private weak var listOfLossesTableView: UITableView!
    
    private var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    weak var navigationDelegate: Navigation?
    private var totalLosses: [TotalLosses] = []
    
    func setData(totalLosses loss: [TotalLosses]) {
        self.totalLosses = loss
        listOfLossesTableView.delegate = self
        listOfLossesTableView.dataSource = self
        listOfLossesTableView.reloadData()
    }
    
    func showErrorLabel(error: Error) {
        errorLabel.text = "\(error)"
        errorLabel.isHidden = false
    }
}

extension LossesListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        totalLosses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listOfLossesTableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.Identifiers.LossesList, for: indexPath) as? LossesListTableViewCell else {fatalError()}
        let index = indexPath.row
        let item = totalLosses[index]
        let totalCount = item.calculateTotalCount()
        if let date = item.date {
            cell.setCellUI(data: date, day: item.day, personnalLoss: item.personnel, equipmentSumLoss: totalCount)
        } else {
            cell.setCellUI(data: Constants.Labels.Error, day: item.day, personnalLoss: item.personnel, equipmentSumLoss: totalCount)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationDelegate?.presentDetailView(selectedItem: totalLosses[indexPath.row])
    }
}
