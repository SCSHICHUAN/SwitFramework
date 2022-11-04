//
//  HomeTableViewCell.swift
//  PRear
//
//  Created by Stan on 2022/11/2.
//

import UIKit

protocol HomeTableDelegate:AnyObject {
    func whebuttonClick(_:String) ->String
}


class HomeTableViewCell: UITableViewCell {
    
    
    //swift 中的协议如果要使用，比如weak，协议一定要继续包含OC的部分
    weak var delegate:HomeTableDelegate?
    //声明一个闭包 （参数列表）->返回值 in 函数体
    var block:((_:String)->String)?
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style:style, reuseIdentifier: reuseIdentifier)
        self.addSubview(lab)
        self.selectionStyle = .none
        blockInit()
    }
    
    
    
    
    
    func blockInit(){
        //和OC的一样了，把数据传会来
        self.block = {(str:String)->String in
            TipsView.PopStr(str: str);
            return str
        }
    }
    
    func setLab(str:String){
        lab.text = str
        
        switch str {
        case "block 数据回传":
            break
        case "swift delegate":
            contentView.addSubview(btn)
        default:
            break
        }
        
    }
    
    
    
    
    
    
    
    
    lazy var btn: UIButton = {
        let b = UIButton.init(type: .custom)
        b.frame = CGRect(x: k_screen_w - 110, y: 10, width: 100, height: 30)
        b.setImage(UIImage(named: "GaoJianPush-icon_corlum"), for: .normal)
        b.addTarget(self, action:#selector(btnClick), for:.touchUpInside)
        return b
    }()
   
    lazy var lab: UILabel = {
        let tmp = UILabel.init(frame: CGRect(x: 20, y: 10, width: k_screen_w - 20, height: 30))
        return tmp
    }()
    
}

extension HomeTableViewCell{
    
    @objc func btnClick(){
       let str =  delegate?.whebuttonClick("hello")
        TipsView.PopStr(str: str!)
    }
}
