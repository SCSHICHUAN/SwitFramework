//
//  HomeController.swift
//  PRear
//
//  Created by Stan on 2021/3/5.
//

import UIKit

class HomeController: UIViewController {
   
    var cell:HomeTableViewCell?
    var mainMenu = ["block 网络请求方法外传数据",
                    "block 数据回传数据",
                    "swift delegate",
                    "多代理分发消息",
                    "声网直播"]
    
    
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

    func mutDeletateTest(){
        view.addSubview(AgentA(frame: CGRect(x: 100, y: 200, width: 200, height: 60)))
        view.addSubview(AgentB(frame: CGRect(x: 100, y: 300, width: 200, height: 60)))
        view.addSubview(AgentC(frame: CGRect(x: 100, y: 400, width: 200, height: 60)))
    }
    
}

extension HomeController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell.init(style: .default, reuseIdentifier: "HomeTableViewCell")
        cell.tag = indexPath.row
        cell.setLab(str: mainMenu[indexPath.row])
        cell.delegate = self
        self.cell = cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:///模拟网络请求
            let a = NSMutableArray()    
            _ = a[0]
            NetWork().blockFunc(a: { stra in
                TipsView.PopStr(str: stra)
                return "a"
            }, b: { strb in
                print(strb)
                return "b"
            })
        case 1:///数据回传
            _ = cell!.block!("block 数据回传")
        case 3:///多代理分发消息
            mutDeletateTest()
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                SendMessagePro.shard.action()
            }
        case 4://声望直播
            self.navigationController?.pushViewController(LiveInit(), animated: true)
            
        default:
//            self.navigationController?.pushViewController(FirstVC(), animated: true)
            return
        }
        
    }
    
   
    
    
   
    
}






///HomeTableDelegate
extension HomeController:HomeTableDelegate{
    
    func whebuttonClick(_ str:String) ->String{
        return str
    }
}
