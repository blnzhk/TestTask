import UIKit

class TotalEquipmentLossesController: UIViewController {
    
    @IBOutlet private var customView: TotalEquipmentLossesView!
    
    private let provider = DataProvider()
    private var equipmentLossIteractor: GetEquipmentLossesIteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equipmentLossIteractor = GetEquipmentLossesIteractor(provider: provider)
        equipmentLossIteractor.fetchEquipmentLossesData { result in
            switch result {
            case .success(let equipLoss):
                self.customView.setData(listLossEquipmentOryx: equipLoss)
            case .failure(let error):
                self.customView.showErrorLabel(error: error)
            }
        }
    }
}
