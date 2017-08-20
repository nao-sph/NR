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
    let syohiMP: Float = 0.2
    @IBOutlet weak var HP1: UIProgressView!
    @IBOutlet weak var HP2: UIProgressView!
    @IBOutlet weak var MP1: UIProgressView!
    @IBOutlet weak var MP2: UIProgressView!
    
    @IBAction func Damage(decrease: Float){
        HP1.setProgress(HP1.progress - decrease, animated: true)
    }
    @IBAction func Damage2p(decrease: Float){
        HP2.setProgress(HP2.progress - decrease, animated: true)
    }
    @IBAction func MPdamage2p(decrease: Float){
        MP2.setProgress(MP2.progress - decrease, animated: true)
    }
    @IBAction func MPdamage(decrease: Float){
        MP1.setProgress(MP1.progress - decrease, animated: true)
    }
    
    //8個のメソッド
    var Seikou = true
    @IBAction func A1(Seikou: Bool){
        if(Seikou){
            Damage2p(decrease: 0.25)
        }
    }
    @IBAction func A2(Seikou: Bool){
        if(Seikou){
            Damage(decrease: 0.25)
        }
    }
    @IBAction func M1(Seikou: Bool){
        if(Seikou){
            MPdamage(decrease: 0.35)
            Damage2p(decrease: 0.35)
        }else{
            MPdamage(decrease: 0.35)
            Damage(decrease: 0.35)
        }
    }
    @IBAction func M2(Seikou: Bool){
        if(Seikou){
            MPdamage2p(decrease: 0.35)
            Damage(decrease: 0.35)
        }else{
            MPdamage2p(decrease: 0.35)
            Damage2p(decrease: 0.35)
        }
    }
    @IBAction func C1(Seikou: Bool){
        Damage(decrease: -0.2)
        MPdamage(decrease: -0.25)
    }
    @IBAction func C2(Seikou: Bool){
        Damage2p(decrease: -0.2)
        MPdamage2p(decrease: -0.25)
    }
     func MyAction(Num: Int, OK: Bool ){
        switch Num {
        case 1:
            A1(Seikou: OK)
            break
        case 2:
            M1(Seikou: OK)
            break
        case 4:
            C1(Seikou: OK)
            break
        default: break
        }
    }
    func YourAction(Num: Int, OK: Bool ){
        switch Num {
        case 1:
            A2(Seikou: OK)
            break
        case 2:
            M2(Seikou: OK)
            break
        case 4:
            C2(Seikou: OK)
            break
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var yourCmd: Int = 0
        
        socket.on("turn_start"){data, ack in
            //startしてからの処理
            print(data[0],"turn目、startしました")
            
            self.socket.on("to_room_without_self") { data, ack in
                
                yourCmd = data[0] as! Int
                
            }
            
            //ここまでがstartしてすぐに行う処理
            
            //10秒後に行う処理
            DispatchQueue.main.asyncAfter(deadline: .now() + 7){
                
                print("7秒経ちました")
                self.buttonEnable()
                
                let a = BattleManager().getResult(myCmd: self.myCmd,yourCmd: yourCmd)
                print("aite" , yourCmd)
                print("jibun", self.myCmd)
                print("kekka",a)
                
                //新しい処理
                if(a == 0){
                    self.MyAction(Num: self.myCmd, OK: true)
                    self.YourAction(Num: yourCmd, OK: true)
                }else if(a == 1){
                    self.MyAction(Num: self.myCmd, OK: true)
                    self.YourAction(Num: yourCmd, OK: false)
                }else if(a == 2){
                    self.MyAction(Num: self.myCmd, OK: false)
                    self.YourAction(Num: yourCmd, OK: true)
                }
                
                //古い処理
                
                //                if(a == 0 || a == 2){
                //                    switch yourCmd {
                //                    case 1:
                //                        print("attackされました")
                //                        self.Damage(decrease: 0.25)
                //                        break
                //                    case 2:
                //                        print("magic受けました")
                //                        self.Damage(decrease: 0.35)
                //                        self.MPdamage(decrease: 0.2)
                //                        break
                //                    case 3:
                //                        print("barrierくらいました")
                //                        //                self.Damage(decrease: 0.1)
                //                        self.Damage(decrease: -1)
                //                        break
                //                    case 4:
                //                        print("相手がchargeしました")
                //                        self.MPdamage(decrease: -0.25)
                //                        self.cure(increase: 0.2)
                //                        break
                //                    default:
                //                        print("相手は何もしませんでした")
                //                    }
                //                    self.buttonEnable()
                //
                //                }
                //                    switch self.myCmd {
                //                    case 1:
                //                        print("attackしました")
                //                        self.Damage2p(decrease: 0.25)
                //                        break
                //                    case 2:
                //                        print("magicしました")
                //                        self.Damage2p(decrease: 0.35)
                //                        self.MPdamageForLocal(decrease: self.syohiMP)
                //                        break
                //                    case 3:
                //                        print("barrierしました")
                //                        //                self.Damage(decrease: 0.1)
                //                       self.cure(increase: 1)
                //                        break
                //                    case 4:
                //                        print("自分はchargeしました")
                //                        self.MPdamageForLocal(decrease: -0.25)
                //                        self.Damage(decrease: -0.2)
                //                        break
                //                    default:
                //                        print("自分は何もしませんでした")
                //                    }
                //                    self.buttonEnable()
                //
                //
                //                self.buttonEnable()
                //
                //
            }
        }
        
        //socket受信した時の処理
        
        
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
    
    var myCmd = 0;
    
    
    @IBAction func attack(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        socket.emit("req_to_room_without_self",1)
        myCmd = 1
        
    }
    @IBAction func magic(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        if(HP1.progress > syohiMP){
            socket.emit("req_to_room_without_self",2)
            myCmd = 2
        }
    }
    @IBAction func barrier(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        socket.emit("req_to_room_without_self",3)
        myCmd = 3
    }
    
    @IBAction func charge(_ sender: UIButton) {
        buttonBasics(BUTTON: sender)
        socket.emit("req_to_room_without_self",4)
        myCmd = 4
        
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
