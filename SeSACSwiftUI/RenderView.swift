//
//  RenderView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/13/23.
//

import SwiftUI

struct RenderView: View {
    
    @State var age: Int = 10
    
    var body: some View {
        VStack {
            Text("hue age: \(age)!")
            Text("Hello, World!, \(Int.random(in: 1...100))")
            Text("Hello, World!")
            Text("Hello, World!")
            bran
            
            Button("클릭") {
                age = Int.random(in: 1...100)
            }
        }
    }
    
    var bran: some View {
        Text("Bran")
    }
}

struct RenderView_Previews: PreviewProvider {
    static var previews: some View {
        RenderView()
    }
}
