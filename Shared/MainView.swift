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
            VStack {
                #if os(iOS)
                HStack {
                    Button {
                        withAnimation {
                            pageIndex = 0
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                    Button {

                    } label: {
                        Image(systemName: "info.circle")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding(.horizontal)
                .padding(.top, -10)
                #endif
                
                TabView(selection: $pageIndex) {
                    ForEach(questions.indices, id: \.self) { index in
                        QuestionCard(text: questions[index], index: index, color: colors[index])
                    }
                }
                .frame(width: geometry.size.width, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .tabViewStyle(PageTabViewStyle())
                .contextMenu {
                    #if os(watchOS)
                    Button {
                        withAnimation {
                            pageIndex = 0
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    #endif
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .preferredColorScheme(.light)
                
            MainView()
                .preferredColorScheme(.dark)
                
        }
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
                #if os(iOS)
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
                #endif
                CardText(text: text)
                #if os(iOS)
                CardNumber(index: index)
                Spacer().frame(height: 20)
                #endif
            }
        }
        .padding(.horizontal)
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
            .padding(.horizontal)
            .foregroundColor(.white)
            .minimumScaleFactor(0.3)
    }
}
