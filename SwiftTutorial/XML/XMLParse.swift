//
//  XMLParse.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 20/12/15.
//  Copyright © 2015 AliGungor. All rights reserved.
//

import UIKit

class XMLParse: NSObject, NSXMLParserDelegate {

    var parser = NSXMLParser()
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
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://rss.cnn.com/rss/edition_space.rss"))!)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName
        if (elementName as NSString).isEqualToString("item")
        {
            title = NSMutableString()
            title = ""
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if element.isEqualToString("title") {
            title.appendString(string)
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("item") {
            titles.addObject(title)
        }
    }
    
}
