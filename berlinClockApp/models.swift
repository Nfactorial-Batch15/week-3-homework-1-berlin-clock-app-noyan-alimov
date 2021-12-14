//
//  models.swift
//  berlinClockApp
//
//  Created by Noyan Alimov on 14/12/2021.
//

import Foundation
import SwiftUI

enum AppColor {
    static var yellowOn = Color(red: 255/255, green: 204/255, blue: 0/255)
    static var yellowOff = Color(red: 255/255, green: 224/225, blue: 102/255)
    static var redOn = Color(red: 255/255, green: 59/255, blue: 48/255)
    static var redOff = Color(red: 255/255, green: 137/255, blue: 131/255)
    static var lightGray = Color(red: 0.949, green: 0.949, blue: 0.933)
    static var white = Color.white
}

struct FormattedTime {
    var hour: Int
    var minute: Int
}
