import UIKit

class LossesListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var personalLossesCountLabel: UILabel!
    @IBOutlet private weak var equipmentSummeryLoseLabel: UILabel!
    
    func setCellUI(data: String, day: Int, personnalLoss: Int, equipmentSumLoss: Int) {
        dataLabel.text = data
        dayLabel.text = Constants.Labels.Day + String(day)
        personalLossesCountLabel.text = String(personnalLoss)
        equipmentSummeryLoseLabel.text = String(equipmentSumLoss)
    }
}
