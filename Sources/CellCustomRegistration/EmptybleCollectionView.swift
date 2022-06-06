//
//  EmptybleCollectionView.swift
//  
//
//  Created by Dmitry Vorozhbicki on 06/06/2022.
//

import UIKit

/// Klasa do pracy z pustymi komórkami w UICollectionView
class EmptybleCollectionView: UICollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCustomClassForCell(UICollectionViewCell.self)
    }
    
    /// Zwraca pusty obiekt komórki wielokrotnego użytku.
    /// - Parameter indexPath: Wskaźnik komurki w tabeli
    /// - Returns: Pusta komórka
    public func emptyCell(for indexPath: IndexPath) -> UICollectionViewCell {
        dequeueCustomReusableCell(for: indexPath, UICollectionViewCell.self)
    }
}
