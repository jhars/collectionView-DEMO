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
    
}

class DataImport: NSObject {
    var delegate:DataImportDelegate?
    override init(){
        super.init()
    }
    init(dataUrlString:String) {
        super.init()
    }
    func fetchData(dataUrl:String){
            let session = NSURLSession.sharedSession()
            let url = NSURL(string: dataUrl)!
        
            session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                // Make sure we get an OK response
                guard let realResponse = response as? NSHTTPURLResponse where
                    realResponse.statusCode == 200 else {
                        print("Not a 200 response")
                        return
                }
                do {
//                    self.fbProfileImage.image = UIImage(data:data!)
                    print("image loaded on the DataImportDelegate")
                }
            }).resume()
        }
    }

