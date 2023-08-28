import UIKit

class TotalEquipmentLossesView: UIView {
    
    @IBOutlet private weak var listOfLossesoEqOryx: UITableView!
    
    private var listEquipmentLossOryx: [TotalEquipmentLosses] = []
    private var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    func setData(listLossEquipmentOryx list: [TotalEquipmentLosses]) {
        self.listEquipmentLossOryx = list
        listOfLossesoEqOryx.delegate = self
        listOfLossesoEqOryx.dataSource = self
        listOfLossesoEqOryx.reloadData()
    }
    
    func showErrorLabel(error: Error) {
        errorLabel.text = "\(error)"
        errorLabel.isHidden = false
    }
}

extension TotalEquipmentLossesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listEquipmentLossOryx.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listOfLossesoEqOryx.dequeueReusableCell(withIdentifier: Constants.TableViewCells.Identifiers.TotalEquipmentLosses, for: indexPath) as? TotalEquipmentLossesTableViewCell else {fatalError()}
        let index = indexPath.row
        let item = listEquipmentLossOryx[index]
        cell.setCellUI(name: item.equipmentOryx, model: item.model, manufacture: item.manufacturer, totalLose: item.lossesTotal)
        return cell
    }
}
