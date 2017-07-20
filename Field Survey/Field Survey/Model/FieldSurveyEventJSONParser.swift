//
//  FieldSurveyEventJSONParser.swift
//  Field Survey
//
//  Created by Clayton Cornett on 7/20/17.
//  Copyright © 2017 Clayton Cornett. All rights reserved.
//

import Foundation


class FieldSurveyEventJSONParser {
    
     static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [FieldSurveyEvent]{
        
    
    var fieldSurveyEvents = [FieldSurveyEvent]()
        
    dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
           let root = json as? [String: Any],
           let status = root["status"] as? String,
           status == "ok" {
            
            if let observations = root["observations"] as? [Any]{
                for observation in observations{
                    if let observation = observation as? [String: String]{
                        if let classification = observation["classification"],
                           let title = observation["title"],
                           let description = observation["description"],
                           let dateString = observation["date"],
                           let date = dateFormatter.date(from: dateString){
                            
                            if let fieldSurveyEvent = FieldSurveyEvent(classification: classification, title: title, description: description, date: date){
                                
                                fieldSurveyEvents.append(fieldSurveyEvent)
                            }
                        }
                    }
                }
            }
        }
    
    
    
    return fieldSurveyEvent
    }
}
