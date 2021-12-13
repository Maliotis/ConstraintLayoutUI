//
//  SpacingView.swift
//  DemoSwiftUI
//
//  Created by petros maliotis on 06/12/2021.
//

import SwiftUI



@available(iOS 14.0, *)
struct SpacingView: View {
    
    @State var value: String = ""
    var numeric = false
    var placeholder = ""
    var dropDownList: [String] = createDecimalData()
        var body: some View {
            
            HStack(alignment: .center, spacing: 0) {
                if numeric {
                    NumericTextField(value: $value, placeholder: self.placeholder)
                        .font(.system(size: 10))
                        .multilineTextAlignment(.trailing)
//                        .background(Color.red)
                        .frame(width: 24)
                        .padding(.trailing, 3)
                    
                    Menu {
                        ForEach(dropDownList, id: \.self){ client in
                            Button(client) {
                                self.value = client
                            }
                        }
                    } label: {
                        Image(systemName: "chevron.down")
                            //.padding(1)
                            .foregroundColor(Color.blue)
                            .font(Font.system(size: 10, weight: .bold))
//                            .frame(width: 13, height: 13)
                        
                        
                    }
//                    .background(Color.cyan)
                } else {
                    getMenu()
                }
                                                        
            }.frame(height: 12)
            
        }
    
    func getMenu() -> some View {
        return Menu {
            ForEach(dropDownList, id: \.self){ client in
                Button(client) {
                    self.value = client
                }
            }
        } label: {
            HStack(alignment: .center, spacing: 0) {
                Text(value)
                    .foregroundColor(Color.black)
                    .font(.system(size: 10))
                    .multilineTextAlignment(.trailing)
                    .frame(width: 40)
                    .padding(0)
                    .fixedSize(horizontal: true, vertical: true)
//                    .background(Color.red)
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.blue)
                    .font(Font.system(size: 10, weight: .bold))
                    //.frame(width: 10, height: 10)
//                    .background(Color.cyan)
            }.multilineTextAlignment(.trailing)
        }
    }
}

@available(iOS 14.0, *)
struct SpacingView_Previews: PreviewProvider {    
    static var previews: some View {
        SpacingView()
    }
}
