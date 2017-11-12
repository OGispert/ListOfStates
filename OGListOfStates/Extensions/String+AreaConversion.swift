//
//  NSString+AreaConversion.swift
//  OGListOfStates
//
//  Created by Gispert Pelaez, Othmar (Accenture) on 11/12/17.
//  Copyright © 2017 iGispert. All rights reserved.
//

import UIKit
import Foundation

extension String
{
    func convertAreaToMiles() -> String
    {
        let areaInKMS = self
        
        let areaAsDouble = formatString(areaAsString: areaInKMS)
        
        let areaInMiles = areaAsDouble/1.609344
        
        return String(format:"%f", areaInMiles) + " Miles"        
    }
    
    func formatString(areaAsString: String?) -> Double
    {
        if let areaString = areaAsString
        {
            let area = areaString.dropLast(3)
            
            if let areaAsDouble = Double(area)
            {
                return areaAsDouble
            }
        }
        return Double()
    }
}
