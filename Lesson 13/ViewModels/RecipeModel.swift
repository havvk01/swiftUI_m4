//
//  RecipeModel.swift
//  Lesson 13
//
//  Created by Slava Havvk on 23.11.2021.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //Create an instance of data service and get the data
//        let service = DataService()
//        self.recipes = service.getLocalData()
// add "static" in name DataService() and...
        self.recipes = DataService.getLocalData()
    }
}
