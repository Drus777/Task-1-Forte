//
//  File.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import UIKit

protocol Factory {
  static func createMenuVC() -> UIViewController
  static func createAdvertistingVC() -> UIViewController
  static func createRegistrationVC() -> UIViewController
  static func createProfileVC() -> UIViewController
}

final class VCFactory: Factory {
  
  static func createMenuVC() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Allow tracking on the next screen for:",
      descriptionLabel: nil,
      infoLabel: "You can change this option later in this Settings app.",
      featureViewData:[
        ComponentModel(textContent: "Special offers and promotions just for you", imageNames: "heart.fill"),
        ComponentModel(textContent: "Advertisements that match your interests", imageNames: "hand.point.up.braille.fill"),
        ComponentModel(textContent: "An improved personalized experience over time", imageNames: "wifi")
      ])
    let model = MainModel(model: dataModel)
    let view = MainView()
    let menuVC = MenuVC(model: model, view: view)
    view.delegate = menuVC
    return menuVC
  }
  
  static func createAdvertistingVC() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Pal\nAbout",
      descriptionLabel: "Turning on location services allows us to provide features like:",
      infoLabel: "You can change this later in the Settings app.",
      featureViewData:[
        ComponentModel(textContent: "Alerts when your pals are nearby", imageNames: "person.crop.circle.fill.badge.exclam"),
        ComponentModel(textContent: "News of events happening near you", imageNames: "flag.fill"),
        ComponentModel(textContent: "Tagging and sharing your location", imageNames: "mappin")
      ])
    let view = SecondView()
    let model = MainModel(model: dataModel)
    let advertistingVC = MenuVC(model: model, view: view)
    view.delegate = advertistingVC
    return advertistingVC
  }
  
  static func createRegistrationVC() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Hello, allow tracking on the next screen for:",
      descriptionLabel: nil,
      infoLabel: "You can change this.",
      featureViewData:[
        ComponentModel(textContent: "Alerts when your pals are nearby", imageNames: "person.crop.circle.fill.badge.exclam"),
        ComponentModel(textContent: "News of events happening near you", imageNames: "flag.fill"),
        ComponentModel(textContent: "Tagging and sharing your location", imageNames: "mappin")
      ])
    let view = MainView()
    let model = MainModel(model: dataModel)
    let registrationVC = MenuVC(model: model, view: view)
    view.delegate = registrationVC
    return registrationVC
  }
  
  static func createProfileVC() -> UIViewController {
    let dataModel = DataModel(
      titleLabel: "Pal",
      descriptionLabel: "Turning on location",
      infoLabel: "You can change this later",
      featureViewData:[
        ComponentModel(textContent: "Special offers and promotions just for you", imageNames: "heart.fill"),
        ComponentModel(textContent: "Advertisements that match your interests", imageNames: "hand.point.up.braille.fill"),
        ComponentModel(textContent: "An improved personalized experience over time", imageNames: "wifi")
      ])
    let view = SecondView()
    let model = MainModel(model: dataModel)
    let ProfileVC = MenuVC(model: model, view: view)
    view.delegate = ProfileVC
    return ProfileVC
  }
}
