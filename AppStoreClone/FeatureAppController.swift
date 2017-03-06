//
//  ViewController.swift
//  AppStoreClone
//
//  Created by Huynh Tri Dung on 3/3/17.
//  Copyright © 2017 Huynh Tri Dung. All rights reserved.
//

import UIKit

class FeatureAppController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let cellId = "cellId"
    var appCategories: [AppCategory]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appCategories = AppCategory.sampleAppCategories()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)  as! CategoryCell
        cell.appCategory = appCategories?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    
}

extension FeatureAppController {
    

}

