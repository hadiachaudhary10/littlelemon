//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Dev on 11/07/2023.
//

import SwiftUI

struct UserProfile: View {
  
  let firstName: String = UserDefaults.standard.string(forKey:  "first name key") ?? ""
  let lastName: String = UserDefaults.standard.string(forKey:  "last name key") ?? ""
  let email: String = UserDefaults.standard.string(forKey:  "email key") ?? ""
  @Environment(\.presentationMode) var presentation
  
  var body: some View {
    VStack(alignment: .center) {
      Spacer()
      Text("Personal Information")
        .font(.subtitle)
        .bold()
      Spacer()
      Image("Profile")
        .resizable()
        .scaledToFit()
        .frame(width: UIScreen.main.bounds.width/4)
      Text(firstName)
        .font(.leadText)
      Text(lastName)
        .font(.leadText)
      Text(email)
        .font(.leadText)
      Spacer()
      Button("Logout") {
        UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
        self.presentation.wrappedValue.dismiss()
      }
      .frame(width: UIScreen.main.bounds.width/1.5)
      .foregroundColor(Color.highlight2)
      .padding(.all)
      .background(Color.primary2)
      .cornerRadius(10)
      .padding(.vertical)
      Spacer()
    }
    .frame(maxWidth: .infinity, alignment: .center)
  }
}

struct UserProfile_Previews: PreviewProvider {
  static var previews: some View {
    UserProfile()
  }
}
