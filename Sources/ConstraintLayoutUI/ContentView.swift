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
    
    //
    public var paddingForHorizontalDropDowns: CGFloat = 3.5
    
    // data - overwrite the demo values
    @EnvironmentObject public var dataStore: DataStore
//    @Published public var constraintData: [String] = createConstraintData()
//    @Published public var viewData = createViewData()
//    @Published public var decimalData = createDecimalData()
    
    public var body: some View {
        VStack(alignment: .center, spacing: 2) {
            
            VStack(alignment: .trailing) {
                SpacingView(value: "top", numeric: false, placeholder: "constraint", dropDownList: dataStore.constraintData)
                SpacingView(value: "parent", numeric: false, placeholder: "view", dropDownList: dataStore.viewData)
                SpacingView(value: "0", numeric: true, placeholder: "Top", dropDownList: dataStore.decimalData)
                                    
                
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
                SpacingView(value: "left", numeric: false, placeholder: "constraint", dropDownList: dataStore.constraintData)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                SpacingView(value: "parent", numeric: false, placeholder: "view", dropDownList: dataStore.viewData)
                    .padding([.leading], paddingForHorizontalDropDowns)
                SpacingView(value: "0", numeric: true, placeholder: "left", dropDownList: dataStore.decimalData)
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
                
                SpacingView(value: "0", numeric: true, placeholder: "right", dropDownList: dataStore.decimalData)
                
                SpacingView(value: "parent", numeric: false, placeholder: "view", dropDownList: dataStore.viewData)
                    .padding([.leading, .trailing], paddingForHorizontalDropDowns)
                
                SpacingView(value: "right", numeric: false, placeholder: "constraint", dropDownList: dataStore.constraintData)
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
                
                SpacingView(value: "0", numeric: true, placeholder: "bottom", dropDownList: dataStore.decimalData)
                SpacingView(value: "parent", numeric: false, placeholder: "view", dropDownList: dataStore.viewData)
                SpacingView(value: "bottom", numeric: false, placeholder: "constraint", dropDownList: dataStore.constraintData)
                               
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

