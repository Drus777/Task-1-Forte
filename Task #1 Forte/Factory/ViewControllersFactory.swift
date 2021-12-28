//
//  ViewControllersFactory.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import UIKit

struct ViewControllersFactory {
    
    static func menuVC() -> UIViewController {
        let dataModel = DataModel(
            titleLabel: "Allow tracking on the next screen for:",
            descriptionLabel: nil,
            infoLabel: "You can change this option later in this Settings app.",
            featureViewData:[
                FeatureModel(textContent: "Special offers and promotions just for you", imageNames: "heart.fill"),
                FeatureModel(textContent: "Advertisements that match your interests", imageNames: "hand.point.up.braille.fill"),
                FeatureModel(textContent: "An improved personalized experience over time", imageNames: "wifi")
            ])
        let view = MenuView()
        let model = BaseModel(model: dataModel)
        let menuVC = BaseVC(model: model, view: view)
        view.delegate = menuVC
        return menuVC
    }
    
    static func advertistingVC() -> UIViewController {
        let dataModel = DataModel(
            titleLabel: "Pal\nAbout",
            descriptionLabel: "Turning on location services allows us to provide features like:",
            infoLabel: "You can change this later in the Settings app.",
            featureViewData:[
                FeatureModel(textContent: "Alerts when your pals are nearby", imageNames: "person.crop.circle.fill.badge.exclam"),
                FeatureModel(textContent: "News of events happening near you", imageNames: "flag.fill"),
                FeatureModel(textContent: "Tagging and sharing your location", imageNames: "mappin")
            ])
        let view = ProfileView()
        let model = BaseModel(model: dataModel)
        let advertistingVC = BaseVC(model: model, view: view)
        view.delegate = advertistingVC
        return advertistingVC
    }
    
    static func registrationVC() -> UIViewController {
        let dataModel = DataModel(
            titleLabel: "Hello, allow tracking on the next screen for:",
            descriptionLabel: nil,
            infoLabel: "You can change this.",
            featureViewData:[
                FeatureModel(textContent: "Alerts when your pals are nearby", imageNames: "person.crop.circle.fill.badge.exclam"),
                FeatureModel(textContent: "News of events happening near you", imageNames: "flag.fill"),
                FeatureModel(textContent: "Tagging and sharing your location", imageNames: "mappin")
            ])
        let view = MenuView()
        let model = BaseModel(model: dataModel)
        let registrationVC = BaseVC(model: model, view: view)
        view.delegate = registrationVC
        return registrationVC
    }
    
    static func profileVC() -> UIViewController {
        let dataModel = DataModel(
            titleLabel: "Pal",
            descriptionLabel: "Turning on location",
            infoLabel: "You can change this later",
            featureViewData:[
                FeatureModel(textContent: "Special offers and promotions just for you", imageNames: "heart.fill"),
                FeatureModel(textContent: "Advertisements that match your interests", imageNames: "hand.point.up.braille.fill"),
                FeatureModel(textContent: "An improved personalized experience over time", imageNames: "wifi")
            ])
        let view = ProfileView()
        let model = BaseModel(model: dataModel)
        let profileVC = BaseVC(model: model, view: view)
        view.delegate = profileVC
        return profileVC
    }
}
