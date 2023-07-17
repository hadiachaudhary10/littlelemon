//
//  Details.swift
//  Little Lemon
//
//  Created by Dev on 12/07/2023.
//

import SwiftUI
import CoreData

struct Details: View {
  let dish: Dish
  @Environment(\.managedObjectContext) private var viewContext
  var body: some View {
    VStack {
      Text(dish.title!)
        .font(.displayTitle)
        .foregroundColor(Color.primary1)
      Text(dish.dishDescription!)
        .font(.paragraph)
        .padding(.horizontal)
      Spacer()
      AsyncImage(url: URL(string: dish.image!), content: { image in
        image
          .resizable()
          .scaledToFill()
          .frame(width: 300, height: 300)
          .clipped()
          .cornerRadius(10)
      }, placeholder: {
        Color.highlight1
          .frame(width: 300, height: 300)
          .cornerRadius(10)
      })
      Spacer()
      HStack {
        Text("$" + dish.price!)
          .font(.subtitle)
          .foregroundColor(Color.secondary1)
          .padding(.horizontal)
        Spacer()
        Button("Add to Cart") {
         
        }
        .font(.paragraph)
        .foregroundColor(Color.highlight2)
        .padding(.all)
        .background(Color.primary2)
        .cornerRadius(10)
        .padding(.all)
      }
    }
  }
}

struct Details_Previews: PreviewProvider {
  static var previews: some View {
    Details(dish: Dish())
  }
}
