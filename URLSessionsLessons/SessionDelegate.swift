//
//  SessionDelegate.swift
//  URLSessionsLessons
//
//  Created by Shadrach Mensah on 14/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation



class SessionDelegate:NSObject, URLSessionTaskDelegate{
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = round(Float(totalBytesSent) / Float(totalBytesExpectedToSend) * 100)
        print("Progress at: \(progress)%")
    }
}
