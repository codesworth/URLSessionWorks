//
//  AuthSession.swift
//  URLSessionsLessons
//
//  Created by Shadrach Mensah on 16/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//


import UIKit


class AuthSession{
    
    let config = URLSessionConfiguration.default
   
    var session:URLSession
    
    init() {
        config.waitsForConnectivity = true
        session = URLSession(configuration: config)
    }
    
    //Authentication Setup
    
    func signIn(){
        let baseURL = URL(string: "https://tilftw.herokuapp.com/")
        let newUserEndpoint = URL(string: "users", relativeTo: baseURL)
        let loginEndpoint = URL(string: "login", relativeTo: baseURL)
        let newEndpoint = URL(string: "new", relativeTo: baseURL)
        let user = User(name: "jo", email: "jo@razeware.com", password: "password")
        let loginString = "\(user.email):\(user.password)"
        let logindata = loginString.data(using: .utf8)
        let encodedString = logindata!.base64EncodedData(options: Data.Base64EncodingOptions(rawValue: 0))
        var loginRequest = URLRequest(url: loginEndpoint!)
        loginRequest.httpMethod = "Post"
        loginRequest.allHTTPHeaderFields = [
            "accept" : "application/json",
            "content-type" : "application/json",
            "authorization" : "Basic \(encodedString)"
        ]
        var auth = Auth(token: "")
        session.dataTask(with: loginRequest){
            (data, response, error) in
            guard let response = response, let data = data else {return}
            print(response)
            
            do{
                auth = try decoder.decode(Auth.self, from: data)
                auth.token
            }catch let decodeError as NSError{
                print("Decode error: ",decodeError.debugDescription)
                return
            }
            
            var tokenRequest = URLRequest(url: newEndpoint!)
            tokenRequest.httpMethod = "Post"
            tokenRequest.allHTTPHeaderFields = [
                "accept" : "application/json",
                "content-type" : "application/json",
                "authorization" : "Bearer \(auth.token)"
            ]
            let acronym = Acronym(short: "DOV", long: "Dutifully On Valva")
            
            do{
                tokenRequest.httpBody = try encoder.encode(acronym)
                
            }catch let decodeError as NSError{
                print("Decode error: ",decodeError.debugDescription)
                return
            }
            
            self.session.dataTask(with: tokenRequest){
                (response, data, error) in
                
                if let response = response{
                    print("This is final: \(response)")
                }
                
            }.resume()
        }.resume()
        
    }
    
}

//: ## Authentication: How to login to get an authentication token


//: Endpoints for web app:

//: `Codable` structs for User, Acronym, Auth:
struct User: Codable {
    let name: String
    let email: String
    let password: String
}

struct Acronym: Codable {
    let short: String
    let long: String
}

struct Auth: Codable {
    let token: String
}

let encoder = JSONEncoder()
let decoder = JSONDecoder()

//: Prep a new user

