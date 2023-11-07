//
//  GameViewController.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 7/11/23.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        adviceLabel.text = UserDefaults.standard.value(forKey: "userName") as! String + " " + adviceLabel.text!
        gameImageView.image = UIImage(systemName: "gamecontroller.fill")

    }
    


}
