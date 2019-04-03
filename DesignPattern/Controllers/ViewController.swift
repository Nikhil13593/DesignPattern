//
//  ViewController.swift
//  DesignPattern
//
//  Created by Nikhil Patil on 03/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

    @IBOutlet weak var tableView: UITableView!
    
    var appsData:AppleApps?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getDataFromServer()
       
    }

    func getDataFromServer() {
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/25/explicit.json")!
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            do {
                
                self.appsData = try JSONDecoder().decode(AppleApps.self, from: data!)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                
            }
            
        }.resume()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
//        guard let results = appsData?.feed.results else {
//            return 0
//        }
//
//        return results.count
        
//
        
//        if let results = appsData?.feed.results {
//            return results.count
//        } else {
//            return 0
//        }
        
        return appsData?.feed.results.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.appNameLabel.text = appsData?.feed.results[indexPath.row].name
        
        let imgURL = URL(string: (appsData?.feed.results[indexPath.row].artworkUrl100)!)!
        
        cell.appImageView!.sd_setImage(with: imgURL) { (response, error, type, url) in
            
        }
        
        return cell
        
    }

    
}

