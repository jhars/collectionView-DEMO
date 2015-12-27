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

    var TargetImage:UIImageView!
    let ImageView:UIImage = UIImage(named:"sample-img-1")!

    override func viewDidLoad() {
        super.viewDidLoad()
        dataProcesser()
        self.imageView.image = ImageView
//================================!!!!!!!!!//
        print(imageView)
//================================!!!!!!!!!//
    }
    
    func dataProcesser (){
        importData = DataImport(dataUrlString: dataUrl )
        importData.delegate = self

        var importedData = importData.fetchData(dataUrl) as UIImage!
        var targetImg:UIImageView = UIImageView(image: importedData)
//================================!!!!!!!!!//
        print(targetImg)
//================================!!!!!!!!!//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
