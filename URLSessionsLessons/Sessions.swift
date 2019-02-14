//
//  Sessions.swift
//  URLSessionsLessons
//
//  Created by Shadrach Mensah on 14/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


class Sessions{
    
    let config = URLSessionConfiguration.default
    var session:URLSession
    
    let defaultUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    
    init() {
        config.waitsForConnectivity = true
        
        session = URLSession(configuration: config)
    }
    
    func fetch(_ url:URL? = nil){
        let url = url ?? defaultUrl
        let task = session.dataTask(with: url) { (data, response, errr) in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                return
            }
            guard let data = data else {
                print("Error occurred with sognature: ",errr?.localizedDescription ?? "Unknown")
                return
            }
            
            guard let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? else {return}
            print("The result was: ", result)
            
        }
        
        task.resume()
    }
    
    func post(_ data:Data? = nil){
        let data = data ?? "{'hello' : 'world'}".data(using: .utf8)
        let url = URL(string: "https://httpbin.org/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "Post"
        request.httpBody = data
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                guard let error = error else {return}
                print("Error out: ",error.localizedDescription)
                return}
            guard let data = data else {return}
            let postResp = String(data: data, encoding: .utf8)
            print("Response is: \(postResp ?? "No response")")
        }
        
        task.resume()
    }
}
