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
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    var row = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        var data = fillList()
        choosePool=data.shuffled()
        
        print("numero de imagenes:",(String(choosePool.count)))
        
        print("Pool order : \(gameImagesPoolIds)")
    }
    //funcion que detecta que imagenes han salido en el anterior
    //View Controller para rellenar una lista y mostrar unicamente esas
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
    
    func collectionView(_ tableView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        row = indexPath.row
        print("columna seleccionada \(indexPath.row)")
    }
}
