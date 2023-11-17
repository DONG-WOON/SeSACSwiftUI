//
//  SearchView.swift
//  SeSACSwiftUI
//
//  Created by 서동운 on 11/16/23.
//

import SwiftUI

struct SearchView1: View {

    @State private var randomNumber = 0

    init(randomNumber: Int = 0) {
        self.randomNumber = randomNumber
        print("search")
    }

    // MARK: 연산 프로퍼티는 메모리에 올라가지 않는다
    var body: some View {
        VStack(spacing: 10) {
            SomeView()
            jackView
            kokoView()
            Text("bran \(randomNumber)")
            Button("클릭") {
                randomNumber = Int.random(in: 1...10)
            }
        }
        .font(.largeTitle)
    }

    var jackView: some View {
        Text("jack")
            .background(Color.random())
    }

    func kokoView() -> some View {
        Text("koko")
            .background(Color.random())
    }
}

struct Movie: Hashable, Identifiable {
    
    let id: UUID
    let name: String
    let category: Category
    let color: Color
    
    init(id: UUID = UUID(), name: String, category: Category, color: Color = .random()) {
        self.id = id
        self.name = name
        self.category = category
        self.color = color
    }
    
    enum Category: String {
        case 액션
        case 로맨스
        case 코미디
        case SF
    }
}

struct SearchView: View {
    
    @State var text: String = ""
    @State var isPresented: Bool = false
    
    private let movies = [
        Movie(name: "A", category: .로맨스),
        Movie(name: "해리포터", category: .SF),
        Movie(name: "어벤져스", category: .SF),
        Movie(name: "분노의 질주", category: .액션),
        Movie(name: "아이언맨", category: .액션)
    ]
    
    private var filteredMovies: [Movie] {
        return text.isEmpty ? movies : movies.filter { $0.name.contains(text) }
    }
   
    var body: some View {
        
        NavigationStack {
            LazyVStack(alignment: .leading, spacing: 10.0) {
                ForEach(filteredMovies, id: \.self) { item in
                    NavigationLink(value: item) {
                        HStack {
                            Circle()
                                .foregroundColor(item.color)
                            Text(item.name)
                        }
                        .frame(height: 60)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .padding(20)
                    }
                }
                .navigationDestination(for: Movie.self) { item in
                    NavigationLazyView(SearchDetailView(title: item.name))
                }
            }
            .padding([.horizontal], 20)
            .navigationTitle("검색")
        }
        .foregroundColor(.black)
        .searchable(text: $text, placement: .navigationBarDrawer, prompt: Text("입력하이소"))
        
        
        NavigationView {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(filteredMovies, id: \.self) { item in
                    NavigationLink {
                        NavigationLazyView(SearchDetailView(title: item.name))
                    } label: {
                        HStack {
                            Circle()
                                .foregroundColor(item.color)
                            Text(item.name)
                        }
                        .frame(height: 60)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                }
            }
            .padding([.horizontal], 20)
            .navigationTitle("검색")
        }
        .foregroundColor(.black)
        .searchable(text: $text, placement: .navigationBarDrawer, prompt: Text("입력하이소"))
        .onSubmit {
            print("sefsefsefsef")
        }
    }
}

struct SearchDetailView: View {
    
    var title: String
    
    var body: some View {
        
        Button {
            print("머")
        } label: {
            HStack {
                Image(systemName: "star")
                Text(title)
                Image(systemName: "star")
            }
        }
        .font(.largeTitle)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView1()
    }
}

struct Some2View: View {
    
    init() {
        print("hue is init")
    }
    
    var body: some View {
        Text("hue")
            .background(Color.random())
            .onAppear {
                print("body reload")
            }
    }
}

struct SomeView: View {

    @State var color = Color.random()
    
    @State var number1 = 1
    var number2 = 2
    
    init() {
        print("hue is init")
    }
    
    var body: some View {
        Text("hue")
            .background(Color.random())
            .onAppear {
                print("body reload")
            }
        Button("눌러봐") {
            number1 = 3
        }
    }
    
    // MARK: 초기화 구문은 여러번 실행되지만 var body는 여러번 실행하지않는다.
}



extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
