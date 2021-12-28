//
//  BaseModel.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import Foundation

protocol BaseModelProtocol: AnyObject {
    init(model: DataModel)
    func updateViewData(completion: (DataModel) -> Void)
}

final class BaseModel: BaseModelProtocol {
    private var dataModel: DataModel
    
    required init(model: DataModel) {
        self.dataModel = model
    }
    
    func updateViewData(completion: (DataModel) -> Void) {
        completion(dataModel)
    }
}
