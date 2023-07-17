//
//  Home.swift
//  Little Lemon
//
//  Created by Dev on 11/07/2023.
//

import SwiftUI

struct Home: View {
  
  let persistenceController = PersistenceController.shared
  
  var body: some View {
    TabView {
      Menu()
        .tabItem {
          Label("Menu", systemImage: "list.dash")
        }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .clipped()
      UserProfile()
        .tabItem {
          Label("Profile", systemImage: "square.and.pencil")
        }
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
