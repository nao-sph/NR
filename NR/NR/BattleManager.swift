//
//  BattleManager.swift
//  NR
//
//  Created by Riku Uchida on 2017/08/19.
//  Copyright © 2017年 NoR. All rights reserved.
//

import Foundation

class BattleManager {
    var me: Character = Character0()
    var you: Character = Character0()
    func setCharacter(myCharaNum: Int, yourCharaNum: Int) {
        switch myCharaNum {
        case 0: //
            me = Character0()
            break
        default:
            break
        }
        switch yourCharaNum {
        case 0:
            you = Character0()
            break
        default:
            break
        }
    }
    func turn(myCmd: Int,yourCmd: Int, alpha: Float)  {
        var myHP: Float
        var yourHP: Float
        switch getResult(myCmd: myCmd, yourCmd: yourCmd) {
        case 0: //draw
            myHP = self.me.Damaged(damage: self.you.Command(cmd: yourCmd), alpha: alpha)
            yourHP = self.you.Damaged(damage: self.me.Command(cmd: myCmd), alpha: alpha)
            goResult(myHP: myHP, yourHP: yourHP)
            break
        case 1: //win
            if(myCmd == 3) {
                yourHP = self.you.Damaged(damage: self.you.Command(cmd: yourCmd), alpha: alpha) //魔法反射
            } else {
                yourHP = self.you.Damaged(damage: self.me.Command(cmd: myCmd), alpha: alpha)
                self.you.Command(cmd: yourCmd) //ダメージはないけどコマンドは動く
            }
            goResult(myHP: 1, yourHP: yourHP) // myHPは取得してないから仮に1(>0)
            break
        case 2: //lose
            if(yourCmd == 3) {
                myHP = self.me.Damaged(damage: self.me.Command(cmd: myCmd), alpha: alpha) //魔法反射
            } else {
                myHP = self.me.Damaged(damage: self.you.Command(cmd: yourCmd), alpha: alpha)
                self.me.Command(cmd: myCmd) //ダメージはないけどコマンドは動く
            }
            goResult(myHP: myHP, yourHP: 1) // yourHPは取得してないから仮に1(>0)
            break
        default:
            break
        }
    }
    
    func getResult (myCmd: Int, yourCmd: Int) -> Int { //draw:0, win:1, lose:2
        if((myCmd == 0 || myCmd == 4) && (yourCmd == 0 || yourCmd == 4)) { //cmd 0:none, 1:atk, 2: magi: 3:brr, 4:chg
            return 0
        }
        if(myCmd == 0 || myCmd == 4) {
            return 2
        }
        if(yourCmd == 0 || yourCmd == 4) {
            return 1
        }
        return (myCmd - yourCmd + 3) % 3
    }
    
    func goResult (myHP: Float, yourHP: Float) {
        if(myHP <= 0 && yourHP <= 0) {
            
        }
        if(myHP <= 0) {
            
        }
        if(yourHP <= 0) {
            
        }
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

class Character0 :Character {
    
}

