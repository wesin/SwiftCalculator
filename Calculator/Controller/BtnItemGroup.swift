//
//  BtnItemGroup.swift
//  Calculator
//
//  Created by 何文新 on 15/2/2.
//  Copyright (c) 2015年 何文新. All rights reserved.
//

import UIKit

class BtnItemGroup: UIControl {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    //
    private var btnWidth:CGFloat = 40
    private var btnHeight:CGFloat = 40
    private var itemWidth:CGFloat = 50
    private var itemHeight:CGFloat = 50
    
    
    var horizontalNum:Int = 4
    var verticalNum:Int = 4
    var margin:Int = 2
    var arrayTxtShow = Array<Array<String>>()
    var arrayTag = Array<Array<Int>>()
    var currentClickBtn:UIButton?
    var arrayUIButton = Dictionary<Int,UIButton>()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initBtnItems() -> Void{
        itemWidth = frame.width / CGFloat(horizontalNum)
        itemHeight = frame.height / CGFloat(verticalNum)
        btnWidth = itemWidth - CGFloat(2*margin)
        btnHeight = itemHeight - CGFloat(2*margin)
        for indexHori in 0...horizontalNum - 1{
            let x = CGFloat(indexHori) * itemWidth + CGFloat(margin)
            for indexVert in 0...verticalNum - 1{
                let y = CGFloat(indexVert) * itemHeight + CGFloat(margin)
                let index = indexVert * horizontalNum + indexHori
                let rect = CGRect(x: x, y: y, width: btnWidth, height: btnHeight)
                if(arrayUIButton[index] != nil)
                {
                   let btnItem = arrayUIButton[index]
                    btnItem?.frame = rect
                    continue
                    
                }
                
                let btnItem = UIButton(frame: rect)
                btnItem.backgroundColor = UIColor.whiteColor()
                btnItem.setTitle(arrayTxtShow[indexVert][indexHori], forState: UIControlState.Normal)
                btnItem.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(btnHeight/2))
                btnItem.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btnItem.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
                btnItem.tag = arrayTag[indexVert][indexHori]
                btnItem.addTarget(self, action: "btnItemClick:", forControlEvents:UIControlEvents.TouchUpInside)
                self.addSubview(btnItem)
                arrayUIButton[index] = btnItem
            }
        }
    }
    
    func btnItemClick(sender:UIButton){
        currentClickBtn = sender
        sendActionsForControlEvents(UIControlEvents.TouchUpInside)
    }
}
