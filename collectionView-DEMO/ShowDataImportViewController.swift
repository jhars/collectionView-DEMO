//
//  ShowDataImportViewController.swift
//  collectionView-DEMO
//
//  Created by Jon Harlan on 12/26/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

class ShowDataImportViewController: UIViewController, DataImportDelegate {
    
    @IBOutlet weak var imageView: UIImageView!

    var importData:DataImport = DataImport ()
    let dataUrl = "https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-frc3/v/t1.0-9/10609411_10202833479538553_8901412256553337444_n.jpg?oh=84399efa7d9e5af0df43be53b47c64bc&oe=57138F1C"
    
    let targetImageView = "IBOUtlet"//IBOutlet imageView
    
    let profileImage:UIImage = UIImage()
    
//    var delegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.image = UIImage(data: importData.)
        importData = DataImport(dataUrlString: dataUrl)
        importData.delegate = self
        print("your VC is processing ViewDidLoad")
        importData.fetchData(dataUrl)
        print("your VC fetched Data Succesfully")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
