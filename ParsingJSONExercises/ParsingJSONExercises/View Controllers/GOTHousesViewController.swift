//
//  GOTHousesViewController.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class GOTHousesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var housesTableView: UITableView!
    var allHouses = [GOTHouse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.housesTableView.delegate = self
        self.housesTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "HousesData", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.allHouses = GOTHouse.getGOTHouses(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allHouses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let house = allHouses[indexPath.row]
        let houseCell = tableView.dequeueReusableCell(withIdentifier: "House Cell", for: indexPath)
        houseCell.textLabel?.text = house.name
        houseCell.detailTextLabel?.text = house.region
        return houseCell
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
