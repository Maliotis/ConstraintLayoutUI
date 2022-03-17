//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by petros maliotis on 06/12/2021.
//

import SwiftUI

@available(iOS 14.0, *)
public struct ContentView: View {
    
    @State public var topConstraintButtonPressed = false
    // Override this method to handle the buttons onClick
    public var topConstraintButtonHandler: (Bool) -> Void = {_ in }
    
    @State public var leftConstraintButtonPressed = false
    // Override this method to handle the buttons onClick
    public var leftConstraintButtonHandler: (Bool) -> Void = {_ in }
    
    @State public var bottomConstraintButtonPressed = false
    // Override this method to handle the buttons onClick
    public var bottomConstraintButtonHandler: (Bool) -> Void = {_ in }
    
    @State public var rightConstraintButtonPressed = false
    // Override this method to handle the buttons onClick
    public var rightConstraintButtonHandler: (Bool) -> Void = {_ in }
    
    // add listeners for dropDown values change
    
    // top value
    @State public var topConstraintValue = "0"
    public var topConstraintValueChanged:(String) -> Void = {_ in }
    
    // left value
    @State public var leftConstraintValue = "0"
    public var leftConstraintValueChanged:(String) -> Void = {_ in }
    
    // right value
    @State public var rightConstraintValue = "0"
    public var rightConstraintValueChanged:(String) -> Void = {_ in }
    
    // bottom value
    @State public var bottomConstraintValue = "0"
    public var bottomConstraintValueChanged:(String) -> Void = {_ in }
    
    // top view value
    @State public var topConstraintView = "parent"
    public var topConstraintViewChanged:(String) -> Void = {_ in }
    
    // left view value
    @State public var leftConstraintView = "parent"
    public var leftConstraintViewChanged:(String) -> Void = {_ in }
    
    // right view value
    @State public var rightConstraintView = "parent"
    public var rightConstraintViewChanged:(String) -> Void = {_ in }
    
    // bottom view value
    @State public var bottomConstraintView = "parent"
    public var bottomConstraintViewChanged:(String) -> Void = {_ in }
    
    // top edge value
    @State public var topConstraintEdge = "top"
    public var topConstraintEdgeChanged:(String) -> Void = {_ in }
    
    // left edge value
    @State public var leftConstraintEdge = "left"
    public var leftConstraintEdgeChanged:(String) -> Void = {_ in }
    
    // right edge value
    @State public var rightConstraintEdge = "right"
    public var rightConstraintEdgeChanged:(String) -> Void = {_ in }
    
    // bottom edge value
    @State public var bottomConstraintEdge = "bottom"
    public var bottomConstraintEdgeChanged:(String) -> Void = {_ in }
    
    //
    public var paddingForHorizontalDropDowns: CGFloat = 3.5
    
    // data - overwrite the demo values
    @State public var constraintData: [String] = createConstraintData()
    @State public var viewData: [String] = createViewData()
    @State public var decimalData: [String] = createDecimalData()
    
    public var body: some View {
        VStack(alignment: .center, spacing: 2) {
            
            VStack(alignment: .trailing) {
                SpacingView(value: $topConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraintData).onChange(of: topConstraintEdge, perform: topConstraintEdgeChanged)
                SpacingView(value: $topConstraintView, numeric: false, placeholder: "view", dropDownList: viewData).onChange(of: topConstraintView, perform: topConstraintViewChanged)
                SpacingView(value: $topConstraintValue, numeric: true, placeholder: "Top", dropDownList: decimalData).onChange(of: topConstraintValue, perform: topConstraintValueChanged)
                
            }.frame(minWidth: 50, maxWidth: 70, minHeight: 20, maxHeight: 60)
            
            Button {
                topConstraintButtonPressed = !topConstraintButtonPressed
                topConstraintButtonHandler(topConstraintButtonPressed)
            } label: {
                if topConstraintButtonPressed {
                    verticalLineImage()
                } else {
                    verticalLineImage()
                        .opacity(0.3)
                }
            }
            
            HStack(alignment: .center, spacing: 2) {
//                Spacer(minLength: 4)
                SpacingView(value: $leftConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraintData)
                    .onChange(of: leftConstraintEdge, perform: leftConstraintEdgeChanged)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                SpacingView(value: $leftConstraintView, numeric: false, placeholder: "view", dropDownList: viewData)
                    .onChange(of: leftConstraintView, perform: leftConstraintViewChanged)
                    .padding([.leading], paddingForHorizontalDropDowns)
                SpacingView(value: $leftConstraintValue, numeric: true, placeholder: "left", dropDownList: decimalData)
                    .onChange(of: leftConstraintValue, perform: leftConstraintValueChanged)
                    .padding(.trailing, 7)
                Button {
                    leftConstraintButtonPressed = !leftConstraintButtonPressed
                    leftConstraintButtonHandler(leftConstraintButtonPressed)
                } label: {
                    if leftConstraintButtonPressed {
                        horizLineImage()
                    } else {
                        horizLineImage()
                            .opacity(0.3)
                    }
                }
                
                Image(systemName: "square")
                
                Button {
                    rightConstraintButtonPressed = !rightConstraintButtonPressed
                    rightConstraintButtonHandler(rightConstraintButtonPressed)
                } label: {
                    if rightConstraintButtonPressed {
                        horizLineImage()
                    } else {
                        horizLineImage()
                            .opacity(0.3)
                    }
                }
                
                SpacingView(value: $rightConstraintValue, numeric: true, placeholder: "right", dropDownList: decimalData)
                    .onChange(of: rightConstraintValue, perform: rightConstraintValueChanged)
                
                SpacingView(value: $rightConstraintView, numeric: false, placeholder: "view", dropDownList: viewData)
                    .onChange(of: rightConstraintView, perform: rightConstraintViewChanged)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                
                SpacingView(value: $rightConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraintData)
                    .onChange(of: rightConstraintEdge, perform: rightConstraintEdgeChanged)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                Spacer()
                    .frame(width: 1, height: 10)
                
            }
//            .fixedSize(horizontal: true, vertical: false)
            .frame(minWidth: 50, maxWidth: 440, minHeight: 20, maxHeight: 22)
            
            Button {
                bottomConstraintButtonPressed = !bottomConstraintButtonPressed
                bottomConstraintButtonHandler(bottomConstraintButtonPressed)
            } label: {
                if bottomConstraintButtonPressed {
                    verticalLineImage()
                } else {
                    verticalLineImage()
                        .opacity(0.3)
                }
            }
            
            VStack(alignment: .trailing) {
                
                SpacingView(value: $bottomConstraintValue, numeric: true, placeholder: "bottom", dropDownList: decimalData)
                    .onChange(of: bottomConstraintValue, perform: bottomConstraintValueChanged)
                SpacingView(value: $bottomConstraintView, numeric: false, placeholder: "view", dropDownList: viewData)
                    .onChange(of: bottomConstraintView, perform: bottomConstraintViewChanged)
                SpacingView(value: $bottomConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraintData)
                    .onChange(of: bottomConstraintEdge, perform: bottomConstraintEdgeChanged)
                               
            }.frame(minWidth: 50, maxWidth: 70, minHeight: 20, maxHeight: 60)
        }
    }
    
    func verticalLineImage() -> some View {
        return Image(systemName: "line.diagonal")
            .resizable()
            .frame(width: 10.0, height: 28.0)
            .rotationEffect(Angle(degrees: -19))
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.red)
        
    }
    
    func horizLineImage() -> some View {
        return Image(systemName: "line.diagonal")
            .resizable()
            .frame(width: 28.0, height: 10.0)
            .rotationEffect(Angle(degrees: 19))
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.red)
        
    }
}

@available(iOS 14.0.0, *)
struct ConstraintView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                ContentView()
                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
            ContentView()
        }
    }
}

