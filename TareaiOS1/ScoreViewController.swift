//
//  ScoreViewController.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 17/12/23.
//

import UIKit

class ScoreViewController: UIViewController {
    var score = -1
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ScoreLabel.text! += String(score)
    }
    


}
