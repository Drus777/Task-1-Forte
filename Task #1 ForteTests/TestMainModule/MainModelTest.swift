//
//  MainModelTest.swift
//  Task #1 ForteTests
//
//  Created by Andrey on 20.12.21.
//

import XCTest
@testable import Task__1_Forte

class MockView: UIView, FillableProtocol{
    var titleLable: String?
    func fill(by model: DataModel) {
        self.titleLable = model.titleLabel
    }
}

class MainModelTest: XCTestCase {
    
    var view: MockView!
    var dataModel: DataModel!
    var model: MainModel!
    
    override func setUpWithError() throws {
        view = MockView()
        dataModel = DataModel(
            titleLabel: "Pal",
            descriptionLabel: "Turning on location",
            infoLabel: "You can change this later",
            featureViewData:[
                FeatureModel(textContent: "Special", imageNames: "heart.fill"),
                FeatureModel(textContent: "Advertisements", imageNames: "hand.point.up.braille.fill"),
                FeatureModel(textContent: "An improved", imageNames: "wifi")
            ])
        model = MainModel(model: dataModel)
    }
    
    override func tearDownWithError() throws {
        view = nil
        dataModel = nil
        model = nil
    }
    
    func testModuleIsNotNil()  {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(dataModel, "dataModel is not nil")
        XCTAssertNotNil(model, "model is not nil")
    }
    
    func testView() {
        model.updateViewData { data in
            view.fill(by: data)
        }
        XCTAssertEqual(view.titleLable, "Pal")
    }
    
    func testDataModel() {
        XCTAssertEqual(dataModel.titleLabel, "Pal")
        XCTAssertEqual(dataModel.infoLabel, "You can change this later")
    }
}
