//
//  RequestViewController.swift
//  Alamofire-Service
//
//  Created by Ruthlyn Huet on 3/31/21.
//

import UIKit
import Alamofire

class RequestViewController: UIViewController {
    
    
    var sURL: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Button Request..
    @IBAction func getRequestBtn(_ sender: Any) {
        getRequest()
    }
    
    
    func getRequest(){
        sURL = "https://httpbin.org/get"

        let serializer = DataResponseSerializer(emptyResponseCodes: Set([200, 204, 205]))
        
        guard let url = URL(string: sURL) else{return}
        
        let sRequest = URLRequest(url: url)
        
        AF.request(sRequest).uploadProgress {(progress) in
            
        }.response(responseSerializer: serializer){(response) in
            if response.error == nil{
                var responseMsg: String?
                
                responseMsg = ""
                
                if response.data != nil{
                    
                    guard let data = response.data else {return}
                    
                    responseMsg = String(bytes: data, encoding: .utf8)
                    
                }else{
                    responseMsg = response.response?.description
                }
                
                print(responseMsg ?? "")
                
                print("Status Code: \(response.response?.statusCode)")
                
                var responseData: NSData?
                
                guard let responseDatas = response.data as NSData? else {
                    return
                }
                
                
                print("Size: \(responseDatas.length)")
                
                print("Duration: \(response.metrics?.taskInterval.duration)")
                
                
                
            }
        }
        
    }
    

}
