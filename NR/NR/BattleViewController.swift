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
    
    //HP,MPの処理
    
    @IBOutlet weak var HP1: UIProgressView!
    @IBOutlet weak var HP2: UIProgressView!
    @IBOutlet weak var MP1: UIProgressView!
    @IBOutlet weak var MP2: UIProgressView!
    
    @IBAction func Damage(decrease: Float){
        HP1.setProgress(HP1.progress - decrease, animated: true)
    }
    @IBAction func cure(increase: Float){
        HP2.setProgress(HP2.progress + increase, animated: true)
    }
    @IBAction func MPdamage(decrease: Float){
        MP2.setProgress(MP2.progress - decrease, animated: true)
    }
    @IBAction func cureForLocal(increase: Float){
        HP1.setProgress(HP1.progress + increase, animated: true)
    }
    @IBAction func MPdamageForLocal(decrease: Float){
        MP1.setProgress(MP1.progress - decrease, animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //        socket.emit("in_socket","hoge")
        //        socket.on("in_ok") { data, ack in
        //            print("outtttttttttt")
        //            //print("send message2")
        //            // self.socket.emit("access", name)
        //        }
        
        
        //socket受信した時の処理
        socket.on("to_room_without_self") { data, ack in
            
//            let _data: NSDictionary = data[0] as! NSDictionary
//            var str : NSString = _data[@"Key1"]
            let Cmd: Int = data[0] as! Int
            
            
//            let Num: Data = items.data(using: String.Encoding.utf8)!
            
//            do {
//                let json = try JSONSerialization.jsonObject(with: items, options: JSONSerialization.ReadingOptions.allowFragments) // JSONパース。optionsは型推論可(".allowFragmets"等)
//                let top = json as! NSArray // トップレベルが配列
//                for roop in top {
//                    let next = roop as! NSDictionary
//                    //print(next["id"] as! String) // 1, 2 が表示
//
//                    let content = next["content"] as! NSDictionary
//                    print(content["data"] as! Int) // 25, 20 が表示
//                }
//            } catch {
//                print(error) // パースに失敗したときにエラーを表示
//            }
            
//            if let Cmd = data as? [[String: AnyObject]]{
//                if let txt = Cmd[0] as? String {
//                    print(txt)
//                    print("test")
//                }
//            }
            
            switch Cmd {
            case 1:
                print("attackkkkkkkkkkkkkkkkkkkkk")
                self.Damage(decrease: 0.25)
                break
            case 2:
                print("magiiiiiiiicccccccccccccccc")
                self.Damage(decrease: 0.35)
                self.MPdamage(decrease: 0.2)
                break
            case 3:
                print("barrrrrrrrrrrrrrrrrrrrierrrr")
//                self.Damage(decrease: 0.1)
                 self.Damage(decrease: -1)
                break
            case 4:
                print("chaaaaaaaaaarrrrrrrgeeeeeeee")
                self.MPdamage(decrease: -0.25)
                self.cure(increase: 0.2)
                break
            default:
                print("nothinggggggggggggggggggggg")
            }
            self.buttonEnable()
            
        }
//        socket.on("to_self") { data, ack in
//            print("magiccccccccccccccccccc")
//            self.buttonEnable()
//        }
        
        //体力バー
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var magicButton: UIButton!
    @IBOutlet weak var barrierButton: UIButton!
    @IBOutlet weak var chargeButton: UIButton!
    @IBOutlet weak var EnemyAttackButton: UIButton!
    @IBOutlet weak var EnemyMagicButton: UIButton!
    @IBOutlet weak var EnemyBarrierButton: UIButton!
    @IBOutlet weak var EnemyChargeButton: UIButton!
    
    
    //MARK: Action
    
    
    func buttonDisable(){
        attackButton.isEnabled = false
        magicButton.isEnabled = false
        barrierButton.isEnabled = false
        chargeButton.isEnabled = false
    }
    func buttonEnable() {
        attackButton.isEnabled = true
        magicButton.isEnabled = true
        barrierButton.isEnabled = true
        chargeButton.isEnabled = true
    }
    func buttonBasics(BUTTON: UIButton){
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        socket = appDelegate.socket
        //buttons Disable until enemy selects cmd
        buttonDisable()
        BUTTON.showsTouchWhenHighlighted = true
    }
    // "@{@\"Key1\": @\"Value1\", @\"Key2\": @\"2\", @\"Key3\": @{@\"valueinkey1\": @\"value\", @\"valueinkey2\": @\"3\"}};"

    
    @IBAction func attack(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        socket.emit("req_to_room_without_self",1)
        
    }
    @IBAction func magic(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        socket.emit("req_to_room_without_self",2)
        
    }
    @IBAction func barrier(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        socket.emit("req_to_room_without_self",3)
    }
    
    @IBAction func charge(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        socket.emit("req_to_room_without_self",4)
        self.MPdamageForLocal(decrease: -0.25)
        self.cureForLocal(increase: 0.2)
        
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
