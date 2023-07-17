//
//  Menu.swift
//  Little Lemon
//
//  Created by Dev on 11/07/2023.
//

import SwiftUI
import CoreData

struct Menu: View {
  
  @StateObject var viewModel = DishViewModel()
  @State var searchText: String = ""
  @State var selectedCategory: String = ""
  @StateObject private var keyboardHandler = KeyboardHandler()
  
  var body: some View {
    VStack {
      Header()
      HeroSection(searchText: $searchText, showSearchField: true)
      MenuBreakdown(selectedCategory: $selectedCategory)
      Group {
        FetchedObjects(
          predicate: buildPredicate(),
          sortDescriptors: buildSortDescriptors()
        ) { (dishes: [Dish]) in
          List(dishes, id: \.id) { dish in
            ProductItem(dish: dish)
          }
          .listStyle(.plain)
          
        }
        .frame(height: keyboardHandler.keyboardHeight == 0.0 ? UIScreen.main.bounds.height/5 : UIScreen.main.bounds.height/4)
      }
      .onAppear {
        viewModel.fetchItemsFromNetwork()
      }
    }
  }
  
  func buildPredicate() -> NSPredicate {
    if searchText.isEmpty {
      if selectedCategory.isEmpty {
        return NSPredicate(value: true)
      }
      else {
        return NSPredicate(format: "category CONTAINS[cd] %@", selectedCategory)
      }
    }
    else {
      let predicate1 = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
      let predicate2 = NSPredicate(format: "category CONTAINS[cd] %@", selectedCategory)
      return NSCompoundPredicate(type: .or, subpredicates: [predicate1, predicate2])
    }
  }
  
  func buildSortDescriptors() -> [NSSortDescriptor] {
    let descriptor = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
    return [descriptor]
  }
}

struct Menu_Previews: PreviewProvider {
  static var previews: some View {
    Menu()
  }
}

