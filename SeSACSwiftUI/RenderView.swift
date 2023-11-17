//
//  RenderView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/13/23.
//

import SwiftUI

extension EnvironmentValues {
    public var item: Int {
        return 1
    }
}

struct RenderView: View {
    
    @Environment(\.item) var item
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    
    @State private var age: Int = 10
    
    init(age: Int = 10) {
        self.age = age
        print(self)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(
                            colors: [.red, .black],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )).frame(width: 100, height: 100)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(AngularGradient(
                            colors: [.yellow, .blue],
                            center: .leading,
                            angle: .degrees(100)
                        )).frame(width: 100, height: 100)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(RadialGradient(
                            colors: [.purple, .green],
                            center: .center,
                            startRadius: 0,
                            endRadius: 50
                        )).frame(width: 100, height: 100)
                }
                .padding([.bottom], 30)
                
                Text("hue age: \(age)!")
                Text("Hello, World!, \(Int.random(in: 1...100))")
                Text("Hello, World!")
                Text("Hello, World!")
                
                bran
                
                NavigationLink("push") {
                    TamagotchiView()
                }
                
                Button("클릭") {
    
                }
            }
            .navigationTitle("sf")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("sfs")
                }
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
