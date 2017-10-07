//
//  CustomTabBar.swift
//  uitabbartutorial
//
//  Created by Alexey Adamovsky on 05/10/2017.
//  Copyright © 2017 Alexey Adamovsky. All rights reserved.
//

import UIKit

class CustomTabBar: UIView {
    
    private var actionHomeTapped:()->() = {}
    private var actionCartTapped:()->() = {}
    private var actionGraphTapped:()->() = {}
    private var actionSettingsTapped:()->() = {}
    
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var btnGraph: UIButton!
    @IBOutlet weak var btnSettings: UIButton!

    @IBOutlet weak var lblBadgeCount: UILabel!
    @IBOutlet weak var badgeView: UIView!
    
    static func getFromNib()->CustomTabBar{
        let tabBarView = UINib.init(nibName: "CustomTabBar", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomTabBar

        return tabBarView
    }
    
    override func layoutSubviews() {
        self.btnHome.roundCorners(corners: [.topLeft], size: 35)
        self.btnSettings.roundCorners(corners: [.topRight], size: 35)
    }
    
    //MARK: - BUTTON ACTIONS -
    @IBAction func btnHomeTapped(_ sender: UIButton) {
        //change images to unselected to all buttons
        setAllButtonsUnselected()
        //set image selected
        btnHome.setImage(UIImage.init(named: "home-selected"), for: .normal)
        actionHomeTapped()
    }
    
    @IBAction func btnCartTapped(_ sender: UIButton) {
        setAllButtonsUnselected()
        btnCart.setImage(UIImage.init(named: "cart-selected"), for: .normal)
        actionCartTapped()
    }
    
    @IBAction func btnGraphTapped(_ sender: UIButton) {
        setAllButtonsUnselected()
        btnGraph.setImage(UIImage.init(named: "graph-selected"), for: .normal)
        actionGraphTapped()
    }
    
    @IBAction func btnSettingsTapped(_ sender: UIButton) {
        setAllButtonsUnselected()
        btnSettings.setImage(UIImage.init(named: "tools-selected"), for: .normal)
        actionSettingsTapped()
    }
    
    
    //MARK: - VIEW SETTERS -
    func setActionHomeTapped(action:@escaping ()->()){
        actionHomeTapped = action
    }
    func setActionCartTapped(action:@escaping ()->()){
        actionCartTapped = action
    }
    func setActionGraphTapped(action:@escaping ()->()){
        actionGraphTapped = action
    }
    func setActionSettingsTapped(action:@escaping ()->()){
        actionSettingsTapped = action
    }
    func setBadgeNum(num:Int){
        
        if num > 0{//set number before badge appeared
            self.lblBadgeCount.text = "\(num)"
        }
        //hide badge view if badge is 0
        UIView.animate(withDuration: 0.3, animations: {
            if num == 0{
                self.badgeView.alpha = 0
            }
            else{
                self.badgeView.alpha = 1
            }
        }) { (true) in
            //set number after badge disappeared
            //importand when badge is 0
            self.lblBadgeCount.text = "\(num)"
        }
    }
    //MARK: - VIEW GETTERS -
    func getBadgeNum()->Int{
         return Int("\(lblBadgeCount.text!)")!
    }
    //MARK: - VIEW FUNCTIONS -
    func setAllButtonsUnselected(){
        btnHome.setImage(UIImage.init(named: "home"), for: .normal)
        btnCart.setImage(UIImage.init(named: "cart"), for: .normal)
        btnGraph.setImage(UIImage.init(named: "graph"), for: .normal)
        btnSettings.setImage(UIImage.init(named: "tools"), for: .normal)
    }
    
    
    
    
    
}
