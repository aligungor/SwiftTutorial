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
        println("download starting...")
        var url = NSURL(string: downloadLink)
        var request = NSMutableURLRequest(URL: url!)
        connection = NSURLConnection(request: request, delegate: self)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        var httpResponse = response as! NSHTTPURLResponse
        var dict = httpResponse.allHeaderFields
        var stringLength = dict["Content-Length"] as! String
        self.totalBytes = stringLength.toInt()!
        self.downloadData = NSMutableData(capacity: totalBytes)!
        println("responce received, total bytes to download : \(totalBytes)}")
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.downloadData.appendData(data)
        self.receivedBytes += data.length
        self.downloadPercent = (Float(receivedBytes) / Float(totalBytes)) * 100
        println("progress: %\(downloadPercent)")
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("download failed")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        println("download completed")
        let paths = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0] as! String
        var path = "\(documentsDirectory)/sample.mp4"
        self.downloadData.writeToFile(path, atomically: true)
        println("file located at : \(path)")
    }
    
}
