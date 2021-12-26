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
    
    
//    @EnvironmentObject var model:RecipeModel
    
    @State var selectedServingSize = 2
    
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
                
                //MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                
                //MARK: Serving Size Picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("d", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width:160)
                }
                .padding()
                
                
                //MARK: Ingrediens
                VStack(alignment: .leading){
                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.bottom, 2.0)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
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
//        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and  pass it into the deatail view so that we can see a preview
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
