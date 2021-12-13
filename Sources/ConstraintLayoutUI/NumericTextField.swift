//
//  FloTextField.swift
//  DemoSwiftUI
//
//  Created by petros maliotis on 06/12/2021.
//

import SwiftUI
import Combine

@available(iOS 14.0, *)
struct NumericTextField: View {
    @Binding var value: String
    var numeric = false
    var placeholder = ""
    var body: some View {
        TextField(placeholder, text: $value)
            .keyboardType(.decimalPad)
            .onReceive(Just(value)) { newValue in
                if newValue.isNumeric {
                    self.value = newValue
                } else {
                    self.value = String(self.value.dropLast())
                }
            }
    }
}

//struct NumericTextField_Previews: PreviewProvider {
//    //@State var test = "0"
//    static var previews: some View {
//        //NumericTextField(value: $test)
//    }
//}
