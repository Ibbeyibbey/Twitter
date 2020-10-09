//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Isha Brown on 10/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var tweetArray = [NSDictionary]()
    var numberOfTweets : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet()

    }
    //This function or method calls the API
    func loadTweets(){
        
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["counts": 10]
    
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams, success:
            {(tweets: [NSDictionary]) in
                
                self.tweetArray.removeAll()
                for tweet in tweets {
                    self.tweetArray.append(tweet)
                }
            
                
                self.tableView.reloadData()
                
            }, failure: { (Error) in
                print("Sorry, Could not get tweets...")
            })
    }

    
    
    
    
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        cell.userNameLabel.text = "Some name"
        cell.tweetContent.text = tweetArray[indexPath.row]["text"] as! String
        
        return cell 
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }

}
