//
//  FieldSurveyEventsJSONLoader.swift
//  Field Survey
//
//  Created by Clayton Cornett on 7/20/17.
//  Copyright © 2017 Clayton Cornett. All rights reserved.
//

import Foundation


class FieldSurveyEventJSONLoader {
    
    class func load(fileName: String) -> [FieldSurveyEvent]{
        
        var observations = [FieldSurveyEvent]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
            
            observations = FieldSurveyEventJSONParser.parse(data)
        }
        
        return observations
    }
    
}
