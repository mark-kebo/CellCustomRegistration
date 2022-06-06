//
//  UITableView+Register.swift
//  
//
//  Created by Dmitry Vorozhbicki on 06/06/2022.
//

import UIKit

extension UITableView {
    /// Rejestracja komórki wielokrotnego użytku na podstawie jego typu z xib-u
    public func registerCustomNibForCell<T: UITableViewCell>(_ cell: T.Type) {
        let nib = UINib(nibName: String(describing: cell), bundle: nil)
        self.register(nib, forCellReuseIdentifier: cell.identifier)
    }

    /// Rejestracja komórki wielokrotnego użytku na podstawie jego typu z klasu
    public func registerCustomClassForCell<T: UITableViewCell>(_ cell: T.Type) {
        self.register(cell, forCellReuseIdentifier: cell.identifier)
    }

    /// Zwraca obiekt komórki wielokrotnego użytku na podstawie jego typu.
    /// - Returns: Komórka odpowiedniego typu
    /// - Warning: Force unwrapping UITableViewCell do typu T nie spowoduję kraszu, bo robimy dequeueReusableCell odpowiedniego typu używając identifier
    public func dequeueCustomReusableCell<T: UITableViewCell>(for index: IndexPath, _ cell: T.Type) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: index) as! T
    }

    /// Rejestracja nagłówka lub stopki wielokrotnego użytku na podstawie jego typu z xib-u
    public func registerCustomNibForHeaderFooter<T: UITableViewHeaderFooterView>(_ view: T.Type) {
        let nib = UINib(nibName: String(describing: view), bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: view.identifier)
    }
    
    /// Rejestracja nagłówka lub stopki wielokrotnego użytku na podstawie jego typu z klasu
    public func registerCustomClassForHeaderFooter<T: UITableViewHeaderFooterView>(_ view: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: view.identifier)
    }

    /// Zwraca obiekt nagłówka lub stopki wielokrotnego użytku na podstawie jego typu.
    /// - Returns: Nagłówek odpowiedniego typu
    /// - Warning: Force unwrapping UITableViewHeaderFooterView do typu T nie spowoduję kraszu, bo robimy dequeueReusableHeaderFooterView odpowiedniego typu używając identifier
    public func dequeueCustomReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ cell: T.Type) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as! T
    }
}
