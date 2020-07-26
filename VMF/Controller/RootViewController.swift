//
//  ViewController.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/22/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import UIKit
import AVKit

class RootViewController: UIViewController {

    
    var videoPlayer:AVPlayer?
    //what the viewer sees
    var videoPlayerLayer:AVPlayerLayer?
    //The AVPlayer item is going to be the media, we will create the AVplaye item and point it to the mp4.file and use the AVPlayer item to initialize the AVplayer and from the Avplayer we create a a AVplayer layer and thats whats going to be displayed
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()

setUpElements() //for setting up button designs
    }
    func setUpElements() {
       Utilities.styleFilledButton(signUpBtn)
       Utilities.styleHollowButton(loginBtn)
       }
    
   
   
    
    
    override func viewWillAppear(_ animated: Bool) {
          //set up video in the background
setUpVideo() // for setting up the background video
          
      }
    //Better to run the video in a viewWillAppear other then just in viewdidload because it's faster
    func setUpVideo() {
        //get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "Stang", ofType: "mp4")
        if bundlePath != nil {
            print("Project is working")
        } else {
            return
        }
        //Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        //Create the videoplayer item
        let item = AVPlayerItem(url: url)
        //create the player
        videoPlayer = AVPlayer(playerItem: item)
        //create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        //adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.3, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
               
        //add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.5)
        
    
    }
    
  
    
  
   

}

