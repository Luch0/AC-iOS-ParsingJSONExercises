//
//  Song.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class Song {
    let name: String
    let artist: String
    
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    convenience init?(from dict: [String: Any]) {
        let theName = dict["song_name"] as? String ?? "Unknown name"
        let theArtist = dict["display_artist"] as? String ?? "Unknown artist"
        self.init(name: theName, artist: theArtist)
    }
    
    static func getSongs(from data: Data) -> [Song] {
        var songs = [Song]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let songsArr = json as? [[String: Any]] else { return [] }
            for songDict in songsArr {
                if let newSong = Song(from: songDict) {
                    songs.append(newSong)
                }
            }
        }
        catch {
            print("Error")
        }
        return songs
    }
    
}
