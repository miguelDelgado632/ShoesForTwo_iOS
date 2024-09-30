//
//  ShoeModel.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import Foundation

struct Shoe {
  var users: [String]
  var images: [String]
  let name: String
  let price: Int
  var liked: Bool
}

extension Shoe {
  static func mockedData() -> [Shoe] {
    let users: [String] = ["person", "person.fill", "person.circle", "person.circle.fill", "person.fill.turn.down", "person.fill.questionmark", "person.crop.circle", "person.crop.circle.dashed.circle.fill"]
    let shoes: [String] = ["shoe", "shoe.fill", "shoe.2.fill", "shoe.circle", "shoe.2", "shoe.circle.fill", "shoeprints.fill"]
    return [
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "1", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "2", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "3", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "4", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "5", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "6", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "7", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "8", price: Int.random(in: 100...999999), liked: Bool.random()),
      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "9", price: Int.random(in: 100...999999), liked: Bool.random()),
    ]
  }
}
