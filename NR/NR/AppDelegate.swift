//
//  AppDelegate.swift
//  NR
//
//  Created by NagaiNaoki on 2017/08/15.
//  Copyright © 2017年 NoR. All rights reserved.
//

import UIKit
import SocketIO
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var socket: SocketIOClient!
    var isConnected: Bool = false
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //socket使用しまーす
        socket = SocketIOClient(socketURL: URL(string: "https://nrserver.herokuapp.com")!, config: [.forceWebsockets(true)])
        
        
        socket.on("disconnect") { data, ack in
            print("socket disconnected")
            self.isConnected = false
        }
        if isConnected != true {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                self.socket.on("connect") { data, ack in
                    print("socket connected")
                    //          self.socket.emit("access", name)
                    self.socket.emit("in_socket","hoge")
                }
                self.socket.connect()
                self.socket.emit("rm_access",0)
                self.isConnected = true
            }
        }
        socket.on("rm_full"){data, ack in
            print(data[0])
            print("rmfulldayo")
        }
        
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

