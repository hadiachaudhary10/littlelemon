//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Dev on 11/07/2023.
//

import SwiftUI

struct UserProfile: View {
  
  @State var firstName: String = UserDefaults.standard.string(forKey:  "first name key") ?? ""
  @State var lastName: String = UserDefaults.standard.string(forKey:  "last name key") ?? ""
  @State var email: String = UserDefaults.standard.string(forKey:  "email key") ?? ""
  @Environment(\.presentationMode) var presentation
  
  @State var newFirstName: String = ""
  @State var newLastName: String = ""
  @State var newEmail: String = ""
  
  @StateObject private var keyboardHandler = KeyboardHandler()
  
  
  var body: some View {
    VStack(alignment: .leading) {
      if keyboardHandler.keyboardHeight == 0.0 {
        Text("Personal Information")
          .font(.subtitle)
          .bold()
        Image("Profile")
          .resizable()
          .scaledToFit()
          .frame(width: UIScreen.main.bounds.width/4)
      }
      Text("First Name")
        .font(.paragraph)
      TextField("", text: $newFirstName)
        .padding(.all)
        .background(Color.highlight1)
        .cornerRadius(10)
      Text("Last Name")
        .font(.paragraph)
      TextField("", text: $newLastName)
        .padding(.all)
        .background(Color.highlight1)
        .cornerRadius(10)
      Text("Email")
        .font(.paragraph)
      TextField("", text: $newEmail)
        .padding(.all)
        .background(Color.highlight1)
        .cornerRadius(10)
      if keyboardHandler.keyboardHeight == 0.0 {
        HStack {
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
      }
      HStack {
        Button("Discard") {
          newFirstName = firstName
          newLastName = lastName
          newEmail = email
        }
        .foregroundColor(Color.highlight2)
        .padding(.all)
        .padding(.horizontal)
        .background(Color.highlight1)
        .cornerRadius(10)
        .padding(.all)
        Spacer()
        Button("Save") {
          if (!newFirstName.isEmpty && !newLastName.isEmpty && !newEmail.isEmpty && isValidEmail(newEmail)) {
            UserDefaults.standard.set(newFirstName, forKey: kFirstName)
            UserDefaults.standard.set(newLastName, forKey: kLastName)
            UserDefaults.standard.set(newEmail, forKey: kEmail)
            firstName = UserDefaults.standard.string(forKey:  "first name key") ?? ""
            lastName = UserDefaults.standard.string(forKey:  "last name key") ?? ""
            email = UserDefaults.standard.string(forKey:  "email key") ?? ""
          }
        }
        .foregroundColor(Color.highlight1)
        .padding(.all)
        .padding(.horizontal)
        .background(Color.primary1)
        .cornerRadius(10)
        .padding(.all)
      }
    }
    .padding(.all)
    .onAppear {
      firstName = UserDefaults.standard.string(forKey:  "first name key") ?? ""
      lastName = UserDefaults.standard.string(forKey:  "last name key") ?? ""
      email = UserDefaults.standard.string(forKey:  "email key") ?? ""
      newFirstName = firstName
      newLastName = lastName
      newEmail = email
    }
  }
}

struct UserProfile_Previews: PreviewProvider {
  static var previews: some View {
    UserProfile()
  }
}
