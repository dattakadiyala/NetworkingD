//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by Datta on 3/10/16.
//  Copyright © 2016 Kadiyala Datta venkatesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLConnectionDelegate {
    let urlPath:String = "http://kshttest.org/kshtstore/public/services/api/v1/store/products/Puja"
    let data:NSMutableData = NSMutableData()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url:NSURL = NSURL(string:urlPath)!
        let request:NSURLRequest = NSURLRequest(URL: url)
        let connection:NSURLConnection = NSURLConnection(request: request, delegate: self)!
        connection.start()
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData){
        self.data.appendData(data)
    
    }
    
     func connectionDidFinishLoading(connection: NSURLConnection){
        do{
            
            let jsonresult:NSDictionary = try (NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary)!
            print(jsonresult)
            
        }
        catch{
            print("failed")
        }
    
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse){
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

