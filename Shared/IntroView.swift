//
//  IntroView.swift
//  ritual
//
//  Created by Sidhant Gandhi on 12/15/20.
//  Copyright © 2020 newnoetic. All rights reserved.
//

import SwiftUI

struct IntroView: View {
    var pages = [
        PageViewData(title: "Welcome to Ritual", subtitle: "Many people find it hard to have deep meaningful conversation these days and end up having superficial relationships with friends.", color: Color.white, background: MainView.accentColor, emoji: "👋"),
        PageViewData(title: "Feel closer to your friends", subtitle: "Ritual is an ever changing curated list of questions to spark meaningful conversations and strengthen relationships over time.", color: Color.white, background: Color.blue, emoji: "👯"),
        PageViewData(title: "Batteries included", subtitle: "The first deck of questions is free. More decks will be available for in app purchase.", color: Color.white, background: Color.green, emoji: "❓")
    ]
    
    @State var pageIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            PageContainerView(pages: pages, index: $pageIndex)
            if (self.pageIndex + 1 >= pages.count) {
                Button(action: {
                    AppState.shared.startView = .ritual1
                }) {
                    Text("Done")
                }
                .buttonStyle(BlockButton(background: .white, foreground: .accentColor))
                .padding()
                .accessibility(identifier: "intro done")
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

