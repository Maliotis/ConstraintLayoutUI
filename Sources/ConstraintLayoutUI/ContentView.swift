//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by petros maliotis on 06/12/2021.
//

import SwiftUI

@available(iOS 14.0, *)
public struct ContentView: View {
    
    @ObservedObject public var constraint: Constraint = Constraint()
        
    // Override this method to handle the buttons onClick
    public var topConstraintButtonHandler: (Bool) -> Void = {_ in }
        
    // Override this method to handle the buttons onClick
    public var leftConstraintButtonHandler: (Bool) -> Void = {_ in }
        
    // Override this method to handle the buttons onClick
    public var bottomConstraintButtonHandler: (Bool) -> Void = {_ in }
        
    // Override this method to handle the buttons onClick
    public var rightConstraintButtonHandler: (Bool) -> Void = {_ in }
    
    // add listeners for dropDown values change
            
    public var topConstraintValueChanged:(String) -> Void = {_ in }
        
    public var leftConstraintValueChanged:(String) -> Void = {_ in }
        
    public var rightConstraintValueChanged:(String) -> Void = {_ in }
        
    public var bottomConstraintValueChanged:(String) -> Void = {_ in }
    
    public var topConstraintViewChanged:(String) -> Void = {_ in }
    
    public var leftConstraintViewChanged:(String) -> Void = {_ in }
        
    public var rightConstraintViewChanged:(String) -> Void = {_ in }
        
    public var bottomConstraintViewChanged:(String) -> Void = {_ in }
        
    public var topConstraintEdgeChanged:(String) -> Void = {_ in }
        
    public var leftConstraintEdgeChanged:(String) -> Void = {_ in }
        
    public var rightConstraintEdgeChanged:(String) -> Void = {_ in }
        
    public var bottomConstraintEdgeChanged:(String) -> Void = {_ in }
    
    //
    public var paddingForHorizontalDropDowns: CGFloat = 3.5
    
    public var body: some View {
        VStack(alignment: .center, spacing: 2) {
            
            VStack(alignment: .trailing) {
                SpacingView(value: $constraint.topConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraint.constraintData).onChange(of: constraint.topConstraintEdge, perform: topConstraintEdgeChanged)
                SpacingView(value: $constraint.topConstraintView, numeric: false, placeholder: "view", dropDownList: constraint.viewData).onChange(of: constraint.topConstraintView, perform: topConstraintViewChanged)
                SpacingView(value: $constraint.topConstraintValue, numeric: true, placeholder: "Top", dropDownList: constraint.decimalData).onChange(of: constraint.topConstraintValue, perform: topConstraintValueChanged)
                
            }.frame(minWidth: 50, maxWidth: 70, minHeight: 20, maxHeight: 60)
            
            Button {
                constraint.topConstraintButtonPressed = !constraint.topConstraintButtonPressed
                topConstraintButtonHandler(constraint.topConstraintButtonPressed)
            } label: {
                if constraint.topConstraintButtonPressed {
                    verticalLineImage()
                } else {
                    verticalLineImage()
                        .opacity(0.3)
                }
            }
            
            HStack(alignment: .center, spacing: 2) {
//                Spacer(minLength: 4)
                SpacingView(value: $constraint.leftConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraint.constraintData)
                    .onChange(of: constraint.leftConstraintEdge, perform: leftConstraintEdgeChanged)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                SpacingView(value: $constraint.leftConstraintView, numeric: false, placeholder: "view", dropDownList: constraint.viewData)
                    .onChange(of: constraint.leftConstraintView, perform: leftConstraintViewChanged)
                    .padding([.leading], paddingForHorizontalDropDowns)
                SpacingView(value: $constraint.leftConstraintValue, numeric: true, placeholder: "left", dropDownList: constraint.decimalData)
                    .onChange(of: constraint.leftConstraintValue, perform: leftConstraintValueChanged)
                    .padding(.trailing, 7)
                Button {
                    constraint.leftConstraintButtonPressed = !constraint.leftConstraintButtonPressed
                    leftConstraintButtonHandler(constraint.leftConstraintButtonPressed)
                } label: {
                    if constraint.leftConstraintButtonPressed {
                        horizLineImage()
                    } else {
                        horizLineImage()
                            .opacity(0.3)
                    }
                }
                
                Image(systemName: "square")
                
                Button {
                    constraint.rightConstraintButtonPressed = !constraint.rightConstraintButtonPressed
                    rightConstraintButtonHandler(constraint.rightConstraintButtonPressed)
                } label: {
                    if constraint.rightConstraintButtonPressed {
                        horizLineImage()
                    } else {
                        horizLineImage()
                            .opacity(0.3)
                    }
                }
                
                SpacingView(value: $constraint.rightConstraintValue, numeric: true, placeholder: "right", dropDownList: constraint.decimalData)
                    .onChange(of: constraint.rightConstraintValue, perform: rightConstraintValueChanged)
                
                SpacingView(value: $constraint.rightConstraintView, numeric: false, placeholder: "view", dropDownList: constraint.viewData)
                    .onChange(of: constraint.rightConstraintView, perform: rightConstraintViewChanged)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                
                SpacingView(value: $constraint.rightConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraint.constraintData)
                    .onChange(of: constraint.rightConstraintEdge, perform: rightConstraintEdgeChanged)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                Spacer()
                    .frame(width: 1, height: 10)
                
            }
//            .fixedSize(horizontal: true, vertical: false)
            .frame(minWidth: 50, maxWidth: 440, minHeight: 20, maxHeight: 22)
            
            Button {
                constraint.bottomConstraintButtonPressed = !constraint.bottomConstraintButtonPressed
                bottomConstraintButtonHandler(constraint.bottomConstraintButtonPressed)
            } label: {
                if constraint.bottomConstraintButtonPressed {
                    verticalLineImage()
                } else {
                    verticalLineImage()
                        .opacity(0.3)
                }
            }
            
            VStack(alignment: .trailing) {
                
                SpacingView(value: $constraint.bottomConstraintValue, numeric: true, placeholder: "bottom", dropDownList: constraint.decimalData)
                    .onChange(of: constraint.bottomConstraintValue, perform: bottomConstraintValueChanged)
                SpacingView(value: $constraint.bottomConstraintView, numeric: false, placeholder: "view", dropDownList: constraint.viewData)
                    .onChange(of: constraint.bottomConstraintView, perform: bottomConstraintViewChanged)
                SpacingView(value: $constraint.bottomConstraintEdge, numeric: false, placeholder: "constraint", dropDownList: constraint.constraintData)
                    .onChange(of: constraint.bottomConstraintEdge, perform: bottomConstraintEdgeChanged)
                               
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

