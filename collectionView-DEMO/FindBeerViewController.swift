
//
//import UIKit
//
//class FindBeerViewController: UIViewController {
//
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    func findBeerAsync(data: String, completion: (jsonData: NSArray?, error: NSError?)->Void) {
//        var jsonData: NSArray = []
//        
//        let post: NSString = "data=\(data)"
//        let url = NSURL(string: links_web.findData() as String)!
//        let postData = post.dataUsingEncoding(NSUTF8StringEncoding)!
//        
//        let postLength = String(postData.length)
//        //Setting up `request` is similar to using NSURLConnection
//        let request = NSMutableURLRequest(URL: url)
//        request.HTTPMethod = "POST"
//        request.HTTPBody = postData
//        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        
//        
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(request) {urlData, response, reponseError in
//            
//            if let receivedData = urlData {
//                let res = response as! NSHTTPURLResponse!;
//                
//                NSLog("Response code: %ld", res.statusCode);
//                
//                if 200..<300 ~= res.statusCode {
//                    do {
//                        jsonData = try NSJSONSerialization.JSONObjectWithData(receivedData, options: []) as! NSArray
//                        //On success, invoke `completion` with passing jsonData.
//                        completion(jsonData: jsonData, error: nil)
//                    } catch let error as NSError {
//                        let returnedError = NSError(domain: "findBeerAsync", code: 3, userInfo: [
//                            "title": "Busca falhou!",
//                            "message": "Dados inválidos!",
//                            "cause": error
//                            ])
//                        //On error, invoke `completion` with NSError.
//                        completion(jsonData: nil, error: returnedError)
//                    }
//                } else {
//                    let returnedError = NSError(domain: "findBeerAsync", code: 1, userInfo: [
//                        "title": "Busca falhou!",
//                        "message": "Falha de conexão!"
//                        ])
//                    //On error, invoke `completion` with NSError.
//                    completion(jsonData: nil, error: returnedError)
//                }
//            } else {
//                var userInfo: [NSObject: AnyObject] = [
//                    "title": "Busca falhou!",
//                    "message": "Conexão falhou"
//                ]
//                if let error = reponseError {
//                    userInfo["message"] = error.localizedDescription
//                    userInfo["cause"] = error
//                }
//                let returnedError = NSError(domain: "findBeerAsync", code: 2, userInfo: userInfo)
//                //On error, invoke `completion` with NSError.
//                completion(jsonData: nil, error: returnedError)
//            }
//        }
//        task.resume()
//        //You should not write any code after `task.resume()`
//    }  
//}
