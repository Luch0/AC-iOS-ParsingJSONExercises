//
//  Color.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class Color {
    let name: String
    let hex: String
    
    init(name: String, hex: String) {
        self.name = name
        self.hex = hex
    }
    convenience init?(from dict: [String: Any]) {
        guard let colorDictName = dict["name"] as? [String: Any] else { return nil }
        guard let colorDictHex = dict["hex"] as? [String: Any] else { return nil }
        let theName = colorDictName["value"] as? String ?? "Unknown name"
        let theHex = colorDictHex["value"] as? String ?? "Unknown hex value"
        self.init(name: theName, hex: theHex)
    }
    
    static func getColors(from data: Data) -> [Color] {
        var colors = [Color]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = json as? [String: Any] else { return [] }
            guard let colorArr = jsonDict["colors"] as? [[String: Any]] else {return [] }
            for colorDict in colorArr {
                if let newColor = Color(from: colorDict) {
                    colors.append(newColor)
                }
            }
        }
        catch {
            print("Error")
        }
        return colors
    }
    
}
