
import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapOnButton(_ sender: UIButton) {
        
        if((UserDefaults.standard.value(forKey: "userName")) != nil){
            performSegue(withIdentifier:"toUserNameScreen", sender:nil)}
        else{
            performSegue(withIdentifier:"toGameScreen", sender:nil)}
    }
}
