//
//  RecipeDetailView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct CollectionRecipeDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Query var collections: [CollectionItem]
    @Environment(\.openURL) var openURL
    var size: CGSize
    var recipe: RecipeItem
    @State var pageToggle: Bool = false
    @Query var mealPlans: [DayPlan]
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: recipe.recipeRegularImage))
                        .scaleEffect(CGSize(width: 1.4, height: 1.4))
                        .frame(width: size.width, height: 256)
                        .clipped()
                        .edgesIgnoringSafeArea(.top)
                    
                    Button(){
                        pageToggle.toggle()
                    } label: {
                        Text("Change to \(pageToggle ? "Ingredients" : "Information" )")
                        
                    }
                    .buttonStyle(CustomButton())
                    .offset(CGSize(width: 0.0, height: 42.0))
                }
                .frame(width: size.width, height: 256)
                
                VStack(alignment: .leading){
                    Text("\(recipe.label )")
                        .font(.title)
                        .offset(CGSize(width: 0.0, height: -50.0))
                        .padding(.leading, 30)
                    
                    Text("yield: \(recipe.recipeYield )")
                        .font(.headline)
                        .padding(.leading, 30)
                        .offset(CGSize(width: 0.0, height: -45.0))
                    
                    if(!pageToggle){
                        VStack(alignment: .leading){
                            List{
                                Section {
                                    ForEach(recipe.recipeIngredients){
                                        ingredient in
                                        Text("\(ingredient.text ?? "No Ingredient")")
                                    }
                                    .listRowSeparator(.hidden)
                                    /*ForEach(recipe.recipeIngredients){
                                     ingredient in
                                     IngredientRowView(ingredient: IngredientModel(f: IngredientItem(f: ingredient.foodID ?? "", l: ingredient.food ?? "Not food")))
                                     
                                     }.listRowSeparator(.hidden)*/
                                } header: {
                                    Text("Ingredients")
                                }
                            }
                            .listStyle(.plain)
                            Spacer()
                        }
                        .frame(width: size.width, alignment: .leading)
                        .offset(CGSize(width: 0.0, height: -40.0))
                        
                    } else {
                        VStack(alignment: .leading){
                            List{
                                Section {
                                    Text("Calories: \(recipe.recipeCalories )")
                                    Text("Time: \(recipe.recipeTotalTime )")
                                } header: {
                                    Text("Information")
                                }
                                
                                Section {
                                    ForEach(recipe.recipeDietLabels , id: \.self) {
                                        label in
                                        Text("\(label)")
                                    }
                                    .listRowSeparator(.hidden)
                                } header: {
                                    Text("Diet labels")
                                }
                                
                                Section {
                                    ForEach(recipe.recipeHealthLabels , id: \.self) {
                                        label in
                                        Text("\(label)")
                                    }
                                    .listRowSeparator(.hidden)
                                } header: {
                                    Text("Health labels")
                                }
                            }
                            .listStyle(.plain)
                            Spacer()
                        }
                        .frame(width: size.width, alignment: .leading)
                        .offset(CGSize(width: 0.0, height: -40.0))
                    }
                }
                .frame(height: size.height * 0.65)
                
            }
        }.toolbar {
            ToolbarItem{
                Button("Cook this"){
                    print(recipe.recipeLinkRecipe)
                    openURL(URL(string: recipe.recipeLinkRecipe)!)
                }
                .buttonStyle(CustomButton())
            }
            
            ToolbarItem{
                ZStack{
                    Menu{
                        ForEach(collections){
                            collection in
                            Button(collection.name){
                                saveNewItemCollection(collection: collection)
                            }
                        }
                        if(!mealPlans.isEmpty){
                            ForEach(mealPlans.indices){
                                index in
                                Button(mealPlans[index].name){
                                    saveNewItemMealPlan(dayPlanIndex: index)
                                }
                            }
                        }
                    }label:{
                        ZStack{
                            Circle().frame(width:45, height: 45)
                                .foregroundStyle(.regularMaterial)
                            Image(systemName: "plus")
                                .foregroundColor(Color("Main"))
                                .scaleEffect(CGSize(width: 1.3, height: 1.3))
                        }
                    }
                }
            }
            
        }.toolbarBackground(.ultraThinMaterial, for: .navigationBar)
        
    }
    
    func saveNewItemCollection(collection: CollectionItem) {
        collection.collection.append(recipe)
    }
    
    func saveNewItemMealPlan(dayPlanIndex: Int) {
        mealPlans[dayPlanIndex].recipes.append(recipe)
    }
    
}
