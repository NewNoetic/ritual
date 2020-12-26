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
    @State var showAbout = false
    
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
                        self.showAbout = true
                    } label: {
                        Image(systemName: "info.circle")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .sheet(isPresented: $showAbout) {
                        AboutView()
                    }
                }
                .padding(.horizontal)
                #endif
                
                TabView(selection: $pageIndex) {
                    ForEach(questions.indices, id: \.self) { index in
                        #if os(iOS)
                        QuestionCard(text: questions[index], index: index, color: colors[index])
                            .padding(.horizontal)
                        #elseif os(watchOS)
                        CompactQuestionCard(text: questions[index], color: colors[index])
                        #endif
                    }
                }
                .padding(.bottom)
                .frame(width: geometry.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .tabViewStyle(PageTabViewStyle())
                .onTapGesture(count: 2) {
                    #if os(watchOS)
                    withAnimation {
                        pageIndex = 0
                    }
                    #endif
                }
            }
        }
        .onAppear {
            #if os(iOS)
            if CommandLine.arguments.contains("--showTaps") {
                ShowTaps.enabled = .debugOnly
            } else {
                ShowTaps.enabled = .never
            }
            #endif
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
