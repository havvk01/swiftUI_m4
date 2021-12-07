//
//  ContentView.swift
//  Lesson 13
//
//  Created by Slava Havvk on 23.11.2021.
//

import SwiftUI

struct RecipeListView: View {
    
    //Reference the vies model
    @ObservedObject var model = RecipeModel()
    
    
    var body: some View {

// command + lkm = pomestit vse d new konteiner

        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(destination: RecipeDetailView(recipe:r), label: {
                    //MARK: Row item
                    HStack(spacing: 20.0) {
                        Image(r.image).resizable().scaledToFill().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipped().cornerRadius(5)
                        Text(r.name)
                    }
                })
                    
                
    //            VStack {
    //                List(model.recipes) { r in
    //
    //                    VStack(alignment: .leading) {
    //                        Text(r.name).font(.title)
    //                        HStack{
    //                            Text(r.toppings[0]);Text(r.toppings[1]);Text(r.toppings[2])
    //                        }
    //
    //                    }
    //                }        }
            }
            .navigationBarTitle("All Recipes")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
