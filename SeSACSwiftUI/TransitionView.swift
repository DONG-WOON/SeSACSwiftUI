//
//  TransitionView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/16/23.
//

import SwiftUI

struct TransitionView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dismiss) private var dismiss
    
    @State private var isFull = false
    @State private var isSheet = false
    
    init(isFull: Bool = false, isSheet: Bool = false) {
        self.isFull = isFull
        self.isSheet = isSheet
        print(self)
    }
    
    var body: some View {
        NavigationView {
            HStack(spacing: 20) {
                Button("Full") {
                    isFull.toggle()
                }
                Button("Sheet") {
                    isSheet = true
                }
                NavigationLink("Push") {
                    NavigationLazyView(RenderView())
                }
                NavigationLink("Push") {
                    NavigationLazyView2 {
                        RenderView()
                    }
                }
            }
            .sheet(isPresented: $isSheet) {
                RenderView()
            }
            .fullScreenCover(isPresented: $isFull) {
                RenderView()
            }
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
