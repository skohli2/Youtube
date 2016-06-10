//
//  HamburgerViewController.swift
//  Youtube
//
//  Created by Sumit Kohli on 6/9/16.
//  Copyright © 2016 Sumit Kohli. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    var feedViewOriginalCenterX: CGFloat!
    var closedPositionCenterX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController")
        addChildViewController(feedViewController)
        feedView.addSubview(feedViewController.view)
        feedViewController.didMoveToParentViewController(self)
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        addChildViewController(menuViewController)
        menuView.addSubview(menuViewController.view)
        menuViewController.didMoveToParentViewController(self)
        
        closedPositionCenterX = feedView.center.x
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onDidPan(sender: UIPanGestureRecognizer) {
        
        let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            feedViewOriginalCenterX = feedView.center.x
            print("Gesture began")
        } else if sender.state == UIGestureRecognizerState.Changed {
            feedView.center.x = feedViewOriginalCenterX + translation.x
            print("Gesture is changing")
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended")
            
            if velocity.x < 0 {
                UIView.animateWithDuration(0.2, animations: {
                     print("closing")
                    self.feedView.center.x = self.closedPositionCenterX
                    
                })
            } else {
                print("opening")
                UIView.animateWithDuration(0.2, animations: {
                    self.feedView.center.x = 420
                })
            }
        }
        
        
    }
}
