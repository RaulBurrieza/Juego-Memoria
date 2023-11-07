
import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapOnButton(_ sender: UIButton) {
        shouldPerformSegue(withIdentifier:"toMainScreen", sender:nil)
        
    }
}
