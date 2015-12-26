//
//  ImportDataViewController.swift
//  collectionView-DEMO
//
//  Created by Jon Harlan on 12/24/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//
import Foundation
import UIKit

protocol ImportDataDelegate {
//    optional func imgImport(imgUrl:String)
    var dataUrl:String{get set}
}

class ImportDataViewController: UIViewController {

    @IBOutlet weak var fbProfileImage: UIImageView!
    
//=================================================================//
    //Required to Be Defined in whatever VC uses this Delegate
    var imgURL = "https://scontent.fsnc1-1.fna.fbcdn.net/hphotos-frc3/v/t1.0-9/10609411_10202833479538553_8901412256553337444_n.jpg?oh=84399efa7d9e5af0df43be53b47c64bc&oe=57138F1C"
//=================================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
//LOAD IMAGE via URL
        imgImport(imgURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: - REST calls
    // Sets IB-Outlet UIImage() from URL Input
    func imgImport(imageUrl:String) {
        
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!

        let session = NSURLSession.sharedSession()
        let url = NSURL(string: imageUrl)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            // Read the JSON
            do {
               self.fbProfileImage.image = UIImage(data:data!)
                print("image loaded")
            }
        }).resume()
    }
}
