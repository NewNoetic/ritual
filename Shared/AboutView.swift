//
//  AboutView.swift
//  ritual
//
//  Created by Sidhant Gandhi on 12/9/20.
//

import SwiftUI

extension Bundle {
    var iconFileName: String? {
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last
        else { return nil }
        return iconFileName
    }
}

struct AppIcon: View {
    var body: some View {
        Bundle.main.iconFileName
            .flatMap { UIImage(named: $0) }
            .map { Image(uiImage: $0).cornerRadius(250) }
    }
}

struct AboutView: View {
    var appName = "Ritual" //Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
    var essayUrl = URL(string: "https://whatif.sg.life/the-experimental-generation-of-interpersonal-closeness")!
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 50) {
            Spacer()
            AppIcon()
            Text("About \(appName)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("\(appName) is based on the psychology study ") + Text("The Experimental Generation of Interpersonal Closeness: A Procedure and Some Preliminary Findings by Arthur Aron et al.").italic()
            Text("Questions asked during that study allowed researchers to control how close to one another two participants could get.")
            Button("↗ Learn more") {
                UIApplication.shared.open(essayUrl, options: [:])
            }
            Spacer()
        }
        .padding()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
