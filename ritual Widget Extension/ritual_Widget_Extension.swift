//
//  ritual_Widget_Extension.swift
//  ritual Widget Extension
//
//  Created by Sidhant Gandhi on 12/9/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct ritual_Widget_ExtensionEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CompactQuestionCard(text: QuestionData().questions.randomElement() ?? "Could not load question.", color: ColorPalatte().generated(count: 1).first ?? .black, radius: 0.0)
    }
}

@main
struct ritual_Widget_Extension: Widget {
    let kind: String = "ritual_Widget_Extension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ritual_Widget_ExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("Random Question")
        .description("A random question from Ritual at a glance.")
    }
}

struct ritual_Widget_Extension_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ritual_Widget_ExtensionEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            ritual_Widget_ExtensionEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            ritual_Widget_ExtensionEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
