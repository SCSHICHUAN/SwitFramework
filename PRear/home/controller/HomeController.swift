//
//  HomeController.swift
//  PRear
//
//  Created by Stan on 2021/3/5.
//

import UIKit

class HomeController: UIViewController {
   
    var cell:HomeTableViewCell?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        view.addSubview(tab!)
    }

    
    lazy var tab:UITableView? = {
       let tab =  UITableView(frame: view.bounds, style: .plain)
        tab.delegate = self
        tab.dataSource = self
        tab.rowHeight = 50.0
        return tab
    }()

    
    
}

extension HomeController:UITableViewDelegate,UITableViewDataSource{
    
   
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell.init(style: .default, reuseIdentifier: "HomeTableViewCell")
        cell.setLab(str: String.init(indexPath.row))
        cell.delegate = self
        self.cell = cell
        return cell
    }
    
    
}

extension HomeController:HomeTableDelegate{
    
    func whebuttonClick(_ str:String) ->String{
        self.navigationController?.pushViewController(FirstVC(), animated: true)
        cell?.blockFunc(a: { stra in
            print(stra)
            return "a"
        }, b: { strb in
            print(strb)
            return "b"
        })
        return cell!.block!(str)
    }
}
