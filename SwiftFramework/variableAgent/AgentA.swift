//
//  AgentA.swift
//  PRear
//
//  Created by Stan on 2022/11/4.
//

import UIKit

class AgentA: UILabel,SendMessagesDeletate {//遵守协议

    let pro = SendMessagePro.shard

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        self.textColor = UIColor.white
        self.text = "A"
        pro.manger.add(delegate: self)//挂代理
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func seendMessage(str:String){
        self.text = str + "A"
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.removeFromSuperview()
        }
        
    }

}
