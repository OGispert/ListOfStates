//
//  ListOfStatesModel.swift
//  OGListOfStates
//
//  Created by Othmar Gispert on 11/8/17.
//  Copyright © 2017 Othmar Gispert. All rights reserved.
//

import Foundation
import ObjectMapper

class StateItemsModel: Mappable
{
    var stateNames = [String]()
    var stateAbbrs = [String]()
    var stateCapitals = [String]()
    var stateCountries = [String]()
    var stateCities = [String]()
    var stateAreas = [String]()
    
    required init?(map: Map)
    {
        
    }
    
    func mapping (map: Map)
    {
        stateNames      <-  map["name"]
        stateAbbrs      <-  map["abbr"]
        stateCapitals   <-  map["capital"]
        stateCountries  <-  map["country"]
        stateCities     <-  map["largest_city"]
        stateAreas      <-  map["area"]
    }
}

