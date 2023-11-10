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
    @IBOutlet weak var timeLabel: UILabel!
    var images : [UIImage] = [
        UIImage.image1,
        UIImage.image2,
        UIImage.image3,
        UIImage.image4,
        UIImage.image5,
        UIImage.image6,
        UIImage.image7,
        UIImage.image8,
        UIImage.image9,
        UIImage.image10
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        images.shuffle()
        print(images)
        adviceLabel.text = UserDefaults.standard.value(forKey: "userName") as! String + " " + adviceLabel.text!
        
        gameImageView.image = images[Int.random(in: 0...images.count)]
        timer()
    
    }
    func timer(){
        var runCount = 20
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            runCount -= 1
            self.timeLabel.text = String(runCount)
        }
    }
    func changeImage(){
      gameImageView.image = images.
    }
}
