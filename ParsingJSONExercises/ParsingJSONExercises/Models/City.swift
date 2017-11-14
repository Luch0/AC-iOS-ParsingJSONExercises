//
//  City.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class City {
    let name: String
    let id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    convenience init?(from dict: [String: Any]) {
        let theName = dict["name"] as? String ?? "Unknown name"
        let theId = dict["id"] as? Int ?? 0
        self.init(name: theName, id: theId)
    }
    
    static func getCities(from data: Data) -> [City] {
        var cities = [City]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = json as? [String: Any] else { return [] }
            guard let citiesArr = jsonDict["list"] as? [[String: Any]] else {return [] }
            for cityDict in citiesArr {
                if let newCity = City(from: cityDict) {
                    cities.append(newCity)
                }
            }
        }
        catch {
            print("Error")
        }
        return cities
    }
    
}
