//
//  EndpointURLManager.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import Foundation

let TheEndpointURLManager = EndpointURLManager.sharedInstance

class EndpointURLManager {
    class var sharedInstance: EndpointURLManager {
        struct Static {
            static let instance: EndpointURLManager = EndpointURLManager()
        }
        return Static.instance
    }
    
//    let apiKey = "258b9a2693cb4b139531c02f797e72e9"
    let apiKey = "eda6154a62744b7bbad849130a7f7b6f"
    let serverUrl = "https://newsapi.org/"
    
    //Endpoint
    let endpoint = "v2/top-headlines"
}
