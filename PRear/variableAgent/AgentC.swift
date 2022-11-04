//
//  AgentC.swift
//  PRear
//
//  Created by Stan on 2022/11/4.
//

import UIKit

class AgentC: UILabel,SendMessagesDeletate{

    let pro = SendMessagePro.shard

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        self.textColor = UIColor.white
        self.text = "C"
        pro.manger.add(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func seendMessage(str:String){
        self.text = str + "C"
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.removeFromSuperview()
        }
    }

}
