//
//  NetWork.swift
//  PRear
//
//  Created by Stan on 2022/11/4.
//

import UIKit


class NetWork: NSObject {
    
    typealias BlockType = ((_:String)->String)?
    
    //网络请求中闭包的使用，赋值在被调用的地方，
    func blockFunc(a:BlockType,b:BlockType){
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            _ = a!("Network request succeeded ！")
            _ = b!("Network request failed ！")
        })
    }

}
