import UIKit

class LossesListController: UIViewController {
    
    @IBOutlet private var customView: LossesListView!
    
    private let provider = DataProvider()
    private let totalLossesMapper = TotalLossesMapper()
    private var totalLossesInteractor: GetTotalLossesIteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLossesInteractor = GetTotalLossesIteractor(provider: provider, mapper: totalLossesMapper)
        totalLossesInteractor.fetchTotalData { result in
            switch result {
            case.success(let currentLosses):
                self.customView.setData(totalLosses: currentLosses)
                self.customView.navigationDelegate = self
            case.failure(let error):
                self.customView.showErrorLabel(error: error)
            }
        }
    }
}

extension LossesListController: Navigation {
    
    func presentDetailView(selectedItem item: TotalLosses) {
        
        let secondStoryboard = UIStoryboard(name: Constants.Storyboards.Names.Detail, bundle: nil)
        if let detailController = secondStoryboard.instantiateViewController(withIdentifier: Constants.ViewControllers.Identifiers.Detail) as? DetailController {
            detailController.dataToPass = item
            let navigationController = UINavigationController(rootViewController: detailController)
            present(navigationController, animated: true, completion: nil)
        }
    }
}
