//
//  NewsService.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class NewsService {
    
    func getTopHeadlines(country: String, successBlock:((_ isSuccess: Bool, _ topHeadlinesResponse: [News])->Void)?, errorBlock:((_ errorCode: String, _ errorString: String)->Void)?)->Void {
        
        let parameters = ["country": country] as [String: Any]
            
        let headers : HTTPHeaders = ["Content-Type": "application/json",
                       "X-Api-Key": TheEndpointURLManager.apiKey]
        
        print("Endpoint topHeadlines : \(TheEndpointURLManager.endpoint)")
        
        AF.request("\(TheEndpointURLManager.serverUrl)/\(TheEndpointURLManager.endpoint)", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            print("Response : \(response)")
            
            switch response.result {

            case .success(let value):
                let jsonObj = JSON(value)
                
                var success: Bool = false
                if jsonObj["starus"].stringValue == "ok" {
                    success = true
                }
                
                var topNewsArray = [News]()
                
                for i in 0..<jsonObj["articles"].count {
                    let theTopHeadlines = News()
                    theTopHeadlines.populateJSON(jsonObj["articles"][i])
                    topNewsArray.append(theTopHeadlines)
                }
                
                successBlock!(success, topNewsArray)
                
            case .failure(let error):
                print(response.error!)
                let reachabiityManager = NetworkReachabilityManager()
                if  reachabiityManager?.isReachable ?? false {
                    let statusCode = "\(response.response?.statusCode ?? 0)"
                    print("statuscode", statusCode)
                    print("\(statusCode) : Server Tidak Tersedia")
                } else {
                    print("-1", "Periksa Koneksi Internet")
                }
            }
        }
    }
    
    func getExploreNews(category: String, successBlock:((_ isSuccess: Bool, _ topHeadlinesResponse: [News])->Void)?, errorBlock:((_ errorCode: String, _ errorString: String)->Void)?)->Void {
        
        let parameters = ["category": category] as [String: Any]
            
        let headers : HTTPHeaders = ["Content-Type": "application/json",
                       "X-Api-Key": TheEndpointURLManager.apiKey]
        
        print("Endpoint explore: \(TheEndpointURLManager.endpoint)")
        
        AF.request("\(TheEndpointURLManager.serverUrl)/\(TheEndpointURLManager.endpoint)", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            print("Response : \(response)")
            
            switch response.result {

            case .success(let value):
                let jsonObj = JSON(value)
                
                var success: Bool = false
                if jsonObj["starus"].stringValue == "ok" {
                    success = true
                }
                
                var topNewsArray = [News]()
                
                for i in 0..<jsonObj["articles"].count {
                    let theTopHeadlines = News()
                    theTopHeadlines.populateJSON(jsonObj["articles"][i])
                    topNewsArray.append(theTopHeadlines)
                }
                
                successBlock!(success, topNewsArray)
                
            case .failure(let error):
                print(response.error!)
                let reachabiityManager = NetworkReachabilityManager()
                if  reachabiityManager?.isReachable ?? false {
                    let statusCode = "\(response.response?.statusCode ?? 0)"
                    print("statuscode", statusCode)
                    print("\(statusCode) : Server Tidak Tersedia")
                } else {
                    print("-1", "Periksa Koneksi Internet")
                }
            }
        }
    }
}
