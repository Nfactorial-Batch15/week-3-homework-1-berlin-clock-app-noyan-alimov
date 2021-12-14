//
//  functions.swift
//  berlinClockApp
//
//  Created by Noyan Alimov on 14/12/2021.
//

import Foundation

func generate(symbol: String, count: Int) -> String {
    if count == 0 {
        return ""
    } else if count == 1 {
        return symbol
    }
    
    var output = ""
    for _ in 1...count {
        output += symbol
    }
    return output
}

func getSingleMinuteRow(minute: Int) -> String {
    let remainder = minute % 5
    
    let remainderYs = generate(symbol: "Y", count: remainder)
    let remainderNs = generate(symbol: "N", count: 4 - remainder)
    
    return remainderYs + remainderNs
}

func getFiveMinuteRow(minute: Int) -> String {
    let notRemainder = minute / 5
    
    let notRemainderYs = generate(symbol: "Y", count: notRemainder)
    let notRemainderNs = generate(symbol: "N", count: 11 - notRemainder)
    
    return notRemainderYs + notRemainderNs
}

func getSingleHourRow(hour: Int) -> String {
    let remainder = hour % 5

    let remainderYs = generate(symbol: "Y", count: remainder)
    let remainderNs = generate(symbol: "N", count: 4 - remainder)
    
    return remainderYs + remainderNs
}

func getFiveHourRow(hour: Int) -> String {
    let notRemainder = hour / 5
    
    let notRemainderYs = generate(symbol: "Y", count: notRemainder)
    let notRemainderNs = generate(symbol: "N", count: 4 - notRemainder)
    
    return notRemainderYs + notRemainderNs
}

func getSecondsLamp(seconds: Int) -> String {
    let isEven = seconds % 2 == 0
    return isEven ? "Y" : "N"
}

func getFormattedTime(date: Date) -> FormattedTime {
    var calendar = Calendar.current

    if let timeZone = TimeZone(identifier: "Asia/Almaty") {
       calendar.timeZone = timeZone
    }

    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)

    return FormattedTime(hour: hour, minute: minute)
}
