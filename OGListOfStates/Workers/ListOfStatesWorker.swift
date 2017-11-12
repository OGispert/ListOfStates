//
//  ListOfStaesWorker.swift
//  OGListOfStates
//
//  Created by Othmar Gispert on 11/9/17.
//  Copyright © 2017 Othmar Gispert. All rights reserved.
//

import Foundation

class ListOfStatesWorker
{
    func downloadListOfStates(with results: StateItemsModel)
    {        
        let statesURL = URL(string: URL_PATH)
        
        do
        {
            if let url = statesURL
            {
                let statesData = try Data(contentsOf: url)
                
                let statesJson = try JSONSerialization.jsonObject(with: statesData, options: .allowFragments) as! [String:Any]
                
                if let restList = statesJson["RestResponse"] as? [String:Any]
                {
                    if let result = restList["result"] as? [[String:Any]]
                    {
                        for states in result
                        {
                            if let names = states["name"] as? String, let abbreviations = states["abbr"] as? String, let capitals = states["capital"] as? String, let countries = states["country"] as? String, let cities = states["largest_city"] as? String, let areas = states["area"] as? String
                            {
                                let areaInMiles = areas.convertAreaToMiles()
                                
                                results.stateNames.append(names)
                                results.stateAbbrs.append(abbreviations)
                                results.stateCapitals.append(capitals)
                                results.stateCountries.append(countries)
                                results.stateCities.append(cities)
                                results.stateAreas.append(areaInMiles)
                            }
                        }
                    }
                    print("We have the results")
                }
            }
        }
        catch
        {
            print("There was an error")
        }
    }
}
