//
//  CategoryCell.swift
//  AppStoreClone
//
//  Created by Huynh Tri Dung on 3/3/17.
//  Copyright © 2017 Huynh Tri Dung. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.black
    }
}
