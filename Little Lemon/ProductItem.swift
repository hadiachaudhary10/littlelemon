//
//  ProductItem.swift
//  Little Lemon
//
//  Created by Dev on 13/07/2023.
//

import SwiftUI

struct ProductItem: View {
  @ObservedObject var dish: Dish
  var body: some View {
    ZStack {
      NavigationLink {
        Details(dish: dish)
      } label: {
        EmptyView()
      }
      .opacity(0.0)
      .buttonStyle(PlainButtonStyle())
      
      HStack {
        VStack(alignment: .leading) {
          Text(dish.title!)
            .font(.cardTitle)
          Text(dish.dishDescription!)
            .font(.paragraph)
            .lineLimit(2)
          Text("$" + dish.price!)
            .font(.price)
            .foregroundColor(Color.secondary1)
        }
        Spacer()
        AsyncImage(url: URL(string: dish.image!), content: { image in
          image
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipped()
            .cornerRadius(10)
        }, placeholder: {
          Color.highlight1
            .frame(width: 80, height: 80)
            .cornerRadius(10)
        })
      }
    }
    .padding(.vertical)
  }
}

struct ProductItem_Previews: PreviewProvider {
  static var previews: some View {
    ProductItem(dish: Dish())
  }
}
