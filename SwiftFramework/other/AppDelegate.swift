//
//  AppDelegate.swift
//  PRear
//
//  Created by Stan on 2021/3/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    func getOrinigImage(img:UIImage?) -> UIImage {
        let tmp = img?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        return tmp!
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let home    = HomeController()
        let draft   = DraftController()
        let center  = CenterController()
        let message = MessageController()
        let mine    = MineController()
        
        
        
        home.tabBarItem = UITabBarItem.init(title: "首页", image: self.getOrinigImage(img: UIImage.init(named: "icon_tabbar_first_normal")), selectedImage:self.getOrinigImage(img: UIImage.init(named: "icon_tabbar_first_Selected")))
        home.tabBarItem.title = "首页"

        draft.tabBarItem = UITabBarItem.init(title: "稿件", image: self.getOrinigImage(img: UIImage.init(named: "icon_tabbar_four_normal")), selectedImage: self.getOrinigImage(img: UIImage.init(named: "icon_tabbar_second_selected")))
        
        center.tabBarItem = UITabBarItem.init(title: "", image: self.getOrinigImage(img: UIImage.init(named: "icon_tab_Mid")), selectedImage:self.getOrinigImage(img: UIImage.init(named: "icon_tab_Mid")))
        message.tabBarItem = UITabBarItem.init(title: "消息", image:self.getOrinigImage(img:  UIImage.init(named: "icon_tabbar_first_normal")), selectedImage:self.getOrinigImage(img: UIImage.init(named: "icon_tabbar_first_Selected")))
        mine.tabBarItem = UITabBarItem.init(title: "我的", image: self.getOrinigImage(img: UIImage.init(named: "icon_tabbar_five_normal")), selectedImage:self.getOrinigImage(img: UIImage.init(named: "icon_tabbar_five_selected")))
        
        let vcs = [home,draft,center,message,mine]
        
        
        
        
        let tab = UITabBarController.init()
            tab.viewControllers = vcs
        
        
        let backGround = UIView.init(frame: tab.tabBar.bounds)
        backGround.backgroundColor = UIColor.white
        UITabBar.appearance().insertSubview(backGround, at: 0)
        
        let item = UITabBarItem.appearance()
        
        let normalColor = UIColor.init(red: 105/255.0, green: 112/255.0, blue: 124/255.0, alpha: 1)
        let selectedColor = UIColor.init(red: 167/255.0, green: 172/255.0, blue: 180/255.0, alpha: 1)
        
        
        let normal = [NSAttributedString.Key.foregroundColor: normalColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)]
        
        let selected = [NSAttributedString.Key.foregroundColor: selectedColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)]
        
        
        
        //设置item的字体和颜色
        tab.tabBar.barTintColor = UIColor.white//这个方法 才可以走设置normal字体颜色
        item.setTitleTextAttributes(normal,  for: UIControl.State.selected)
        item.setTitleTextAttributes(selected, for: UIControl.State.normal)
        
        
        tab.tabBar.backgroundImage = UIImage()
        
        
        
        let nav = UINavigationController.init(rootViewController: tab)
        
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    
        
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

