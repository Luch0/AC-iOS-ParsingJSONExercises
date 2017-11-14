//
//  ColorViewController.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var colorsTableView: UITableView!
    
    var allColors = [Color]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorsTableView.delegate = self
        self.colorsTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "ColorsData", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.allColors = Color.getColors(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = allColors[indexPath.row]
        let colorCell = tableView.dequeueReusableCell(withIdentifier: "Color Cell", for: indexPath)
        colorCell.textLabel?.text = color.name
        colorCell.detailTextLabel?.text = color.hex
        return colorCell
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
