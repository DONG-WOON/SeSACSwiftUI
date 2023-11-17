//
//  ChartView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/17/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    let movies: [Movie]
    
    var chartTitle: some View {
        If(condition: colorScheme == .dark) {
            Text(colorScheme == .dark ? "차트" : "타타")
        } else: {
            Text(colorScheme == .dark ? "차트" : "타타")
        }
    }
    
    
    var body: some View {
        VStack {
            chartTitle
            Chart(movies, id: \.self) { item in
//                RectangleMark
//                LineMark
//                AreaMark
                BarMark(
                    x: .value("category", item.name),
                    y: .value("Value", item.count)
                )
            }
            .frame(height: 200)
        }
        .padding()
    }
    
//    @ViewBuilder
//    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
//        if condition {
//            transform(self)
//        } else {
//            self
//        }
//    }
}

struct If<Content: View>: View {
    
    let condition: Bool
    let trueView: () -> Content
    let falseView: () -> Content

    init(condition: Bool, _ `true`: @escaping () -> Content, `else`: @escaping () -> Content) {
        self.condition = condition
        self.trueView = `true`
        self.falseView = `else`
    }

    var body: some View {
        if condition {
            trueView()
        } else {
            falseView()
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(movies: [
            Movie(name: "sf", category: .SF),
            Movie(name: "ee", category: .SF),
            Movie(name: "sef", category: .SF)
        ])
    }
}
