//
//  MainView.swift
//  ritual
//
//  Created by Sidhant Gandhi on 11/28/20.
//

import SwiftUI

struct MainView: View {
    @State var pageIndex = 0
    @State var questions = QuestionData().questions
    @State var colors = ColorPalatte().generated(count: QuestionData().questions.count)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Button {
                    withAnimation {
                        pageIndex = 0
                    }
                } label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                .padding(.vertical, -10.0)
                .padding(.horizontal)
                TabView(selection: $pageIndex) {
                    ForEach(questions.indices, id: \.self) { index in
                        QuestionCard(text: questions[index], index: index, color: colors[index])
                    }
                }
                .frame(width: geometry.size.width, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct QuestionCard: View {
    var text: String
    var index: Int
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                .foregroundColor(color)
            VStack {
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
                Spacer()
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding(.all)
    }
}
