//
//  Tweeted.swift
//  BouncyCountdown
//
//  Created by usagimaru on 2023/08/15.
//

import SwiftUI

struct TweetCounterView: View {
	@State var count: Int = 0
	
	let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
		
	var font: Font {
		.system(size: fontSize, weight: .semibold, design: .rounded)
		.monospacedDigit()
	}
	
	var startValue: Int = 1
	var fontSize: Double = 30
	var countingMax: Int = 40
	var symbolName: String = "square.dotted"
	var rotationDegree: Double = 0
	var tintColor: Color = Color(.systemGray)
	var textColor: Color = Color(.darkText)
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				HStack {
					Spacer()
					Image(systemName: symbolName)
						.foregroundColor(tintColor)
						.font(self.font)
						.rotationEffect(.degrees(rotationDegree))
					
					Text("\(count + startValue)")
						.font(self.font)
						.foregroundStyle(textColor)
						.contentTransition(.numericText(countsDown: true))
						.onReceive(timer){ _ in
							withAnimation() {
								if count + startValue > 0 {
									count += Int.random(in: 1..<countingMax)
								} else {
									timer.upstream.connect().cancel()
								}
							}
						}
					Spacer()
				}
				.padding()
				.background(.white)
			}
			
			Spacer()
		}
	}
}

#Preview {
	var heart = TweetCounterView()
	heart.symbolName = "heart.fill"
	heart.tintColor = .red
	heart.startValue = 812
	heart.countingMax = 80
	
	var retweet = TweetCounterView()
	retweet.symbolName = "arrow.2.squarepath"
	retweet.tintColor = .green
	retweet.startValue = 643
	retweet.countingMax = 40
	
	var mention = TweetCounterView()
	mention.symbolName = "bubble.left"
	mention.countingMax = 4
	
	var viewCount = TweetCounterView()
	viewCount.symbolName = "text.alignright"
	viewCount.rotationDegree = 90
	viewCount.startValue = 910
	viewCount.countingMax = 300
	
	return HStack(spacing: 0) {
		Spacer(minLength: 0)
		mention
		retweet
		heart
		viewCount
		Spacer(minLength: 50)
	}
	.ignoresSafeArea()
	.background(Color(.systemGray5))
	
}
