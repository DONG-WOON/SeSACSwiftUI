//
//  PosterView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/15/23.
//

import SwiftUI

struct PosterView: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            LazyVStack {
                ForEach(0..<100) { item in
                   AsyncImageView()
                        .onAppear {
                            print(item)
                        }
                }
            }
        }
    }
}

struct AsyncImageView: View {
    
    let url = URL(string: "https://picsum.photos/100")
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
        } placeholder: {
//            Image(systemName: "star")
            ProgressView()
        }
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                
            case .success(let image):
                image
                
            case .failure(let error):
                ProgressView()
            }
        }
        
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView()
    }
}
