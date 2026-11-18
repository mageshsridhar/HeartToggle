//
//  ContentView.swift
//  Heart Toggle
//
//  Created by Magesh Sridhar on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    /// Size of the white check-stroke frame drawn over the heart.
    private let strokeSize: CGFloat = 82

    @State private var toggle = false

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image(systemName: "heart.fill")
                    .font(.system(size: 200))
                    .foregroundStyle(toggle ? .red : Color(UIColor.systemGray6))
                Button(action: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        toggle.toggle()
                    }
                }) {
                    HeartStroke()
                        .trim(from: toggle ? 0.99 : 0, to: toggle ? 1 : 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 86, lineCap: .round, lineJoin: .round))
                        .fill(.white)
                        .frame(width: strokeSize, height: strokeSize)
                }
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            }
            Spacer()
        }
    }
}

/// A "V" that sweeps across the heart: from the top-left, down to the bottom point, up to the top-right.
struct HeartStroke: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: -4, y: 5))
            path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height - 20))
            path.addLine(to: CGPoint(x: rect.width + 4, y: 5))
        }
    }
}

#Preview {
    ContentView()
}
