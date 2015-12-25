//
//  ImportDataViewController.swift
//  collectionView-DEMO
//
//  Created by Jon Harlan on 12/24/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

class ImportDataViewController: UIViewController {

    @IBOutlet weak var fbProfileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

                load_image("https://scontent.xx.fbcdn.net/hprofile-xpf1/v/t1.0-1/p50x50/12341306_10102633254728324_6688774623411957066_n.jpg?oh=660c0b378f7d4ebb62244d63d4eef9c6&oe=571D5809")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

        func load_image(urlString:String) {
            var imgURL: NSURL = NSURL(string: urlString)!
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            NSURLConnection.sendAsynchronousRequest(
                request, queue: NSOperationQueue.mainQueue(),
                completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?) -> Void in
                    if error == nil {
                        self.fbProfileImage.image = UIImage(data: data!)
                    }
            })
        }

}
