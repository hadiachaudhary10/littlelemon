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
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Image("Logo")
          .resizable()
          .scaledToFill()
          .frame(width: 200, height: 40)
          .padding(.horizontal)
        Image("Profile")
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40)
          .clipped()
          .cornerRadius(20)
          .padding(.horizontal)
        
      }
      VStack(alignment: .leading) {
        Text("Little Lemon Quest")
          .font(.displayTitle)
          .foregroundColor(Color.primary2)
          .padding(.bottom)
        HStack {
          VStack(alignment: .leading) {
            Text("Chicago")
              .font(.subtitle)
              .foregroundColor(Color.highlight1)
            Text("Little Lemon is a charming neighborhood bistro that serves simple food and classic cocktails in a lively but casual environment.")
              .multilineTextAlignment(.leading)
              .font(.leadText)
              .foregroundColor(Color.highlight1)
              .padding(.bottom)
          }
          Spacer()
          Image("HomeImage")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipped()
            .cornerRadius(10)
        }
        TextField("Search menu", text: $searchText)
          .padding(.all)
          .background(Color.highlight1)
          .padding(.bottom)
          .cornerRadius(10)
      }
      .padding(.horizontal)
      .background(Color.primary1)
      FetchedObjects(
        predicate: buildPredicate(),
        sortDescriptors: buildSortDescriptors()
      ) { (dishes: [Dish]) in
        List(dishes, id: \.id) { dish in
          ProductItem(dish: dish)
        }
        .listStyle(.plain)
      }
      .onAppear {
        viewModel.fetchItemsFromNetwork()
      }
    }
  }
  
  func buildPredicate() -> NSPredicate {
    if searchText.isEmpty {
      return NSPredicate(value: true)
    }
    else {
      return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
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
