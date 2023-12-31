//
//  RecipeDetailView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Query var collections: [CollectionItem]
    @Environment(\.openURL) var openURL
    var size: CGSize
    var recipeInfo: RecipeInfo
    @State var pageToggle: Bool = false
    @Query var mealPlans: [DayPlan]
    
    
    var body: some View {
        
        var recipe = recipeInfo.recipe ?? Recipe()
        
        NavigationView{
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: recipe.images?.REGULAR?.url ?? "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg"))
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
                    Text("\(recipe.label ?? "No Label")")
                        .font(.title)
                        .offset(CGSize(width: 0.0, height: -50.0))
                        .padding(.leading, 30)
                    
                    Text("yield: \(recipe.yield ?? 0)")
                        .font(.headline)
                        .padding(.leading, 30)
                        .offset(CGSize(width: 0.0, height: -45.0))
                    
                    if(!pageToggle){
                        VStack(alignment: .leading){
                            List{
                                Section {
                                    ForEach(recipe.ingredients ?? [Ingredient()]){
                                        ingredient in
                                        Text("\(ingredient.text ?? "No Ingredient")")
                                    }
                                    .listRowSeparator(.hidden)
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
                                    Text("Calories: \(recipe.calories ?? 0)")
                                    Text("Time: \(recipe.totalTime ?? 0)")
                                } header: {
                                    Text("Information")
                                }
                                
                                Section {
                                    ForEach(recipe.dietLabels ?? ["No diet labels"], id: \.self) {
                                        label in
                                        Text("\(label)")
                                    }
                                    .listRowSeparator(.hidden)
                                } header: {
                                    Text("Diet labels")
                                }
                                
                                Section {
                                    ForEach(recipe.healthLabels ?? ["No health labels"], id: \.self) {
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
                    openURL(URL(string: recipe.url!)!)
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
        let im = recipeInfo.recipe?.images ?? Images()
        let imTypeReg = im.REGULAR ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let imType = im.SMALL ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let recipe = RecipeItem(label: recipeInfo.recipe?.label ?? "Recipe", imageLink: imType.url, selfLink: recipeInfo._links?.linkInfo.href ?? "https://api.edamam.com/api/recipes/v2/8275bb28647abcedef0baaf2dcf34f8b?type=public&app_id=243ff47b&app_key=71457942cb487b513a099f36f458b05a", recipeRegularImage: imTypeReg.url, recipeYield: recipeInfo.recipe?.yield ?? 0, recipeIngredients: recipeInfo.recipe?.ingredients ?? [Ingredient()], recipeCalories: recipeInfo.recipe?.calories ?? 0.0, recipeTotalTime: recipeInfo.recipe?.totalTime ?? 0, recipeDietLabels: recipeInfo.recipe?.dietLabels ?? ["No diet labels"], recipeHealthLabels: recipeInfo.recipe?.healthLabels ?? ["No health labels"], recipeLinkRecipe: recipeInfo.recipe?.url ?? "https://www.google.com/" )
        collection.collection.append(recipe)
    }
    
    func saveNewItemMealPlan(dayPlanIndex: Int) {
        let im = recipeInfo.recipe?.images ?? Images()
        let imTypeReg = im.REGULAR ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let imType = im.SMALL ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let recipe = RecipeItem(label: recipeInfo.recipe?.label ?? "Recipe", imageLink: imType.url, selfLink: recipeInfo._links?.linkInfo.href ?? "https://api.edamam.com/api/recipes/v2/8275bb28647abcedef0baaf2dcf34f8b?type=public&app_id=243ff47b&app_key=71457942cb487b513a099f36f458b05a", recipeRegularImage: imTypeReg.url, recipeYield: recipeInfo.recipe?.yield ?? 0, recipeIngredients: recipeInfo.recipe?.ingredients ?? [Ingredient()], recipeCalories: recipeInfo.recipe?.calories ?? 0.0, recipeTotalTime: recipeInfo.recipe?.totalTime ?? 0, recipeDietLabels: recipeInfo.recipe?.dietLabels ?? ["No diet labels"], recipeHealthLabels: recipeInfo.recipe?.healthLabels ?? ["No health labels"], recipeLinkRecipe: recipeInfo.recipe?.url ?? "https://www.google.com/" )
        mealPlans[dayPlanIndex].recipes.append(recipe)
    }
    
}


