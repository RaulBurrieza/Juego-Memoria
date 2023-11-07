
import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapOnButton(_ sender: UIButton) {
        
        if((UserDefaults.standard.value(forKey: "userName")) != nil){shouldPerformSegue(withIdentifier:"toUserNameScreen", sender:nil)}
        else{
            shouldPerformSegue(withIdentifier:"toGameScreen", sender:nil)
        }
        
    }
}
