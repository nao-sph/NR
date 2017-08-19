//
//  BattleManager.swift
//  NR
//
//  Created by Riku Uchida on 2017/08/19.
//  Copyright © 2017年 NoR. All rights reserved.
//

import Foundation

class BattleManager {
    func turn(myCmd: Int,yourCmd: Int, alpha: Float)  {
        }
    
    
}

class Character {
    var name = "default"
    var HP: Float = 100
    var MP: Float = 100
    var aRate: Float = 25
    var mRate: Float = 35
    var bRate: Float = 10
    var latestCmd: Int? = nil
    
    func Command(cmd: Int) -> Float {
        //何もしない：０、攻撃：１、魔法：２、バリア：３、チャージ：４
        switch cmd {
        case 1:
            return aRate
        case 2:
            self.MP = self.MP - 35
            return mRate
        case 3:
            return bRate
        case 4:
            self.HP = self.HP + 15
            self.MP = self.MP + 25
            return 0
        default:
            return 0
        }
    }
    
    func Damaged(damage: Float, alpha: Float) -> Float {
        self.HP = self.HP - damage*alpha
        return self.HP
    }
}
