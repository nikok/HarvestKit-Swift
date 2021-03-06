//
//  TestBase.swift
//  HarvestKit
//
//  Created by Matthew Cheetham on 10/01/2016.
//  Copyright © 2016 Matt Cheetham. All rights reserved.
//

import XCTest
import ThunderRequest
@testable import HarvestKitiOS

class TestBase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func loadDictionaryForFile(name: String!) -> [String: AnyObject]? {
        
        let jsonFilePath = NSBundle(forClass: self.dynamicType).pathForResource(name, ofType: "json")
        
        if let jsonPath = jsonFilePath, let jsonFileData = NSData(contentsOfFile: jsonPath) {
            
            do {
                if let jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonFileData, options: NSJSONReadingOptions.MutableContainers) as? [String: AnyObject] {
                    
                    return jsonObject
                }
                
            } catch let error as NSError {
                
                print(error)
            }
        }
        
        return nil
    }

}
