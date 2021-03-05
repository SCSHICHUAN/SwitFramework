//
//  SCTabBarItem.swift
//  PRear
//
//  Created by Stan on 2021/3/5.
//

import UIKit

class SCTabBarItem: UITabBarItem {
   
    public  init(title: String?, image: UIImage?, selectedImage: UIImage?)
    {
        super.init()
        
        let v = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44))
        v.backgroundColor = UIColor.white
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
