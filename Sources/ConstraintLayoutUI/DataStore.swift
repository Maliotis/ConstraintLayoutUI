//
//  File.swift
//  
//
//  Created by petros maliotis on 13/12/2021.
//

import Foundation

@available(iOS 14.0, *)
public class DataStore: ObservableObject {
    @Published public var constraintData = createConstraintData()
    @Published public var viewData = createViewData()
    @Published public var decimalData = createDecimalData()
}
