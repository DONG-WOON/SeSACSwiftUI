//
//  MyView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/13/23.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 30)
            
            HStack(spacing: 10) {
                RoundButton(
                    text: "토스뱅크",
                    imageName: "star"
                )
                RoundButton(
                    text: "토스증권",
                    imageName: "star"
                )
                RoundButton(
                    text: "고객센터",
                    imageName: "star"
                )
            }
            
            Spacer(minLength: 15)
            
            List {
                Section {
                    Label("보안과 인증", systemImage: "star")
                    Label("내 신용점수", systemImage: "star")
                    Label("보안과 인증", systemImage: "star")
                    Label("내 신용점수", systemImage: "star")
                    Label("보안과 인증", systemImage: "star")
                    Label("내 신용점수", systemImage: "star")
                    Label("보안과 인증", systemImage: "star")
                    Label("내 신용점수", systemImage: "star")
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

struct RoundButton: View {
    
    var text: String
    var imageName: String
    
    var body: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: imageName)
                    .padding(.bottom, 5)
                Text(text)
            }
        }
        .rounded()
    }
}

struct CustomRoundedRectangle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 15, trailing: 20))
            .background(.gray.opacity(0.1))
            .foregroundColor(.primary)
            .cornerRadius(10)
    }
}

extension View {
    func rounded() -> some View {
        modifier(CustomRoundedRectangle())
    }
}
