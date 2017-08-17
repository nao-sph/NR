//
//  BattleViewController.swift
//  NR
//
//  Created by Riku Uchida on 2017/08/16.
//  Copyright © 2017年 NoR. All rights reserved.
//

import UIKit
import SocketIO
import Foundation

class BattleViewController : SelectViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //        socket.emit("in_socket","hoge")
        //        socket.on("in_ok") { data, ack in
        //            print("outtttttttttt")
        //            //print("send message2")
        //            // self.socket.emit("access", name)
        //        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action

    
    @IBAction func attack(_ sender: UIButton) {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        socket = appDelegate.socket
        
        socket.emit("in_socket1")
        socket.on("in_ok1") { data, ack in
            print("outtttttttttt")
            //print("send message2")
            // self.socket.emit("access", name)
        }
        print("attacked")
        
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
