//
//  ContentView.swift
//  BouncyCountdown
//
//  Created by usagimaru on 2023/08/15.
//
//  https://developer.apple.com/documentation/swiftui/contenttransition/numerictext(countsdown:)?changes=_6
//  https://apoorv487.medium.com/create-24-hour-countdown-timer-using-swiftui-fd84a66764e7
//  https://github.com/apoorv487/SwiftUI/blob/main/CountdownTimer/CountdownTimer/TimerView.swift

import SwiftUI

struct CountdownView: View {
	@State var count: Int = 0
	@State var timeRemaining = 24*60*60 + 3
	
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	var someNumberProxy: Binding<String> {
		Binding<String>(
			get: { String(format: "%d", count) },
			set: {
				if let value = NumberFormatter().number(from: $0) {
					count = value.intValue
				}
			}
		)
	}
	
	func timeString(time: Int) -> String {
		let hours   = Int(time) / 3600
		let minutes = Int(time) / 60 % 60
		let seconds = Int(time) % 60
		return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
	}
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				Spacer()
				Text(timeString(time: timeRemaining))
					.font(
						.system(size: 28, weight: .semibold, design: .rounded)
						.monospacedDigit()
					)
					.padding()
					.background(.white)
					.cornerRadius(15)
					.contentTransition(.numericText(countsDown: true))
					.onReceive(timer){ _ in
						withAnimation(.smooth) {
							if self.timeRemaining > 0 {
								self.timeRemaining -= 1
							}else{
								self.timer.upstream.connect().cancel()
							}
						}
					}
				Spacer()
			}
			Spacer()
		}
		.ignoresSafeArea()
		.background(Color(.systemGray5))
	}
}

#Preview {
	CountdownView()
}
