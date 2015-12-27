//
//  DataImport.swift
//  collectionView-DEMO
//
//  Created by Jon Harlan on 12/26/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

protocol DataImportDelegate {
    var dataUrl:String {get}
    var ImageView:UIImage{get}
//    var dataReturn
    
}

class DataImport: NSObject {
    var imgObjData:UIImage = UIImage()
    var delegate:DataImportDelegate?
    override init(){
        super.init()
    }
    init(dataUrlString:String) {
        super.init()
    }
    func fetchData(dataUrl:String) -> UIImage {
            let session = NSURLSession.sharedSession()
            let url = NSURL(string: dataUrl)!

            session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                guard let realResponse = response as? NSHTTPURLResponse where
                    realResponse.statusCode == 200 else {
                        print("Not a 200 response")
                        return
                }
                do {
                    self.imgObjData = UIImage(data:data!)!
                    print("image loaded on the DataImportDelegate")
                }
            }).resume()
            return imgObjData
            //can probably do some setting up Down here... prepare for seg, somehting'
        }
}