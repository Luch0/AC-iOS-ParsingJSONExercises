//
//  GOTHouse.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class GOTHouse {
    let name: String
    let region: String

    init(name: String, region: String) {
        self.name = name
        self.region = region
    }
    convenience init?(from dict: [String: Any]) {
        let theName = dict["name"] as? String ?? "Unknown name"
        let theRegion = dict["region"] as? String ?? "Unknown region"
        self.init(name: theName, region: theRegion)
    }
    
    static func getGOTHouses(from data: Data) -> [GOTHouse] {
        var houses = [GOTHouse]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let housesArr = json as? [[String: Any]] else { return [] }
            for houseDict in housesArr {
                if let newHouse = GOTHouse(from: houseDict) {
                    houses.append(newHouse)
                }
            }
        }
        catch {
            print("Error")
        }
        return houses
    }
    
}
