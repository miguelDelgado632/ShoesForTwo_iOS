//
//  ShoeModel.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import Foundation

//struct Shoe {
//  var users: [String]
//  var images: [String]
//  let name: String
//  let price: Int
//  var liked: Bool
//}
//
//extension Shoe {
//  static func mockedData() -> [Shoe] {
//    let users: [String] = ["person", "person.fill", "person.circle", "person.circle.fill", "person.fill.turn.down", "person.fill.questionmark", "person.crop.circle", "person.crop.circle.dashed.circle.fill"]
//    let shoes: [String] = ["shoe", "shoe.fill", "shoe.2.fill", "shoe.circle", "shoe.2", "shoe.circle.fill", "shoeprints.fill"]
//    return [
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "1", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "2", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "3", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "4", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "5", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "6", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "7", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "8", price: Int.random(in: 100...999999), liked: Bool.random()),
//      Shoe(users: users.shuffled(), images: shoes.shuffled(), name: "9", price: Int.random(in: 100...999999), liked: Bool.random()),
//    ]
//  }
//}

struct ShoeProductElementModel: Codable {
  var product: ProductModel
  let favorites: [ShoeProductFavorite]
  let likesId: [String]
}

struct ProductModel: Codable {
  let productId, sku, name, price: String
  var images: [String]
}

// MARK: - CODABLE MODELS


// MARK: - ShoeProductModel
struct ShoeProductModel: Codable {
  let products: [ShoeProductElement]
  
  enum CodingKeys: String, CodingKey {
    case products = "productos"
  }
}

extension ShoeProductModel {
  func mapToShoeProductElementModel() -> [ShoeProductElementModel] {
    self.products.map {
      let product: ProductShoe = $0.products
      let favorites: [ShoeProductFavorite] = $0.favorites.flatMap({ $0 })
      let likes: [String] = $0.like.flatMap { $0.map { $0.productId } }
      return ShoeProductElementModel(
        product: ProductModel(
          productId: product.productId,
          sku: product.sku,
          name: product.name,
          price: product.price,
          images: [product.imgFirst, product.imgPortrait, product.imgSecond]
        ),
        favorites: favorites,
        likesId: likes
      )
    }
  }
}

// MARK: - ProductoElement
struct ShoeProductElement: Codable {
  let products: ProductShoe
  let favorites: [[ShoeProductFavorite]]
  let like: [[ShoeProductLike]]
  
  enum CodingKeys: String, CodingKey {
    case products = "producto"
    case favorites = "favoritos"
    case like
  }
}

// MARK: - Favorito
struct ShoeProductFavorite: Codable {
  let productId, userId: String
  let picture: String
  
  enum CodingKeys: String, CodingKey {
    case productId = "id_producto"
    case userId = "id_usuario"
    case picture
  }
}

// MARK: - Like
struct ShoeProductLike: Codable {
  let productId: String
  
  enum CodingKeys: String, CodingKey {
    case productId = "id_producto"
  }
}

// MARK: - ProductoProducto
struct ProductShoe: Codable {
  let productId, sku, name, price: String
  let imgPortrait, imgFirst, imgSecond: String
  let imgThird: String?
  
  enum CodingKeys: String, CodingKey {
    case productId = "id_producto"
    case sku
    case name = "nombre"
    case price = "precio"
    case imgPortrait = "img_portada"
    case imgFirst = "img_uno"
    case imgSecond = "img_dos"
    case imgThird = "img_tres"
  }
}

extension [ShoeProductModel] {
  
  static func mockedData() -> Self {
    [
      ShoeProductModel(
        products: [
          ShoeProductElement(
            products: ProductShoe(
              productId: "V8HS45E621",
              sku: "NIKESB",
              name: "Nike SB",
              price: "2800",
              imgPortrait: "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-right.png",
              imgFirst: "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-1.png",
              imgSecond: "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-2.png",
              imgThird: "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-3.png"),
            favorites: [
              [
                ShoeProductFavorite(
                  productId: "V8HS45E621",
                  userId: "05MUDQNZ6E",
                  picture: "http://proyectos-ddbmexico.com/Shoes/assets/perfil/miguel.png"
                )
              ]
            ],
            like: [
              [
                ShoeProductLike(
                  productId: "V8HS45E621"
                )
              ]
            ]
          )
        ]
      ),
      ShoeProductModel(
        products: [
          ShoeProductElement(
            products: ProductShoe(
              productId: "KFXZ9HOM1V",
              sku: "PUMA01",
              name: "Puma",
              price: "3500",
              imgPortrait: "http://proyectos-ddbmexico.com/Shoes/assets/productos/puma-right.png",
              imgFirst: "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-1.png",
              imgSecond: "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-2.png",
              imgThird: "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-3.png"),
            favorites: [[]],
            like: [
              [
                ShoeProductLike(
                  productId: "KFXZ9HOM1V"
                )
              ]
            ]
          )
        ]
      ),
    ]
  }
}

extension [ShoeProductElementModel] {

  static func mockedData() -> Self {
    [
      ShoeProductElementModel(
        product: ProductModel(
          productId: "V8HS45E621",
          sku: "NIKESB",
          name: "Nike SB",
          price: "2800",
          images: [
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-1.png",
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-right.png",
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-2.png",
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-3.png"
          ]
        ),
        favorites: [
          ShoeProductFavorite(
            productId: "V8HS45E621",
            userId: "05MUDQNZ6E",
            picture: "http://proyectos-ddbmexico.com/Shoes/assets/perfil/miguel.png"
          )
        ],
        likesId: ["V8HS45E621"]
      ),
      ShoeProductElementModel(
        product: ProductModel(
          productId: "KFXZ9HOM1V",
          sku: "PUMA01",
          name: "Puma",
          price: "3500",
          images: [
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-1.png",
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/puma-right.png",
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-2.png",
            "http://proyectos-ddbmexico.com/Shoes/assets/productos/nike-gallery-3.png"
          ]
        ),
        favorites: [],
        likesId: ["KFXZ9HOM1V"]
      ),
    ]
  }
}
