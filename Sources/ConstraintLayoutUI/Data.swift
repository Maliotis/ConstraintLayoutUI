//
//  Data.swift
//  DemoSwiftUI
//
//  Created by petros maliotis on 06/12/2021.
//

import Foundation

func createDecimalData() -> [String] {
    var dropDownList = [String]()
    for i in stride(from: 0, to: 100, by: 0.5) {
        dropDownList.append("\(i.rounded(toPlaces: 1))")
    }
    return dropDownList
}

func createViewData() -> [String] {
    let dropDownList = ["parent", "leftButton", "rightLabel", "topImageView", "bottomStepper"]
    return dropDownList
}

func createConstraintData() -> [String] {
    let dropDownList = ["top", "left", "right", "bottom"]
    return dropDownList
}

func toString(value: String) -> String {
    let result = Int(value) ?? 0
    return "\(result)"
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
            let divisor = pow(10.0, Double(places))
            return (self * divisor).rounded() / divisor
    }
}

func numericValidator(oldValue: String, newValue: String) -> String {
    if newValue.range(of: "^\\d+$", options: .regularExpression) != nil {
        return newValue
    } else if !oldValue.isEmpty {
        return String(newValue.prefix(oldValue.count - 1))
    }
    return ""
}

extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        return Set(self).isSubset(of: nums)
    }
}
