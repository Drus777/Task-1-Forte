//
//  MainModelTest.swift
//  Task #1 ForteTests
//
//  Created by Andrey on 20.12.21.
//

import XCTest
@testable import Task__1_Forte

class MockView: MainViewProtocol {
  func fillData() {
    print("hello")
  }
}

class MainModelTest: XCTestCase {
  
  var view: MockView!
  var dataModel: DataModel!
  var model: MainModel!
  
  override func setUpWithError() throws {
    view = MockView()
    dataModel = DataModel(
      titleLabel: "Allow tracking",
      mainLabel: nil,
      infoLabel: "You can change this",
      textContent: [
        "Special offers",
        "Advertisements",
        "An improved"
      ],
      imageNames: [
        "heart.fill",
        "hand.point.up.braille.fill",
        "wifi"
      ])
    model = MainModel(view: view, model: dataModel)
  }
  
  override func tearDownWithError() throws {
    view = nil
    dataModel = nil
    model = nil
  }
  
  func testModuleIsNotNil()  {
    XCTAssertNotNil(view, "view is not nil")
    XCTAssertNotNil(dataModel, "view is not nil")
    XCTAssertNotNil(model, "view is not nil")
  }
  
  func testView() {
    model.fillView()
  }
  
  func testDataModel() {
    XCTAssertEqual(model.dataModel.infoLabel, "You can change this")
    XCTAssertEqual(model.dataModel.titleLabel, "Allow tracking")
  }
}
