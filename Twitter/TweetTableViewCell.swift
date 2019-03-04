//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Shayna Patel on 2/23/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    var tweetId:Int = -1
    var favorited:Bool = false
    var retweeted:Bool = false

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var faveButton: UIButton!
    
    @IBAction func faveTweet(_ sender: Any) {
        let toBeFaved = !favorited
        if (toBeFaved){
            TwitterAPICaller.client?.faveTweet(tweetId: tweetId
                , success: {
                    self.setFavorite(true)
            }, failure: { (error) in
                print ("favorite did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfaveTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print ("unfavorite did not succeed: \(error)")
            })
        }
    }
    
    
    
    @IBAction func retweetTweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
        if (toBeRetweeted){
            TwitterAPICaller.client?.retweet(tweetId: tweetId
                , success: {
                    self.setRetweeted(true)
            }, failure: { (error) in
                print ("retweet did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unRetweet(tweetId: tweetId, success: {
                self.setRetweeted(false)
            }, failure: { (error) in
                print ("retweet did not succeed: \(error)")
            })
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited == true){
            faveButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            faveButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        retweeted = isRetweeted
        if (isRetweeted == true){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            //retweetButton.isEnabled = false
        }
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            //retweetButton.isEnabled = true
        
        }
    }
    

    
    
    
}
