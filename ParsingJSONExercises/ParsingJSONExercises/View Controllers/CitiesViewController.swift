//
//  CitiesViewController.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allCities = [City]()
    @IBOutlet weak var citiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citiesTableView.delegate = self
        self.citiesTableView.dataSource = self
        loadData()
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "WeatherData", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.allCities = City.getCities(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = allCities[indexPath.row]
        let cityCell = tableView.dequeueReusableCell(withIdentifier: "City Cell", for: indexPath)
        cityCell.textLabel?.text = city.name
        cityCell.detailTextLabel?.text = city.id.description
        return cityCell
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
