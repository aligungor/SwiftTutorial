//
//  XMLParse.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 20/12/15.
//  Copyright © 2015 AliGungor. All rights reserved.
//

import UIKit

class XMLParse: NSObject, XMLParserDelegate {

    var parser = XMLParser()
    var element = NSString()
    
    var titles = NSMutableArray()
    var title = NSMutableString()
    
    class func parse() {
        let parser = XMLParse();
        print("parsing begins")
        parser.begin();
        print("parsing ends, titles from rss:")
        for t in parser.titles {
            print(t)
        }
    }
    
    func begin() {
        titles = []
        parser = XMLParser(contentsOf:(URL(string:"http://rss.cnn.com/rss/edition_space.rss"))!)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item")
        {
            title = NSMutableString()
            title = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "title") {
            title.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "item") {
            titles.add(title)
        }
    }
    
}
