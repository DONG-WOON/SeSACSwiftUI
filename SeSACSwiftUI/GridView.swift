//
//  GridView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/17/23.
//

import SwiftUI

struct GridView: View {
    
    @Binding var movie: [Movie]
    
    @State private var dummy = Array(1...100).map { "오늘의 영화 순위 \($0)" }
    
    var body: some View {
//        List {
//            ForEach(dummy, id: \.self) { item in
//                Text(item)
//            }
//        }
        ScrollView {
            LazyVGrid(columns: [
//                GridItem(.flexible(minimum: 90, maximum: 200)),
//                GridItem(.flexible(), spacing: 20),
//                GridItem(.flexible(), spacing: 20)
                 GridItem(.adaptive(minimum: 90), spacing: 20)
            ]) {
                ForEach(dummy, id: \.self) { item in
                    Text(item)
                        .background(Color.random())
                }
            }
        }
        .onAppear {
            dummy[0] = "듀듀듕"
            print("Appear")
        }
        .onDisappear {
            print("Disappear")
        }
        .task {
            await load()
        }
    }
    
    func load() async {
        print("async load")
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(movie: .constant([]))
    }
}
