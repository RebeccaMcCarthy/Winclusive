//
//  Sections.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//

import Foundation

class Sections {
    //class data
    var subData : [Subsections]
    
    init() {
        //class init
        subData =
        [
            Subsections(topic:"topic", description:"desc"),
            Subsections(topic:"name1", description:"desc1"),
            Subsections(topic:"name2", description:"desc2"),
        ]
    }
    
    init(xmlFileName: String) {
        
        // make a XMLPeopleParser
        let parser = XMLDiscussionParser(fileName: xmlFileName)
        // parsing
        parser.parsing()
        
        // set peopleData with what it comes from parsing
        subData = parser.sections
    }
    
    //class methods
    func getCount()->Int{return subData.count}
    func getItem(index:Int)->Subsections{return subData[index]}
}
