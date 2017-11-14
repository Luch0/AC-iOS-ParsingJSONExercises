//
//  SongsViewController.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allSongs = [Song]()
    @IBOutlet weak var SongsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SongsTableView.delegate = self
        self.SongsTableView.dataSource = self
        loadData()
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "SongsData", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.allSongs = Song.getSongs(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = allSongs[indexPath.row]
        let songCell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        songCell.textLabel?.text = song.name
        songCell.detailTextLabel?.text = song.artist
        return songCell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
