//
//  Models.swift
//  AppStoreClone
//
//  Created by Huynh Tri Dung on 3/6/17.
//  Copyright © 2017 Huynh Tri Dung. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    
    static func sampleAppCategories() -> [AppCategory] {
        let bestNewAppCategory = AppCategory()
        bestNewAppCategory.name = "Best New Apps"
        var apps = [App]()
        
        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.category = "Entertainment"
        frozenApp.imageName = "frozen"
        frozenApp.price = NSNumber(floatLiteral: 3.99)
        apps.append(frozenApp)
        bestNewAppCategory.apps = apps
        
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        
        var bestNewGamesApps = [App]()
        let telepaintApp = App()
        telepaintApp.name = "TelePaint"
        telepaintApp.category = "Games"
        telepaintApp.imageName = "telepaint"
        telepaintApp.price = NSNumber(floatLiteral: 2.99)
        bestNewGamesApps.append(telepaintApp)
        bestNewGamesCategory.apps = bestNewGamesApps
        
        
        return [bestNewAppCategory, bestNewGamesCategory]
    }
}

class App: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}
