//
//  SendMessagesPro.swift
//  PRear
//
//  Created by Stan on 2022/11/4.
//

import Foundation

@objc protocol SendMessagesDeletate{
    func seendMessage(str:String)
}

class SendMessagePro{
    
             let manger = SCManger()
    static   let shard = SendMessagePro()
    
   
    func action(){//多代理调用方法
        manger.delegates.allObjects.forEach {
            $0.seendMessage(str:"socket 发来信息") }
    }
    
}
