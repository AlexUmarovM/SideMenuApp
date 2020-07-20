//
//  MenuController.swift
//  SideMenuApp
//
//  Created by Александр Умаров on 14.07.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit
private let reuseIndentifire = "MenuOptionCell"

class MenuController: UIViewController {
    // MARK: - Properties
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    // MARK: - Handlers
    func configureTableView() {
        tableView = UITableView()
        
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        tableView.delegate = self
        tableView.dataSource = self
       
        // Регистация ячейки
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIndentifire)
        view.addSubview(tableView)
        
        // установка констрейнтов
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
    
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifire, for: indexPath) as! MenuOptionCell
        
        // наполнение ячеек
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToogle(forMenuOption: menuOption)
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
    
}
