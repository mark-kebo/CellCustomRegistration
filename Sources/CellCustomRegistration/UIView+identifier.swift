//
//  UIView+identifier.swift
//  
//
//  Created by Dmitry Vorozhbicki on 06/06/2022.
//

import UIKit

extension UIView {
    public static var identifier: String {
        return String(describing: self)
    }
}
