//
//  ContentView.swift
//  berlinClockApp
//
//  Created by Noyan Alimov on 14/12/2021.
//

import SwiftUI



struct ContentView: View {
    @State var time = Date()
    @State var formattedTime = FormattedTime(hour: 0, minute: 0)
    
    @State var secondsLamp: String = "Y"
    @State var fiveHourRow: String = "YYYY"
    @State var singleHourRow: String = "YYYY"
    @State var fiveMinuteRow: String = "YYYYYYYYYYY"
    @State var singleMinuteRow: String = "YYYY"
    
    var body: some View {
        ZStack {
            AppColor.lightGray
            VStack {
                Text("Time is \(formattedTime.hour):\(formattedTime.minute)")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                
                ZStack {
                    AppColor.white
                    VStack(alignment: .center, spacing: 20) {
                        Circle()
                            .fill(secondsLamp == "Y" ? AppColor.yellowOn : AppColor.yellowOff)
                            .frame(width: 56, height: 56, alignment: .center)
                        
                        HStack {
                            ForEach(Array(fiveHourRow), id: \.self) { hour in
                                if hour == "Y" {
                                    CustomRectangle(color: AppColor.redOn)
                                } else {
                                    CustomRectangle(color: AppColor.redOff)
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(Array(singleHourRow), id: \.self) { hour in
                                if hour == "Y" {
                                    CustomRectangle(color: AppColor.redOn)
                                } else {
                                    CustomRectangle(color: AppColor.redOff)
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(Array(fiveMinuteRow), id: \.self) { hour in
                                if hour == "Y" {
                                    CustomVerticalRectangle(color: AppColor.redOn)
                                } else {
                                    CustomVerticalRectangle(color: AppColor.redOff)
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(Array(singleMinuteRow), id: \.self) { hour in
                                if hour == "Y" {
                                    CustomRectangle(color: AppColor.yellowOn)
                                } else {
                                    CustomRectangle(color: AppColor.yellowOff)
                                }
                            }
                        }
                    }
                }
                    .frame(width: 358, height: 312, alignment: .center)
                    .cornerRadius(15)
                
                ZStack {
                    AppColor.white
                    HStack {
                        DatePicker(selection: $time, displayedComponents: .hourAndMinute) {
                            Text("Insert time")
                        }
                            .environment(\.locale, Locale(identifier: "ru_RU"))
                            .onChange(of: time) { _ in
                                self.updateState()
                            }
                    }
                        .padding(.horizontal)
                }
                    .frame(width: 358, height: 54, alignment: .center)
                    .cornerRadius(15)
                
                Spacer()
            }
                .padding(.top, 50)
        }
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                self.updateState()
            })
    }
    
    func updateState() {
        self.formattedTime = getFormattedTime(date: self.time)
        self.fiveHourRow = getFiveHourRow(hour: formattedTime.hour)
        self.singleHourRow = getSingleHourRow(hour: formattedTime.hour)
        self.fiveMinuteRow = getFiveMinuteRow(minute: formattedTime.minute)
        self.singleMinuteRow = getSingleMinuteRow(minute: formattedTime.minute)
    }
}

struct CustomRectangle: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 74, height: 32, alignment: .center)
            .cornerRadius(4)
    }
}

struct CustomVerticalRectangle: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 21, height: 32, alignment: .center)
            .cornerRadius(2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
