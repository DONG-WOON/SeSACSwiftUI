//
//  DummyView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/14/23.
//

import SwiftUI

struct DummyView: View {
    
    @State private var isPresented = false
    private var datas = [Int]()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Circle()
                    .frame(width: 100, height: 100)
                Button {
                    isPresented = true
                } label: {
                    Text("SHOW")
                }
                Spacer(minLength: 20)
                HStack(spacing: 20) {
                            
                    Image("dummy")
                        .resizable()
                        .border(.red, width: 1)
                    
                        .aspectRatio(1, contentMode: .fit)
                    Image("dummy")
                        .resizable()
                        .border(.red, width: 1)
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image("dummy")
                        .resizable()
                        .border(.red, width: 1)
                        .aspectRatio(1, contentMode: .fit)
                }
                .padding(20)
            }
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            TamagotchiView()
        })
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
