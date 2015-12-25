//
//  ViewController.swift
//  collectionView-DEMO
//
//  Created by Jon Harlan on 12/24/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageArray =    [
                            UIImage(named:"sample-img-1"),
                            UIImage(named:"sample-img-2"),
                            UIImage(named:"sample-img-3"),
                            UIImage(named:"sample-img-4")
                        ]
    let appleProducts = ["iPhone","Apple Watch","Mac","iPad Pro"]
    
    var sitterArrayUrl = []
//***********************************************************************//
// -----------------------      VIEW-DID-LOAD   ------------------------ //
    override func viewDidLoad() { super.viewDidLoad()
    //SET INITIAL VALUES HERE...
        getSitterData()
    }// END -------------------    VIEW DID LOAD    ------------------- END  //
//START - - - - - - - -  - - -  - - - MEMORY-WARNING - - - - - - - -  - - -  START//
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
// ---------------------     END BASE METHODS    ---------------------- //
//***********************************************************************//
    
//_______________________________________________________________________//
// ===================================================================== //
// ==================== Custom Collection View Methods ================= //
// ===================================================================== //
    func getSitterData() {
        var urlBaseRef = "https://sitterbookapi.firebaseio.com/users/10205360690837256/fbfriends/first-degree/"
        let testRef00 = Firebase(url:urlBaseRef + "2")
        let testRef01 = Firebase(url:urlBaseRef + "5")
        let testRef02 = Firebase(url:urlBaseRef + "23")
        let testRef03 = Firebase(url:urlBaseRef + "27")
        let testRef04 = Firebase(url:urlBaseRef + "33")
        let testRef05 = Firebase(url:urlBaseRef + "34")
        let testRef06 = Firebase(url:urlBaseRef + "35")
        let testRef07 = Firebase(url:urlBaseRef + "39")
        let testRef08 = Firebase(url:urlBaseRef + "40")
        let sitterInfoArray = [testRef00,testRef01,testRef02,testRef03,testRef04,testRef05,testRef06,testRef07,testRef08]
        
        sitterArrayUrl = sitterInfoArray as Array
        
        sitterInfoArray.forEach { element in
            // do something with the element
            element.observeEventType(.Value, withBlock: {
                snapshot in
//                print(snapshot.value)
                var sitterData = snapshot.value.objectForKey("picture")?.objectForKey("data")?.objectForKey("url")
                print(sitterData)
            })
        }
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.appleProducts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        cell.titleLabel?.text = self.appleProducts[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showImage", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage"{
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! NewViewController
            
            vc.image = self.imageArray[indexPath.row]!
            vc.title = self.appleProducts[indexPath.row]
        }
    }
    
}
