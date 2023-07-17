//
//  Header.swift
//  Little Lemon
//
//  Created by Dev on 14/07/2023.
//

import SwiftUI

struct Header: View {
  var body: some View {
    HStack {
      Spacer()
      Image("Logo")
        .resizable()
        .scaledToFit()
        .frame(width: 200, height: 40)
        .padding(.horizontal)
      Image("Profile")
        .resizable()
        .scaledToFill()
        .frame(width: 40, height: 40)
        .cornerRadius(20)
        .padding(.horizontal)
    }
  }
}

struct Header_Previews: PreviewProvider {
  static var previews: some View {
    Header()
  }
}
