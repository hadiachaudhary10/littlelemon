//
//  Font + Extensions.swift
//  Little Lemon
//
//  Created by Dev on 12/07/2023.
//

import SwiftUI

extension Font {
  static let displayTitle: Font = Font.custom("MarkaziText-Regular", size: 50).weight(.regular).bold()
  static let subtitle: Font = Font.custom("MarkaziText-Regular", size: 30).weight(.regular)
  static let leadText: Font = Font.custom("Karla-Regular", size: 18).weight(.regular)
  static let sectionTitle: Font = Font.custom("Karla-Regular", size: 20).weight(.heavy).bold()
  static let weekSpecial: Font = Font.custom("Karla-Regular", size: 16).weight(.heavy).bold()
  static let cardTitle: Font = Font.custom("Karla-Regular", size: 18).weight(.heavy).bold()
  static let paragraph: Font = Font.custom("Karla-Regular", size: 16).weight(.regular)
  static let price: Font = Font.custom("Karla-Regular", size: 16).weight(.heavy).bold()
}
