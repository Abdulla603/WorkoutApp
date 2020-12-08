//
//  TabBarController.swift
//  iOSFinalProject
//
//  Created by Justin on 2020/12/8.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad(){
        super.viewDidLoad()
        delegate = self
    }
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let item3 = WorkoutViewController()
            let icon3 = UITabBarItem(title: "Title", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
            item3.tabBarItem = icon3
            let controllers = [item3]  //array of the root view controllers displayed by the tab bar interface
            self.viewControllers = controllers
    }

        //Delegate methods
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            print("Should select viewController: \(viewController.title ?? "") ?")
            return true;
        }
}
