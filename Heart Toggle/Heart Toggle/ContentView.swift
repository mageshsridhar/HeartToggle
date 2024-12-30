//
//  ContentView.swift
//  Heart Toggle
//
//  Created by Magesh Sridhar on 12/29/24.
//

import SwiftUI
let width : CGFloat = 82.0
let height : CGFloat = 82.0
struct ContentView: View {
    @State private var toggle = false
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image(systemName: "heart.fill")
                    .font(.system(size: 200))
                    .foregroundColor(toggle ? .red : Color(UIColor.systemGray6))
                Button(action: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        toggle.toggle()
                    }
                }) {
                    HeartStroke()
                        .trim(from: toggle ? 0.99 : 0, to: toggle ? 1 : 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 86, lineCap: .round, lineJoin: .round))
                        .fill(.white)
                        
                        .frame(width: width, height: height)
                }.shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            }
            Spacer()
        }
    }
}

struct HeartStroke: Shape {
    func path(in rect: CGRect) -> Path {
        let path =

        Path { path in
            path.move(to: CGPoint(x: -4, y: 5))
            path.addLine(to: CGPoint(x: width / 2 , y: height - 20))
            path.addLine(to: CGPoint(x: height + 4, y: 5))
        }
        return path
    }
}

#Preview {
    ContentView()
}
