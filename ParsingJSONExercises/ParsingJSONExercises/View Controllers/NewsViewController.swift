//
//  NewsViewController.swift
//  ParsingJSONExercises
//
//  Created by Luis Calle on 11/14/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var newsTableView: UITableView!
    var allNews = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        loadData()
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "NewsData", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.allNews = News.getNews(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = allNews[indexPath.row]
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "News Cell", for: indexPath)
        newsCell.textLabel?.text = news.title
        newsCell.detailTextLabel?.text = news.author
        return newsCell
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
