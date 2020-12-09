//
//  AboutView.swift
//  ritual
//
//  Created by Sidhant Gandhi on 12/9/20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About \(Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.vertical)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
