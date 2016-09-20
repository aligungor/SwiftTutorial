//
//  FileDownloader.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 14/06/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class FileDownloader: NSObject, NSURLConnectionDataDelegate {
    let downloadLink = "http://download.wavetlan.com/SVV/Media/HTTP/H264/Other_Media/H264_test5_voice_mp4_480x360.mp4"
    var connection = NSURLConnection()
    
    var totalBytes = 0
    var receivedBytes = 0
    var downloadData = NSMutableData()
    var downloadPercent : Float = 0
    
    func startDownload() {
        print("download starting...")
        let url = URL(string: downloadLink)
        let request = NSMutableURLRequest(url: url!)
        connection = NSURLConnection(request: request as URLRequest, delegate: self)!
        connection.start()
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        let httpResponse = response as! HTTPURLResponse
        var dict = httpResponse.allHeaderFields
        let stringLength = dict["Content-Length"] as! String
        self.totalBytes = Int(stringLength)!
        self.downloadData = NSMutableData(capacity: totalBytes)!
        print("responce received, total bytes to download : \(totalBytes)}")
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        self.downloadData.append(data)
        self.receivedBytes += data.count
        self.downloadPercent = (Float(receivedBytes) / Float(totalBytes)) * 100
        print("progress: %\(downloadPercent)")
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("download failed")
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        print("download completed")
        let paths = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0] 
        let path = "\(documentsDirectory)/sample.mp4"
        self.downloadData.write(toFile: path, atomically: true)
        print("file located at : \(path)")
    }
    
}
