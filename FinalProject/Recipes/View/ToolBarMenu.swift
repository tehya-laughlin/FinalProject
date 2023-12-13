//
//  ToolBarMenu.swift
//  CookBook
//
//  Created by Tehya Laughlin on 12/13/23.
//

import Foundation
import SwiftUI
import SwiftData

struct ToolBarMenu: View{
    
    @Environment(\.modelContext) private var context
    @Query var collections: [CollectionItem]
    @Query var mealPlans: [DayPlan]
    
    var recipeInfo: RecipeInfo
    
    
    var body: some View {
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
    
    func saveNewItemCollection(collection: CollectionItem) {
        let im = recipeInfo.recipe?.images ?? Images()
        let imTypeReg = im.REGULAR ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let imType = im.SMALL ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let recipe = RecipeItem(label: recipeInfo.recipe?.label ?? "Recipe", imageLink: imType.url, selfLink: recipeInfo._links?.linkInfo.href ?? "https://api.edamam.com/api/recipes/v2/8275bb28647abcedef0baaf2dcf34f8b?type=public&app_id=243ff47b&app_key=71457942cb487b513a099f36f458b05a", recipeRegularImage: imTypeReg.url, recipeYield: recipeInfo.recipe?.yield ?? 0, recipeIngredients: recipeInfo.recipe?.ingredients ?? [Ingredient()], recipeCalories: recipeInfo.recipe?.calories ?? 0.0, recipeTotalTime: recipeInfo.recipe?.totalTime ?? 0, recipeDietLabels: recipeInfo.recipe?.dietLabels ?? ["No diet labels"], recipeHealthLabels: recipeInfo.recipe?.healthLabels ?? ["No health labels"], recipeLinkRecipe: recipeInfo.recipe?.source ?? "https://www.google.com/" )
        collection.collection.append(recipe)
    }
    
    func saveNewItemMealPlan(dayPlanIndex: Int) {
        let im = recipeInfo.recipe?.images ?? Images()
        let imTypeReg = im.REGULAR ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let imType = im.SMALL ?? ImageInfo(url: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg", width: 0, height: 0)
        let recipe = RecipeItem(label: recipeInfo.recipe?.label ?? "Recipe", imageLink: imType.url, selfLink: recipeInfo._links?.linkInfo.href ?? "https://api.edamam.com/api/recipes/v2/8275bb28647abcedef0baaf2dcf34f8b?type=public&app_id=243ff47b&app_key=71457942cb487b513a099f36f458b05a", recipeRegularImage: imTypeReg.url, recipeYield: recipeInfo.recipe?.yield ?? 0, recipeIngredients: recipeInfo.recipe?.ingredients ?? [Ingredient()], recipeCalories: recipeInfo.recipe?.calories ?? 0.0, recipeTotalTime: recipeInfo.recipe?.totalTime ?? 0, recipeDietLabels: recipeInfo.recipe?.dietLabels ?? ["No diet labels"], recipeHealthLabels: recipeInfo.recipe?.healthLabels ?? ["No health labels"], recipeLinkRecipe: recipeInfo.recipe?.source ?? "https://www.google.com/" )
        mealPlans[dayPlanIndex].recipes.append(recipe)
    }
}
