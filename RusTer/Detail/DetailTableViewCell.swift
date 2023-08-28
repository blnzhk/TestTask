import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLossLabel: UILabel!
    @IBOutlet private weak var countLose: UILabel!
    
    func setCellUI(nameLoss name: String, coutLoss loss: String) {
        nameLossLabel.text = name
        countLose.text = loss
    }
}
