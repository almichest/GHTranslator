//
//  AppDelegate.swift
//  GlyphHackPractice
//
//  Created by Hiraku Ohno on 2015/01/31.
//  Copyright (c) 2015年 Hiraku Ohno. All rights reserved.
//

import UIKit
import GameKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var localPlayer: GKLocalPlayer?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        self.authenticateGamePlayer()
        Fabric.with([Crashlytics]());
        
        if !GlyphConfiguration.lauhcnedBefore {
            GlyphConfiguration.loadInitialValue();
        }
        
        GlyphFetcher.sharedFetcher().fetchGlyphs().continueWithSuccessBlock { (task) -> AnyObject? in
            Log.d("\(task.result)")
            
            return nil
        }
        
        return true
    }
    
    private func authenticateGamePlayer() {
        self.localPlayer = GKLocalPlayer()
        self.localPlayer!.authenticateHandler = {(viewController, error) -> Void in
            if (viewController != nil) {
                self.window!.rootViewController!.presentViewController(viewController!, animated: true, completion: nil)
            } else {
                if (error == nil) {
                    Log.d("authentication completed")
                    self.loadBestScores()
                } else {
                    Log.d("authentication failed")
                }
            }
        }
    }
    
    private func loadBestScores() {
        GKLeaderboard.loadLeaderboardsWithCompletionHandler { (leaderBoards, error) -> Void in
            guard error == nil else {
                Log.d("\(error)")
                return
            }
            
            
            guard let loaded = leaderBoards else {
                Log.d("leaderBoards are nil")
                return
            }
            
            Log.d("\(leaderBoards)")
            
            for leaderBoard:GKLeaderboard in loaded {
                leaderBoard.loadScoresWithCompletionHandler({ (scores, error) -> Void in
                    guard (scores != nil) else {
                        return
                    }
                    self.overwriteBestScores(scores!);
                })
            }
        }
    }
    
    private func overwriteBestScores(scores:[AnyObject?]) {
        if scores.count == 0 {
            return;
        }
        
        let score = scores[0] as! GKScore
        GlyphScore.overwriteLocalScore(score.leaderboardIdentifier, value: (Int)(score.value))
        Log.d("\(scores)")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

