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
    typealias BlockType = ((_:String)->String)?
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style:style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.gray
        contentView.addSubview(btn)
        self.addSubview(lab)
        self.selectionStyle = .none
       
        //和OC的一样了，把数据传会来
        self.block = {(str:String)->String in
            let tmpStr = str + " block back"
            print(tmpStr)
            return tmpStr
        }
    }
    
    
    //网络请求中闭包的使用，赋值在被调用的地方，
    func blockFunc(a:BlockType,b:BlockType){
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            _ = a!("Network request succeeded ！")
            _ = b!("Network request failed ！")
        })
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn: UIButton = {
        let b = UIButton.init(type: .system)
        b.frame = CGRect(x: 0, y: 5, width: 100, height: 40)
        b.backgroundColor = UIColor.red
        b.addTarget(self, action:#selector(btnClick), for:.touchUpInside)
        return b
    }()
   
    
    lazy var lab: UILabel = {
        let tmp = UILabel.init(frame: CGRect(x: 200, y: 5, width: 100, height: 40))
        tmp.backgroundColor = UIColor.yellow
        return tmp
    }()
    
    func setLab(str:String){
        lab.text = str
    }
    
}

extension HomeTableViewCell{
    
    @objc func btnClick(){
       let str =  delegate?.whebuttonClick("hello")
        print("delegate"+str!)
    }
}
