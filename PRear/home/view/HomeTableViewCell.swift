//
//  HomeTableViewCell.swift
//  PRear
//
//  Created by Stan on 2022/11/2.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style:style, reuseIdentifier: reuseIdentifier)
       self.backgroundColor = UIColor.gray
       contentView.addSubview(btn)
        self.addSubview(lab)
       self.selectionStyle = .none
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
        lab.text = "click btn"
    }
}
