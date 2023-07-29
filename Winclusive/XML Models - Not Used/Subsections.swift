//
//  Subsections.swift
//  RMC_Thesis_CS6200
//
//  Created by Rebecca Rose McCarthy
//  Student Number: 121105576
//  Course Code: MScIM22
//
//

import Foundation

class Subsections {
    //attributes
    var topic : String
    var description : String
    
    //init-s
    init(){
        self.topic            = "John Doe"
        self.description     = "None"
    }
    
    init(topic:String, description:String) {
        self.topic            = topic
        self.description     = description
    }
}
