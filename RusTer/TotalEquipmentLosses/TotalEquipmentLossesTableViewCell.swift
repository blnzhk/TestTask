import UIKit

class TotalEquipmentLossesTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var modelLabel: UILabel!
    @IBOutlet private weak var manufactureLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    
    func setCellUI(name: String, model: String, manufacture: String, totalLose: Int) {
        nameLabel.text = name
        modelLabel.text = model
        manufactureLabel.text = manufacture
        totalLabel.text = String(totalLose)
    }
}
