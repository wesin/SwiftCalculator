//
//  ViewController.swift
//  Calculator
//
//  Created by 何文新 on 15/2/1.
//  Copyright (c) 2015年 何文新. All rights reserved.
//

import UIKit

enum BtnTitleTxt:Int {
    case Minus = 11,
    Plus,
    Multiply,
    Divide,
    Equal
}

class ViewController: UIViewController {
    
    let btnItemGroup = BtnItemGroup(frame:CGRectZero)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnItemGroup.backgroundColor = UIColor.redColor()
        btnItemGroup.horizontalNum = 4
        btnItemGroup.verticalNum = 4
        btnItemGroup.arrayTxtShow = [["7","8","9","-"],["4","5","6","+"],["1","2","3","*"],[".","0","=","/"]]
        btnItemGroup.arrayTag = [[7,8,9,11],[4,5,6,12],[1,2,3,13],[10,0,15,14]]
        
        view.addSubview(btnItemGroup)
    }
    
    override func viewDidLayoutSubviews() {
        let margin:CGFloat = 20.0
        btnItemGroup.frame = CGRect(x: margin, y: 180, width: view.bounds.width-2*margin, height: view.bounds.width-2*margin)
        btnItemGroup.initBtnItems()
        btnItemGroup.addTarget(self, action: "calBtnItemClick:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    @IBOutlet weak var resultTxt: UILabel!
    
    var currentBtnFunction:BtnTitleTxt?
    var firstNum:Double = 0
    var nowBtn:BtnTitleTxt?
    var boolPreMark:Bool = false
    
    @IBAction func calBtnItemClick(btnItemGroup: BtnItemGroup) {
        let currentClickBtn = btnItemGroup.currentClickBtn!
        nowBtn = BtnTitleTxt(rawValue: currentClickBtn.tag)
        if (nowBtn != nil) {
            switch nowBtn! {
            case .Equal:
                resultTxt.text = Calculate()
            default:
                firstNum = (resultTxt.text! as NSString).doubleValue
                currentBtnFunction = nowBtn
            }
            boolPreMark = true
        }else{
            if(boolPreMark){
                resultTxt.text = "0"
            }
            resultTxt.text = resultTxt.text == "0" ? currentClickBtn.currentTitle :
                resultTxt.text!.stringByAppendingString(currentClickBtn.currentTitle!)
            boolPreMark = false
        }
        
        
    }
    
    func Calculate() -> String{
        let secondNum:Double = (resultTxt.text! as NSString).doubleValue
        if(currentBtnFunction == nil){
            return ""
        }
        switch currentBtnFunction! {
        case .Minus:
            return "\(firstNum - secondNum)"
        case .Plus:
            return "\(firstNum + secondNum)"
        case .Multiply:
            return "\(firstNum * secondNum)"
        case .Divide:
            return "\(firstNum / secondNum)"
        default:
            return "0"
        }
    }
}

