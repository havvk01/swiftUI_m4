//
//  RecipeDetailView.swift
//  Lesson 13
//
//  Created by Slava Havvk on 24.11.2021.
//

// option + command + <- = svernyt kod
// option + command + -> = razvernyt kod

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading){
                
//                Text(recipe.name)
//                    .font(.title)
//                    .padding(.leading, 5.0)
//                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingrediens
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 2.0)
                    
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("• " + item)
                    }
                }
                .padding(.horizontal)
                
                
                //MARK: Diveder
                Divider()
                    
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions:")
                        .font(.headline)
                        .padding([.bottom, .top], 2.0)
                    
                    ForEach (0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index+1) + ") " + recipe.directions[index])
                            .padding(.bottom, 10.0)
                    }
                }
                .padding(.horizontal, 2.0)
            }
            
            
            
     
            
        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and  pass it into the deatail view so that we can see a preview
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
