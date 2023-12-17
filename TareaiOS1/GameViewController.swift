//
//  GameViewController.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 7/11/23.
//

import UIKit

class GameViewController: UIViewController {
    //Variables de outlets
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    //Creación de objetos gameImage
    var images : [gameImage] = [
        gameImage(image:UIImage.image1, id:1),
        gameImage(image:UIImage.image2, id:2),
        gameImage(image:UIImage.image3, id:3),
        gameImage(image:UIImage.image4, id:4),
        gameImage(image:UIImage.image5, id:5),
        gameImage(image:UIImage.image6, id:6),
        gameImage(image:UIImage.image7, id:7),
        gameImage(image:UIImage.image8, id:8),
        gameImage(image:UIImage.image9, id:9),
        gameImage(image:UIImage.image10,id:10)]
    
    var gameImages : [gameImage] = []
    
    var counter : Timer?
    
    var gameImagesPoolIds:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        gameImages=images.shuffled()
        for image in gameImages{ print(image.id)}
        
        adviceLabel.text = UserDefaults.standard.value(forKey: "userName") as! String + " " + adviceLabel.text!
        
        timer()
        
    }
    
    //Función que cambia una imagen cada 5 segundos y cuando llega a 0 cambia de pantalla
    func timer(){
        var runCount = 20
        var index = 0
        counter = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ [self]
            timer in
            timeLabel.text = String(runCount)
            
            if runCount % 5 == 0{
                changeImage(gameImages:gameImages,index:index)
                gameImagesPoolIds.append(gameImages[index].id)
                print(" POOOL :",gameImagesPoolIds)
                index += 1
                if runCount == 0{
                    self.performSegue(withIdentifier: "toChooseScreen", sender: nil)
                    counter?.invalidate()
                }
            }
            runCount -= 1
        }
    }
    
    func changeImage(gameImages:[gameImage],index:Int){
        gameImageView.image = gameImages[index].image
        print(gameImageView.image)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChooseScreen"{
            let nextViewController = segue.destination as! ChooseScreenViewController
            nextViewController.gameImagesPoolIds = gameImagesPoolIds
            nextViewController.gameImages = gameImages
        }
    }
}
