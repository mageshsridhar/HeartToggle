//
//  ContentView.swift
//  Heart Toggle
//
//  Created by Magesh Sridhar on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    /// Size of the frame the knob's V-shaped track is drawn in.
    private let trackSize: CGFloat = 82

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
                    HeartKnob(progress: toggle ? 0.995 : 0.005)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        .frame(width: trackSize, height: trackSize)
                }
                // The default style dims the button while pressed and fades it back,
                // which left the knob translucent as it moved.
                .buttonStyle(NoHighlightButtonStyle())
            }
            Spacer()
        }
    }
}

/// Shows the label unchanged while pressed, so the toggle animation is the only feedback.
struct NoHighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Keep the whole frame tappable, not just the knob.
            .contentShape(Rectangle())
    }
}

/// The toggle's white knob: a circle that slides along a "V" across the heart, from the
/// top-left lobe, down through the bottom point, up to the top-right lobe.
///
/// The knob's position is animatable data, so SwiftUI redraws it every frame and its shadow
/// moves with it. (Animating `trim` on a stroked path instead left the shadow behind at the
/// knob's starting point until the animation finished.)
struct HeartKnob: Shape {
    /// 0 is the start of the V (top-left), 1 the end (top-right).
    var progress: CGFloat

    /// Diameter of the knob.
    var diameter: CGFloat = 86

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: -4, y: 5)
        let bottom = CGPoint(x: rect.width / 2, y: rect.height - 20)
        let end = CGPoint(x: rect.width + 4, y: 5)

        // Both legs are the same length, so halfway along the V is the bottom point.
        let center = progress < 0.5
            ? interpolate(start, bottom, progress * 2)
            : interpolate(bottom, end, (progress - 0.5) * 2)

        return Path(ellipseIn: CGRect(x: center.x - diameter / 2, y: center.y - diameter / 2,
                                      width: diameter, height: diameter))
    }

    private func interpolate(_ a: CGPoint, _ b: CGPoint, _ t: CGFloat) -> CGPoint {
        CGPoint(x: a.x + (b.x - a.x) * t, y: a.y + (b.y - a.y) * t)
    }
}

#Preview {
    ContentView()
}
