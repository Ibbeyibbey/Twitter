//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Isha Brown on 10/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId: Int = -1
    var retweeted:Bool = false
    
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
        })
    };else {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: false)
            }, failure : { (error) in
                print("Unfavorite did not succeed \(error)")
            })
        
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(_isRetweeted: true)
        }, failure: {(error) in print("Error in retweeting: \(error)")
        
        })
        
    }
    func setRetweeted(_isRetweeted:Bool) {
        if (_isRetweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for:
                UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for:
                UIControl.State.normal)
            retweetButton.isEnabled = true
            
        }
    }
    
    func setFavorite(_isFavorited: Bool){
        favorited = _isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for:UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named:"favor-icon-1"), for: UIControl.State.normal)
        }
    
    
    
        func awakeFromNib() {
        super.awakeFromNib()
    }
    
        func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
    }
    
}
