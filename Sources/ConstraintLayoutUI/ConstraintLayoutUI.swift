import SwiftUI

@available(iOS 14.0, *)
public struct ConstraintLayoutUI {
    @StateObject public var constraint: Constraint = Constraint()

    public init() {
        
    }
    
    public var contentView = ContentView()
}
