//
//  QuestionCard.swift
//  ritual
//
//  Created by Sidhant Gandhi on 12/9/20.
//

import SwiftUI

struct QuestionCard: View {
    var text: String
    var index: Int
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                .foregroundColor(color)
            VStack {
                Group {
                    CardNumber(index: index)
                    CardText(text: text)
                }
                .rotationEffect(.degrees(180))
                Spacer()
                Rectangle()
                    .frame(width: 45, height: 1)
                    .foregroundColor(.init(.sRGB, white: 1, opacity: 0.2))
                Spacer()
                CardText(text: text)
                CardNumber(index: index)
                Spacer().frame(height: 20)
            }
        }
    }
}

struct CompactQuestionCard: View {
    var text: String
    var color: Color
    var radius: CGFloat = 25.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .foregroundColor(color)
            VStack {
                CardText(text: text)
            }
        }
    }
}

struct CardNumber: View {
    var index: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 45, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(String(index + 1))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct CardText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundColor(.white)
            .minimumScaleFactor(0.3)
    }
}


struct QuestionCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuestionCard(text: "Test question", index: 1, color: .pink)
            CompactQuestionCard(text: "Test question compact", color: .green)
        }
    }
}
