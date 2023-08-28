import UIKit

class DetailController: UIViewController {
    
    @IBOutlet private var detailView: DetailView!
    
    var dataToPass: TotalLosses?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.setData(dataToPass: dataToPass)
    }
}
