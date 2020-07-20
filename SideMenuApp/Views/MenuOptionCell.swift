//
//  MenuOptionCell.swift
//  SideMenuApp
//
//  Created by Александр Умаров on 14.07.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    // создание изображения иконки
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    // создание Лейбла
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.text = "Sample text"
        return label
    }()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .darkGray
        
        addSubview(iconImageView)
        
        // установка констрейнтов
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        
        // размер изображения иконок
        iconImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Handlers
    
}
