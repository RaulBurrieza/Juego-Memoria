//
//  ChooseScreenViewController.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 10/11/23.
//

import UIKit

class ChooseScreenViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    
    //Lista ids de las imagenes que han salido en el anterior ViewController
    var gameImagesPoolIds:[Int] = []
    //Lista de imagenes que han aparecido en el anterior ViewController
    var gameImages:[gameImage] = []
    
    var choosePool:[gameImage]=[]
    
    var score = 0
    
    var attempts = 0
    
    var currentImg = 0
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    var row = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        let data = fillList()
        choosePool=data.shuffled()
        
        print("numero de imagenes:",(String(choosePool.count)))
        
        print("Pool order : \(gameImagesPoolIds)")
    }
    
    /* Funcion que detecta que imagenes han salido en el anterior
    View Controller para rellenar una lista y mostrar unicamente esas*/
    func fillList()->[gameImage]{
    var choosePool:[gameImage]=[]
        for img in gameImages{
            for imgid in gameImagesPoolIds{
                if (img.id == imgid){
                    choosePool.append(img)
                }
            }
        }
        return choosePool
    }
    
    //Funciones del collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return choosePool.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        let row = indexPath.row
        let singleImage = choosePool[row]
        cell.customCellImage.image = singleImage.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        row = indexPath.row
        print("columna seleccionada \(indexPath.row)")
        
        if attempts != 5{
            if choosePool[row].id == gameImagesPoolIds[currentImg]{
                choosePool[row].image = UIImage.greenimg
                score += 100
                attempts += 1
                currentImg += 1
                print("ACIERTO")
                
            }
            else{
                choosePool[row].image = UIImage.redImg
                attempts += 1
                print("FALLO")
            }
        }
        else {
            performSegue(withIdentifier: "toScoreScreen", sender: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScoreScreen"{
            let nextViewController = segue.destination as! ScoreViewController
            nextViewController.score = score 
        }
    }
}
