//
//  Helper.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation

public struct Utils {
    public static func getReleaseDate(_ releaseDate: String) -> String {
        return releaseDate.changeDateFormat(from: "yyyy-MM-dd", to: "dd MMMM yyyy") ?? "-"
    }
    public static func roundToOneDecimal(_ num: Float) -> String {
        let number: Float = num
        let roundedNumber = Float(Int(number * 10)) / 10
        let formattedNumber = String(format: "%.1f", roundedNumber)
        return formattedNumber
    }
}
