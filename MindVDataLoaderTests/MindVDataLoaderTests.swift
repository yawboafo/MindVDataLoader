//
//  MindVDataLoaderTests.swift
//  MindVDataLoaderTests
//
//  Created by Engineer 144 on 27/06/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import XCTest
@testable import MindVDataLoader

class MindVDataLoaderTests: XCTestCase {

    private let dataLoader = MOperationManager()
   
    var mcache = MUrlCache()
    var defaultCapacity : Int!
    override func setUp() {
     
        
        defaultCapacity = 30
        mcache.configureMaxmemoryLimit(maxMemoryLimit: 90)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func test_configurable_cache_memory_capacity(){
        
        
        XCTAssert(defaultCapacity <  mcache.sharedCache.memoryCapacity, "Configured Cache Total Cost Limit was updated")
        
    }
    
    
    
    func test_operations(){
        
        
       
        for i in 1...100{
            
            dataLoader.loadData(urlString: "www.google.com") { data in
                
                print(data)
            }
        }
    }
    
    
    
    func test_operation_cancellation(){
        
        
      
        for i in 1...10{
            
            dataLoader.loadData(urlString: "www.google.com/\(i)") { data in
                
                print(data)
            }
        }
        
        
       // dataLoaderManager.ca
        
        dataLoader.cancelOperation(operationID: "www.google.com/\(10)", completionHandler: {  value,bool  in
            
            
         XCTAssert(bool,value)
         
            
        } )
        
        
       
       
        
        
    }

}
