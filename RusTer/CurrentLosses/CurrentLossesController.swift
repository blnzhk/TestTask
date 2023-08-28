import Foundation
import UIKit

class CurrentLossesController: UIViewController {
    
    @IBOutlet private var customView: CurrentLossesView!
    
    private let provider = DataProvider()
    private let totalLossesMapper = TotalLossesMapper()
    private var totalLossesInteractor: GetTotalLossesIteractorProtocol!
    private var currentLossesInteractor: GetCurrentLossesIteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLossesInteractor = GetTotalLossesIteractor(provider: provider, mapper: totalLossesMapper)
        currentLossesInteractor = GetCurrentLossesIteractor(totalLoseIteractor: totalLossesInteractor)
        
        currentLossesInteractor.fetchCurrentLoseData { result in
            switch result {
            case.success(let currentLosses):
                self.customView.setData(currentLosses: currentLosses)
            case.failure(let error):
                self.customView.showError(error: error)
            }
        }
    }
}
