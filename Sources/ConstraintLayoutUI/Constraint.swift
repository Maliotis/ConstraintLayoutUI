//
//  File.swift
//  
//
//  Created by petros maliotis on 17/03/2022.
//

import Combine

@available(iOS 14.0, *)
public class Constraint: ObservableObject {
    @Published public var topConstraintButtonPressed = false
    
    @Published public var leftConstraintButtonPressed = false
    
    @Published public var bottomConstraintButtonPressed = false
    
    @Published public var rightConstraintButtonPressed = false
            
    // top value
    @Published public var topConstraintValue = "0"
    
    // left value
    @Published public var leftConstraintValue = "0"
    
    // right value
    @Published public var rightConstraintValue = "0"
    
    // bottom value
    @Published public var bottomConstraintValue = "0"
    
    // top view value
    @Published public var topConstraintView = "parent"
    
    // left view value
    @Published public var leftConstraintView = "parent"
    
    // right view value
    @Published public var rightConstraintView = "parent"
    
    // bottom view value
    @Published public var bottomConstraintView = "parent"
    
    // top edge value
    @Published public var topConstraintEdge = "top"
    
    // left edge value
    @Published public var leftConstraintEdge = "left"
    
    // right edge value
    @Published public var rightConstraintEdge = "right"
    
    // bottom edge value
    @Published public var bottomConstraintEdge = "bottom"
    
    // data - overwrite the demo values
    @Published public var constraintData: [String] = createConstraintData()
    @Published public var viewData: [String] = createViewData()
    @Published public var decimalData: [String] = createDecimalData()
}
