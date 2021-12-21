//
//  File.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import UIKit

protocol Builder {
  static func createMainModul() -> UIViewController
  static func createSecondModul() -> UIViewController
  static func createThirdModul() -> UIViewController
  static func createFourthModul() -> UIViewController
}

final class ModuleBuilder: Builder {
  static func createMainModul() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Allow tracking on the next screen for:",
      mainLabel: nil,
      infoLabel: "You can change this option later in this Settings app.",
      textContent: [
        "Special offers and promotions just for you",
        "Advertisements that match your interests",
        "An improved personalized experience over time"
      ],
      imageNames: [
        "heart.fill",
        "hand.point.up.braille.fill",
        "wifi"
      ])
    let view = MainVC()
    let model = MainModel(view: view, model: dataModel)
    view.model = model
    return view
  }
  
  static func createSecondModul() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Pal\nAbout",
      mainLabel: "Turning on location services allows us to provide features like:",
      infoLabel: "You can change this later in the Settings app.",
      textContent: [
        "Alerts when your pals are nearby",
        "News of events happening near you",
        "Tagging and sharing your location"
      ],
      imageNames: [
        "person.crop.circle.fill.badge.exclam",
        "flag.fill",
        "mappin"
      ])
    let view = SecondVC()
    let model = MainModel(view: view, model: dataModel)
    view.model = model
    return view
  }
  
  static func createThirdModul() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Hello, allow tracking on the next screen for:",
      mainLabel: nil,
      infoLabel: "You can change this.",
      textContent: [
        "Alerts when your pals are nearby",
        "News of events happening near you",
        "Tagging and sharing your location"
      ],
      imageNames: [
        "person.crop.circle.fill.badge.exclam",
        "flag.fill",
        "mappin"
      ])
    let view = ThirdVC()
    let model = MainModel(view: view, model: dataModel)
    view.model = model
    return view
  }
  
  static func createFourthModul() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Pal",
      mainLabel: "Turning on location",
      infoLabel: "You can change this later",
      textContent: [
        "Special offers and promotions just for you",
        "Advertisements that match your interests",
        "An improved personalized experience over time"
      ],
      imageNames: [
        "person.crop.circle.fill.badge.exclam",
        "flag.fill",
        "mappin"
      ])
    let view = FourthVC()
    let model = MainModel(view: view, model: dataModel)
    view.model = model
    return view
  }
}
