//
//  NavigationLazyView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/16/23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: some View {
       build()
    }
}

struct NavigationLazyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLazyView(RenderView())
    }
}

struct NavigationLazyView2<Content: View>: View {
    
    @ViewBuilder let content: Content
    
    var body: some View {
       content
    }
}

struct NavigationLazyView2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLazyView2 {
            RenderView()
        }
    }
}
