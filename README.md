# Heart Toggle
A custom heart-shaped toggle for marking favorites, built in SwiftUI. Tap the knob and it slides along the heart as it fills with red.

<div align="center">
  <img src="docs/demo.webp" width="300" alt="Tapping the knob so it slides across the heart, which turns red and then back to gray" />
</div>

### It's all in the details:
- The knob doesn't move in a straight line. It follows a "V" from the top-left lobe, down through the bottom point and up to the top-right lobe, tracing the shape of the heart.
- The knob's shadow travels with it, because its position is animatable data and the shape is redrawn on every frame.
- A custom button style removes the default press dimming, so the knob stays solid white as it moves.

### Tools and Frameworks used:
- SwiftUI
- Custom Shapes
- Animatable Data
- Custom Button Styles
- SF Symbols

### Requirements
- iOS 18.1 or later
- Xcode 16.1 or later
