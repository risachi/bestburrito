//
//  SearchResultsController.swift
//  best-burrito
//
//  Created by Lisa on 12/11/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

import UIKit

protocol LocateOnTheMap{
    func locateWithLongitude(lon:Double, andLatitude lat:Double, andTitle title: String)
}

class SearchResultsController: UITableViewController {
    
    var searchResults: [String]!
    var delegate: LocateOnTheMap!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchResults = Array()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = self.searchResults[indexPath.row]

        return cell
    }

    // Dismiss SearchResultsController.swift
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath){
        self.dismiss(animated: true, completion: nil)
        
        let correctedAddress:String! = self.searchResults[indexPath.row].addingPercentEncoding(withAllowedCharacters:NSCharacterSet.symbols)
        
        let url = NSURL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=\(correctedAddress)&sensor=false")
        
        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) -> Void in
            
            do {
                if data != nil{
                    let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                    
                    let lat = ((((dict["results"] as! NSDictionary).value(forKey: "geometry") as! NSDictionary).value(forKey: "location") as! NSDictionary).value(forKey: "lat") as! NSDictionary).object(forKey: 0) as! Double
                    let long = ((((dict["results"] as! NSDictionary).value(forKey: "geometry") as! NSDictionary).value(forKey: "location") as! NSDictionary).value(forKey: "lng") as! NSDictionary).object(forKey: 0) as! Double
                    
                    self.delegate.locateWithLongitude(lon: long, andLatitude: lat, andTitle: self.searchResults[indexPath.row] )
                }
            }catch {
                print("Error")
            }
        }
        task.resume()
    }

}
