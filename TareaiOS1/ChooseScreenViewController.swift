//
//  ChooseScreenViewController.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 10/11/23.
//

import UIKit

class ChooseScreenViewController: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.value(forKey: "gameImageList"))
    }
}
