import UIKit

class CurrentLossesView: UIView {
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var dayCountLabel: UILabel!
    @IBOutlet private weak var resonalTextLabel: UILabel!
    @IBOutlet private weak var coutPersonalLosses: UILabel!
    @IBOutlet private weak var detailCollectionView: UICollectionView!
    
    private var detailLossesItems: [DetailLossesItem] = []
    
    func setData(currentLosses: TotalLosses) {
        self.detailLossesItems = currentLosses.convertToDetailLossItems()
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        if let  date = currentLosses.date {
            dateLabel.text = date
        } else {
            dateLabel.text = Constants.Labels.Error
        }
        dayCountLabel.text = Constants.Labels.Day + String(currentLosses.day)
        coutPersonalLosses.text = String(currentLosses.personnel)
    }
    
    func showError(error: Error) {
        dateLabel.text = Constants.Errors.TextLabel
        dayCountLabel.isHidden = true
        resonalTextLabel.isHidden = true
        coutPersonalLosses.isHidden = true
        detailCollectionView.isHidden = true
    }
}

extension CurrentLossesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        detailLossesItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCells.Identifiers.CurrentLosses, for: indexPath) as? CurrentLossesCollectionViewCell else {fatalError()}
        let item = detailLossesItems[indexPath.row]
        cell.setCellUI(nameLoss: item.name, coutLoss: item.count)
        
        return cell
    }
}
