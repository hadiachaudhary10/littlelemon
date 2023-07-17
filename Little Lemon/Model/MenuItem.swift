//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Dev on 11/07/2023.
//

import Foundation

struct MenuItem: Codable, Identifiable  {
  var id: Int
  let title: String
  let image: String
  let price: String
  let description: String
  let category: String
}
