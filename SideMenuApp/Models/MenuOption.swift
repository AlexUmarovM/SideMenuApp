//
//  MenuOption.swift
//  SideMenuApp
//
//  Created by Александр Умаров on 14.07.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import  UIKit
// подписав по Int мы будем обращаться в кейсам по индексу
enum MenuOption: Int, CustomStringConvertible {
    case profile
    case inbox
    case notification
    case settings
    
    // Создание описания
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .inbox: return "Inbox"
        case .notification: return "Notification"
        case .settings: return "Settings"
        }
    }
    
    // добавление изображения
    var image: UIImage {
           switch self {
           case .profile: return UIImage(named: "image-file-sketch") ?? UIImage()
           case .inbox: return UIImage(named: "email-open-sketched-envelope") ?? UIImage()
           case .notification: return UIImage(named: "file-sketch-with-text-lines") ?? UIImage()
           case .settings: return UIImage(named: "configuration-gear-sketch") ?? UIImage()
           }
       }
}
