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
    var gameImages : [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        gameImages=images.shuffled()
        print(gameImages)
        
        adviceLabel.text = UserDefaults.standard.value(forKey: "userName") as! String + " " + adviceLabel.text!
        
        timer()
        
    }
    //Función que cambia una imagen cada 5 segundos y cuando llega a 0 cambia de pantalla
    func timer(){
        var runCount = 10
        var index = 0
        var gameImagesPool : [UIImage] = []
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ [self] timer in
            timeLabel.text = String(runCount)
            if runCount % 5 == 0{
                changeImage(gameImages:gameImages,index:index)
                gameImagesPool.append(gameImageView.image!)
                print(" POOOL :",gameImagesPool)
                index += 1
                if runCount == 0{
                    print("--------------END--------------")
                    self.performSegue(withIdentifier: "toChooseScreen", sender: nil)
                    
                    
                }
            }
            runCount -= 1
        }
    }
    
    func changeImage(gameImages:[UIImage],index:Int){
        gameImageView.image = gameImages[index]
        print(gameImageView.image)
    }
}
