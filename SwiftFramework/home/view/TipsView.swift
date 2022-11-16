//
//  TipsView.swift
//  PRear
//
//  Created by Stan on 2022/11/3.
//

import UIKit

class TipsView: UIView {

    class func PopStr(str:String){
        let alertVC = UIAlertController(title: str, message: "", preferredStyle: .alert);
        let action = UIAlertAction(title: "关闭", style: .cancel, handler: nil)
        alertVC.addAction(action)
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
        vc!.present(alertVC, animated: true)
    }
    
   

}
