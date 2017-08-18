//
//  SelectViewController.swift
//  NR
//
//  Created by Riku Uchida on 2017/08/16.
//  Copyright © 2017年 NoR. All rights reserved.
//

import UIKit
import Foundation
import SocketIO


class SelectViewController: UIViewController {
    
    var socket: SocketIOClient!
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        socket = appDelegate.socket
        
//        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        socket = appDelegate.socket
       
        
        
//        var isConnected: Bool = false
        
//        socket.emit("in_socket","hoge")
        
//        if isConnected == false {
//            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
//                self.socket.connect()
//            }
//        }
//        socket.connect()
//
//        
//        
//        
//        // Do any additional setup after loading the view.
//        
//        //nameとcharaNumをemit"rm_accessで送る
//       let name = "hoge"
//        
               
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    
    @IBAction func ToBattle(_ sender: UIButton) {
        
//        socket.on("connect") { data, ack in
//            print("socket connected")
//            //print("send message")
//            //          self.socket.emit("access", name)
//            self.socket.emit("in_socket","hoge")
//        }
//        
//        socket.on("in_ok") { data, ack in
//            print("okkkkkkkkkkk")
//            //print("send message2")
//            // self.socket.emit("access", name)
//            //            isConnected = true
//        }
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Battle", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "Battle") as! BattleViewController
        self.present(nextView, animated: true, completion: nil)
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
