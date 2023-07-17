//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Dev on 11/07/2023.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
  
  @State var firstName: String = ""
  @State var lastName: String = ""
  @State var email: String = ""
  @State var isLoggedIn: Bool = false
  
  @FocusState private var firstNameFieldIsFocused: Bool
  @FocusState private var lastNameFieldIsFocused: Bool
  @FocusState private var emailFieldIsFocused: Bool
  
  @StateObject private var keyboardHandler = KeyboardHandler()
  
  var body: some View {
    NavigationStack {
      VStack {
        Image("Logo")
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 40)
          .padding(.horizontal)
        if keyboardHandler.keyboardHeight == 0.0 {
          HeroSection(showSearchField: false)
        }
        Spacer()
        TextField("First Name", text: $firstName)
          .disableAutocorrection(true)
          .focused($firstNameFieldIsFocused)
        TextField("Last Name", text: $lastName)
          .disableAutocorrection(true)
          .focused($lastNameFieldIsFocused)
        TextField("Email", text: $email)
          .disableAutocorrection(true)
          .focused($emailFieldIsFocused)
          .keyboardType(.emailAddress)
          .textInputAutocapitalization(.never)
        Spacer()
        Button("Register") {
          if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && isValidEmail(email)) {
            isLoggedIn = true
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
          }
        }
        .foregroundColor(Color.highlight2)
        .padding(.all)
        .background(Color.primary2)
        .cornerRadius(10)
        .padding(.all)
        Spacer()
      }
      .textFieldStyle(.roundedBorder)
      .padding(.all)
      .background(Color.highlight1)
      .onAppear(perform: {
        if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
          isLoggedIn = true
        }
      })
      .navigationDestination(
        isPresented: $isLoggedIn) {
          Home()
        }
    }
  }
}

struct Onboarding_Previews: PreviewProvider {
  static var previews: some View {
    Onboarding()
  }
}
