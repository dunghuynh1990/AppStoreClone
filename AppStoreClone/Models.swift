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
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchFeaturedApp(completionHandler:@escaping ([AppCategory]) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        // Move to a background thread to do some long running work
        DispatchQueue.global(qos: .userInitiated).async {
            URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                do {
                    let json = try (JSONSerialization.jsonObject(with: data!, options: .mutableContainers)) as! [String:AnyObject]
                    var appCategories = [AppCategory]()
                    
                    for dict in json["categories"] as! [[String: AnyObject]] {
                        let appCategory = AppCategory()
                        appCategory.setValuesForKeys(dict)
                        appCategories.append(appCategory)
                    }
                    print(appCategories)
                    DispatchQueue.main.async {
                        // UI Updates
                        completionHandler(appCategories)
                    }
                } catch let err {
                    print(err)
                }
            }.resume()
        }
    }
    
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
