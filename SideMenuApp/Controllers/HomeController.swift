//
//  HomeController.swift
//  SideMenuApp
//
//  Created by Александр Умаров on 14.07.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    // MARK: - Handlers
    @objc func handleMenuToogle() {
        delegate?.handleMenuToogle(forMenuOption: nil)
    }
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
       
        let navBarAppaerace = UINavigationBarAppearance()
        navBarAppaerace.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Side Menu"
        navBarAppaerace.backgroundColor = .darkGray
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "file-sketch-with-text-lines").withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(handleMenuToogle))
        
        // применяем все настройки
        navigationController?.navigationBar.standardAppearance = navBarAppaerace
    }
}
