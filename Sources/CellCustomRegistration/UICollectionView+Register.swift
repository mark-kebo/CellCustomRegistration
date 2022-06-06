//
//  UITableView+Register.swift
//
//
//  Created by Dmitry Vorozhbicki on 06/06/2022.
//

import UIKit

extension UICollectionView {
    /// Rejestracja komórki wielokrotnego użytku na podstawie jego typu z xib-u.
    public func registerCustomNibForCell<T: UICollectionViewCell>(_ cell: T.Type) {
        registerCustomNibForCell(cell, withIdentifier: cell.identifier)
    }

    /// Rejestracja komórki wielokrotnego użytku na podstawie jego typu z klasu
    public func registerCustomClassForCell<T: UICollectionViewCell>(_ cell: T.Type) {
        register(cell.self, forCellWithReuseIdentifier: cell.identifier)
    }
    
    /// Zwraca obiekt komórki wielokrotnego użytku na podstawie jego typu.
    /// - Returns: Komórka odpowiedniego typu
    /// - Warning: Force unwrapping UICollectionViewCell do typu T nie spowoduję kraszu, bo robimy dequeueReusableCell odpowiedniego typu używając identifier
    public func dequeueCustomReusableCell<T: UICollectionViewCell>(for index: IndexPath, _ cell: T.Type) -> T {
        dequeueReusableCell(withReuseIdentifier: T.identifier, for: index) as! T
    }
    
    /// Rejestracja nagłówka wielokrotnego użytku na podstawie jego typu
    public func registerCustomHeader<T: UICollectionReusableView>(_ header: T.Type) {
        let nib = UINib(nibName: String(describing: header), bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.identifier)
    }

    /// Rejestracja stopki wielokrotnego użytku na podstawie jego typu
    public func registerCustomFooter<T: UICollectionReusableView>(_ footer: T.Type) {
        let nib = UINib(nibName: String(describing: footer), bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.identifier)
    }

    /// Zwraca obiekt nagłówka wielokrotnego użytku na podstawie jego typu.
    /// - Returns: Nagłówek odpowiedniego typu
    /// - Warning: Force unwrapping UICollectionReusableView do typu T nie spowoduję kraszu, bo robimy dequeueReusableSupplementaryView odpowiedniego typu używając identifier
    public func dequeueCustomHeader<T: UICollectionReusableView>(for index: IndexPath, _ view: T.Type) -> T {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier, for: index) as! T
    }

    /// Zwraca obiekt stopki wielokrotnego użytku na podstawie jego typu.
    /// - Returns: Stopka odpowiedniego typu
    /// - Warning: Force unwrapping UICollectionReusableView do typu T nie spowoduję kraszu, bo robimy dequeueReusableSupplementaryView odpowiedniego typu używając identifier
    public func dequeueCustomFooter<T: UICollectionReusableView>(for index: IndexPath, _ view: T.Type) -> T {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.identifier, for: index) as! T
    }
    
    fileprivate func registerCustomNibForCell<T: UICollectionViewCell>(_ cell: T.Type, withIdentifier identifier: String) {
        let nib = UINib(nibName: String(describing: cell), bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}
