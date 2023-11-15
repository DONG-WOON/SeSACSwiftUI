//
//  TamagotchiView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/14/23.
//

import SwiftUI

struct Person {
    var name: String = "ㄴㅇㄹ"
    
    var introduce: String {
        return "안녕하소"
    }
    
    mutating func changeName() {
        name = "sef"
    }
}


// MARK: @State: SOT(Source Of Truth, View에 대한 상태를 저장하기 위한 목적)
// MARK: private keyword를 붙인다

struct TamagotchiView: View {
    
    var name: String?
    
    @State private var totalRiceCount: Int = 0
    @State private var totalWaterCount: Int = 0
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
    
                HStack(alignment: .center) {
                    Toggle(isOn ? "스위치 On" : "스위치 Off", isOn: $isOn)
                        .padding(30)
                }
                
                EatingView(
                    category: "밥",
                    count: $totalRiceCount
                )
                .padding(.bottom, 20)
                
                EatingView(
                    category: "물",
                    count: $totalWaterCount
                )
            }
//            .background(Color.red)
        }
//        .background(Color.gray)
    }
}


// MARK: @Binding: Derived Value
struct EatingView: View {
    
    var category: String
    @Binding var count: Int
    
    var body: some View {
        HStack {
            Text("다마고치 \(category): \(count)")
                .padding(10)
                .foregroundColor(.init(uiColor: .label))
                .fontWeight(.bold)
                .font(.largeTitle)
            Button {
                count += 1
            } label: {
                Text("+").font(.largeTitle)
            }
            .foregroundColor(.white)
            .padding([.leading, .trailing], 20)
            .background(Color.gray)
            .background(in: Capsule())
            
            Button {
                if count > 0 {
                    count -= 1
                }
            } label: {
                Text("-").font(.largeTitle)
            }
            .foregroundColor(.white)
            .padding([.leading, .trailing], 20)
            .background(Color.gray)
            .background(in: Capsule())
        }
    }
}

struct TamagotchiView_Previews: PreviewProvider {
    static var previews: some View {
        TamagotchiView()
    }
}
