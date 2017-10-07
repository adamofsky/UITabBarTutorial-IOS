//
//  CustomTabBatVC.swift
//  uitabbartutorial
//
//  Created by Alexey Adamovsky on 05/10/2017.
//  Copyright © 2017 Alexey Adamovsky. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    static var shared:CustomTabBarController?
    
    private var _customTabBar:CustomTabBar!
    var customTabBar:CustomTabBar{
        get{
            return _customTabBar
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //store shared property once while created CustomTabBarController
        if CustomTabBarController.shared == nil{
            CustomTabBarController.shared = self
        }
        
        //hide ios tabbar view
        self.tabBar.isHidden = true
        
        initViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - INITIALIZERS -
    private func initViews(){
        //init our custom view
        _customTabBar = CustomTabBar.getFromNib()
        
        //adding our custom tab bar to controller
        self.view.addSubview(customTabBar)
        
        //setting constrains to custom tab bar and actions of buttons
        setupTabBar()
    }
    private func setupTabBar(){
        _customTabBar.setActionHomeTapped {
            self.selectedIndex = 0
        }
        _customTabBar.setActionCartTapped {
            self.selectedIndex = 1
        }
        _customTabBar.setActionGraphTapped {
            self.selectedIndex = 2
        }
        _customTabBar.setActionSettingsTapped {
            self.selectedIndex = 3
        }
        setupTabBarAutoLayout()
    }
    private func setupTabBarAutoLayout() {
        _customTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        _customTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        _customTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        _customTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}
