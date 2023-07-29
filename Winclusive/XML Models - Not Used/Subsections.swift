//
//  Subsections.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//

import Foundation

class Subsections {
    //attributes
    var topic : String
    var description : String
    
    //init-s
    init(){
        self.topic           = "John Doe"
        self.description     = "None"
    }
    
    init(topic:String, description:String) {
        self.topic           = topic
        self.description     = description
    }
}
