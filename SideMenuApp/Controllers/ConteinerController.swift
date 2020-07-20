//
//  ConteinerController.swift
//  SideMenuApp
//
//  Created by Александр Умаров on 14.07.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class ConteinerController: UIViewController {
    // MARK: - Properties
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        centerController = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            // анимация открытия меню
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            //анимация закрытия меню
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
        
    }
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .profile:
            print("Show profile")
        case .inbox:
            print("Show inbox")
        case .notification:
            print("Show notification")
        case .settings:
            print("Show settings")
        }
    }
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ConteinerController: HomeControllerDelegate {
    func handleMenuToogle(forMenuOption menuOption: MenuOption?) {
        // делаем через if, чтобы настройки найстройка не вызывалась заново, при каждом открытии богового меню
        if !isExpanded {
            configureMenuController()
        }
        // тумблер для открытия и закрытия меню
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
}
