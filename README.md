# coderspace

A Flutter package that includes a set of reusable custom widgets to speed up your app development process with beautiful and consistent UI components.

## ✨ Other Useful Packages

Looking for more tools to speed up your Flutter development? Check out these packages:

1. [coderspace_network](https://pub.dev/packages/coderspace_network) – coderspace_network is a lightweight, developer-friendly Flutter package for making REST API calls using Dio. It provides clean, generic request handling, consistent error management, and simple utilities like auto-list parsing—all with minimal code.
2. [coderx](https://pub.dev/packages/coderx) – A lightweight and reactive state management system for Flutter. Easily manage global or local state, handle async states, computed values, and react to changes with builders, consumers, listeners, and observers — all with simple Dart classes.

## ✨ Widgets Included

- `CoderBar` – Simplified AppBar with style and configuration options.
- `CoderButton` – A modern, styled button with built-in customization.
- `CoderCard` – Pre-styled card widget to wrap your content.
- `CoderContainer` – A ready-to-use container with customizable styling.
- `CoderTextField` – A styled text field with configurable parameters.
- `CoderAutoScrollingImage` – An auto-scrolling image list (horizontal or vertical).
- `CoderAnimatedGradientBorder` - A glowing, animated gradient border that wraps any widget with smooth rotation, optional blur, and axis stretching.
- `CoderShakingIcon` - A reusable widget that applies a continuous shaking animation to any icon, SVG, or image asset. Fully customizable direction, speed, and size.
- `CoderCircularShake` - A widget that applies a fast circular shaking animation to its child. Ideal for attention-grabbing UI elements like badges, buttons, icons, or alerts.

## ✨ Animations Included

- `BounceTapAnimation` – Adds a bounce effect when tapping any widget. Great for interactive buttons and icons. Fully configurable scale and duration.
- `SlideFadeIn` – Smoothly slides and fades a widget into view from any direction. Ideal for onboarding steps, headers, or staggered lists.
- `StaggeredListItem` – A list item animation that slides and fades in based on its index. Perfect for ListView.builder or GridView.builder with cascading effects.
- `ShimmerPlaceholder` – Displays a shimmering skeleton loader with customizable colors, size, and border radius. Useful for loading states.
- `TypewriterText` – A typewriter-style text animation that types out letters one by one, with optional cursor, looping, and delay.
- `PulseEffect` – A continuous scaling pulse effect to draw attention to widgets like FABs, icons, or notifications. Configurable scale range and speed.
- `RevealAnimation` – A scale-based reveal effect to animate widgets into view with optional delay and curve control. Perfect for intros and highlights.
- `FlipCardAnimation` – Flips between front and back content with a 3D rotation animation. Supports horizontal or vertical flipping and tap-to-flip behavior.

## ✨ Extensions Included

- `showSnackBar()` – Show themed SnackBars easily via context.showSnackBar(), with support for types, icons, durations, and titles.
- `ContextExtensions` – Quickly access screen size, safe area insets, orientation, and theme mode using context.
- `AppStyles` – Get responsive text styles and scaling directly from context for spacing, buttons, and typography.
- `DateTimeExtensions` – Format dates and generate "time ago" strings like "2 hours ago" with simple .formattedDate and .timeAgo.

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  coderspace: ^latest_version
```

## 📖 Usage

### Widgets

#### 🧱 CoderBar - AppBar
A customizable AppBar widget to streamline your screen headers with built-in support for back navigation, styling, and layout control.
```dart
CoderBar(
  title: 'Page Title', // Title text of the AppBar
  icon: Icons.arrow_back_ios, // Custom back icon (default is arrow_back_rounded)
  backgroundColor: Colors.white, // Background color of the AppBar
  iconColor: Colors.black, // Color of the leading icon
  textColor: Colors.black, // Color of the title text
  elevation: 2, // Elevation/shadow below the AppBar
  toolbarHeight: 60, // Custom height of the AppBar
  titleSpacing: 16, // Spacing between title and leading icon
  titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // Custom style for title
  actions: [ // Optional trailing widgets (e.g., icons)
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
  isBack: true, // Whether to show the back button
  centerTitle: true, // Center-align the title text
  onBack: () => Navigator.pop(context), // Custom back button behavior
  forceMaterialTransparency: true, // Enables Material3-style transparency
  automaticallyImplyLeading: false, // If true, Flutter auto-adds back button based on route
  bottom: PreferredSize( // Optional widget below the AppBar (e.g., TabBar)
  preferredSize: Size.fromHeight(48),
  child: TabBar(tabs: [...]),
  ),
)
```

#### 🧱 CoderButton - Button
A customizable button with built-in loading state, icon support, and full styling control.
```dart
CoderButton(
  text: 'Submit', // ✅ Required: Button text label
  onPressed: () {
    // ✅ Required: Tap handler
  },
  backgroundColor: Colors.blue, // Optional: Background color of the button
  textColor: Colors.white, // Optional: Color of the button text
  height: 48, // Optional: Button height
  width: 200, // Optional: Button width
  radius: 12, // Optional: Uniform border radius (used if `borderRadius` is not set)
  borderRadius: BorderRadius.circular(16), // Optional: Custom border radius (overrides `radius`)
  paddingH: 16, // Optional: Horizontal padding inside the button
  paddingV: 12, // Optional: Vertical padding inside the button
  style: TextStyle(fontWeight: FontWeight.bold), // Optional: Custom text style
  isLoading: false, // Optional: Show loading spinner instead of text (disables button)
  icon: Icon(Icons.send, size: 20), // Optional: Icon shown before the text
)
```

#### 🧱 CoderCard - Card
A reusable, tappable card with leading/trailing widgets, title, subtitle, and optional divider.
```dart
CoderCard(
  leading: Icon(Icons.info_outline), // Optional: Widget shown at the start (e.g., icon/image)
  title: 'Card Title', // ✅ Required: Main title text
  subtitle: 'Optional subtitle text', // Optional: Smaller text under the title
  trailing: Icon(Icons.chevron_right), // Optional: Widget at the end (e.g., arrow icon)
  onTap: () {
    // Optional: Tap callback
  },
  backgroundColor: Colors.white, // Optional: Background color of the card
  padding: EdgeInsets.all(16), // Optional: Inner padding of the card (default is 16)
  borderRadius: 12, // Optional: Card corner radius (default is 12)
  showDivider: true, // Optional: Shows a divider below the subtitle
)
```

#### 🧱 CoderContainer - Container
A flexible container widget with built-in styling, padding, margin, alignment, and decoration support.
```dart
CoderContainer(
  child: Text('Hello Container'), // Optional: The child widget inside the container
  width: 200, // Optional: Width of the container
  height: 100, // Optional: Height of the container
  padding: EdgeInsets.all(16), // Optional: Inner padding (space inside the container)
  margin: EdgeInsets.symmetric(horizontal: 16), // Optional: Outer margin (space outside the container)
  alignment: Alignment.center, // Optional: Alignment of the child
  color: Colors.blue, // Optional: Background color (used if `decoration` is null)
  radius: 12, // Optional: Border radius (used if `decoration` is null)
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
  ), // Optional: Full custom decoration (overrides color & radius)
)
```

#### 🧱 CoderTextField - TextField
A styled text field with built-in support for hint text, icons, secure input, and formatting.
```dart
CoderTextField(
  controller: myController, // ✅ Required: Controller to manage text input
  hint: 'Enter your email', // Optional: Placeholder hint text
  prefixIcon: Icons.email, // Optional: Leading icon inside the text field
  suffixIcon: Icon(Icons.check), // Optional: Trailing widget (icon, button, etc.)
  obscureText: false, // Optional: Hides input (e.g., for passwords)
  keyboardType: TextInputType.emailAddress, // Optional: Input keyboard type
  inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))], // Optional: Format or restrict input
  maxLines: 1, // Optional: Number of lines (defaults to 1)
  enabled: true, // Optional: Enable/disable input (default: true)
  contentPadding: EdgeInsets.all(16), // Optional: Adjust inner padding
)
```

#### 🧱 CoderAutoScrollingImage - AutoScrollingImage
A widget that automatically scrolls a repeated image horizontally or vertically, great for animated backgrounds, banners, or texture effects.
```dart
CoderAutoScrollingImage(
  assetPath: 'assets/images/scroll_bg.png', // ✅ Required: Path to the local asset image
  axis: ScrollAxis.horizontal, // Optional: Direction of scroll (horizontal or vertical)
  scrollSpeed: 2.0, // Optional: Speed of the auto-scroll (default is 1.0)
  fit: BoxFit.cover, // Optional: Image fit (default is BoxFit.cover)
  repetitionCount: 10, // Optional: Number of times the image is repeated
  width: 200, // Optional: Width of each image (only for vertical scroll)
  height: 150, // Optional: Height of each image (only for horizontal scroll)
)
```

#### 🧱 CoderAnimatedGradientBorder - AnimatedGradientBorder
A glowing, animated gradient border that wraps any widget with smooth rotation, optional blur, and axis stretching.
```dart
CoderAnimatedGradientBorder(
  child: Text('Glowing Border'), // ✅ Required: The widget to wrap inside the border
  gradientColors: [Colors.purple, Colors.blue, Colors.cyan], // ✅ Required: Colors for animated gradient
  borderRadius: BorderRadius.circular(16), // ✅ Required: Corner radius of the border
  borderSize: 2.0, // Optional: Thickness of the visible border
  glowSize: 6.0, // Optional: Glow blur radius around the border
  animationTime: 3, // Optional: Time in seconds for one full rotation (default: 2)
  animationProgress: null, // Optional: Use to animate to specific point (0 to 1); if null, loops
  stretchAlongAxis: false, // Optional: Stretch the child widget along one axis
  stretchAxis: Axis.horizontal, // Optional: Axis to stretch if `stretchAlongAxis` is true
)
```

#### 💫 CoderShakingIcon - ShakingIcon
A reusable widget that applies a continuous shaking animation to any icon, SVG, or image asset. Fully customizable direction, speed, and size.
```dart
CoderShakingIcon(
  svgAssetPath: 'assets/icons/crown.svg', // ✅ Optional: SVG asset path (requires flutter_svg)
  imageAssetPath: 'assets/images/star.png', // ✅ Optional: Image asset path (e.g., PNG/JPG)
  iconData: Icons.star, // ✅ Optional: Flutter built-in IconData
  color: Colors.orangeAccent, // Optional: Color to apply to the icon/image/SVG
  size: 24.0, // Optional: Size of the icon/image in logical pixels
  duration: Duration(milliseconds: 600), // Optional: One full shake cycle duration
  shakeOffset: 4.0, // Optional: Max distance to move during shake
  shakeDirection: Axis.horizontal, // Optional: Shake along horizontal or vertical axis
  blendMode: BlendMode.srcIn, // Optional: Blend mode for SVG or image color filter
)
```

#### 🌀 CoderCircularShake - CircularShake
A widget that applies a fast circular shaking animation to its child. Ideal for attention-grabbing UI elements like badges, buttons, icons, or alerts.
```dart
CoderCircularShake(
  child: Icon(Icons.notifications_active), // ✅ Required: Widget to shake
  duration: Duration(milliseconds: 800),    // Optional: Duration to keep shaking (default: 700ms)
)
```

### Animated

#### 👆 BounceTap – Bounce Effect on Tap
Adds a bounce scale effect when a widget is tapped. Ideal for interactive buttons and icons.
```dart
BounceTap(
  child: Icon(Icons.favorite),    // ✅ Required: Widget to animate
  scale: 0.9,                     // Optional: Scale factor (default: 0.9)
  duration: Duration(milliseconds: 150), // Optional: Duration of bounce
  onTap: () => print("Tapped!"),  // Optional: Callback on tap
)
```

#### 🎞️ SlideFadeIn – Slide + Fade Entry
Slides and fades in a widget from a specified direction. Perfect for onboarding, banners, or entrance effects.
```dart
SlideFadeIn(
  child: Text("Welcome!"),                  // ✅ Required
  beginOffset: Offset(0, 0.2),              // Optional: Slide from bottom
  duration: Duration(milliseconds: 500),    // Optional: Duration
  delay: Duration(milliseconds: 300),       // Optional: Delay before start
)
```

#### ✨ ShimmerPlaceholder – Skeleton Loading
Displays a shimmer loading effect for placeholder UI.
```dart
ShimmerPlaceholder(
  width: double.infinity,              // ✅ Optional: Width of shimmer box
  height: 20,                          // ✅ Optional: Height of shimmer box
  borderRadius: BorderRadius.circular(8), // Optional
)
```

#### ⌨️ TypewriterText – Typewriter Effect
Displays text one character at a time, like a typing effect.
```dart
TypewriterText(
  text: "Loading data...",             // ✅ Required: Full text
  characterDelay: Duration(milliseconds: 50), // Optional
  cursor: "|",                         // Optional: Blinking cursor
  loop: false,                         // Optional: Should loop
)
```

#### 💓 PulseEffect – Attention Pulse
Applies a continuous scale-up/scale-down pulse effect to draw attention.
```dart
PulseEffect(
  child: Icon(Icons.mic),                 // ✅ Required: Widget to pulse
  minScale: 0.95, maxScale: 1.05,         // Optional: Scale range
  duration: Duration(milliseconds: 800),  // Optional: Pulse duration
)
```

#### 🪄 RevealAnimation – Scale Reveal
Reveals a widget by scaling it from 0 to 1.
```dart
RevealAnimation(
  child: Text("Revealed!"),              // ✅ Required
  duration: Duration(milliseconds: 600), // Optional: Animation duration
  delay: Duration(milliseconds: 300),    // Optional: Delay before starting
)
```

#### 🃏 FlipCard – Flip Between Front & Back
Flips a card between two sides with a 3D animation.
```dart
FlipCard(
  front: Card(child: Text('Front')),     // ✅ Required: Front side
  back: Card(child: Text('Back')),       // ✅ Required: Back side
  flipHorizontal: true,                  // Optional: Flip horizontally or vertically
  autoFlip: true,                        // Optional: Tap to flip
)
```

### Extensions

#### 🧱 SnackBar
This extension adds a showSnackBar() method to BuildContext, allowing you to show consistent, themed SnackBars with just one line.
```dart
context.showSnackBar(
  String message, {
  SnackBarType type = SnackBarType.info, // Optional: Controls the color and icon
  Duration duration = const Duration(seconds: 3), // Optional: How long it shows
  String? title, // Optional: Bold title shown above the message
  IconData? icon, // Optional: Override default icon
})
```

#### ✅ Quick Usage
This extension adds useful, ready-to-use properties to BuildContext for cleaner access to screen dimensions, padding, orientation, and theme mode.
```dart
final width = context.screenWidth;                       // Full screen width
final height = context.screenHeight;                     // Full screen height
final safeHeight = context.screenHeightWithoutSystemBars;// Height minus status/nav bars
final isTablet = context.isTabletSize;                   // Is the device a tablet?
final isDark = context.isDarkMode;                       // Is the theme dark?
final topPadding = context.paddingTop;                   // Status bar height
final bottomPadding = context.paddingBottom;             // Bottom inset (e.g., nav bar)
final isPortrait = context.isPortrait;                   // Device is in portrait?
final isLandscape = context.isLandscape;                 // Device is in landscape?
```

#### ✅ Quick Usage - NavigatorExtension
This extension adds easy-to-use navigation helpers to BuildContext, simplifying route transitions across your Flutter app:
```dart
// Push a new screen
context.push(SecondScreen());

// Replace current screen
context.pushReplacement(HomeScreen());

// Push and clear all previous screens
context.pushAndRemoveAll(LoginScreen());

// Pop the current screen
context.pop();

// Pop with a result
context.pop('resultValue');

// Pop until a condition is met
context.popUntil((route) => route.isFirst);

// Check if back navigation is possible
final canGoBack = context.canPop();
```

#### 🎯 Quick Usage – AppStyles
Use responsive TextStyles and size scaling across your app with context.
```dart
// 🎯 Responsive spacing
final padding = EdgeInsets.all(context.scale(12));

// 🅰️ Headline Styles
Text('Headline 1', style: context.headline1);
Text('Headline 2', style: context.headline2);
Text('Headline 3', style: context.headline3);
Text('Headline 4', style: context.headline4);
Text('Headline 5', style: context.headline5);

// 📝 Body Styles
Text('Body Extra Large', style: context.bodyExtraLarge);
Text('Body Bold Extra Large', style: context.bodyBoldExtraLarge);
Text('Body Medium Extra Large', style: context.bodyMediumExtraLarge);
Text('Body Large', style: context.bodyLarge);
Text('Body Bold Large', style: context.bodyBoldLarge);
Text('Body Medium Large', style: context.bodyMediumLarge);
Text('Body Medium', style: context.bodyMedium);
Text('Body Bold Medium', style: context.bodyBoldMedium);
Text('Body Small', style: context.bodySmall);
Text('Body Bold Small', style: context.bodyBoldSmall);
Text('Caption Text', style: context.caption);

// 🔘 Button Styles
Text('Button Text', style: context.button);
Text('Accent Button Text', style: context.accentButton);
```

#### 📅 DateTimeExtensions – Format Dates Easily
This extension on DateTime provides simple getters to format dates and calculate "time ago" text.
```dart
final now = DateTime.now();
final yesterday = DateTime.now().subtract(Duration(days: 1));

// Get formatted date like 25/07/2025
final formatted = now.formattedDate;

// Get relative time string like "2 hours ago"
final ago = yesterday.timeAgo;
```

### 🚀 About Me

👨‍💻 Senior Flutter Developer <br />
💡 One principle I always code by: <br />
*"Don’t just develop — Develop Innovative"*

### 📝 Author Profile

> [![coderspacedev](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/coderspacedev) <br />
> [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/thoriya-prahalad-1b6a82137) <br />
> [![Stack_Overflow](https://img.shields.io/badge/Stack_Overflow-FE7A16?style=for-the-badge&logo=stack-overflow&logoColor=white)](https://stackoverflow.com/users/9917404/thoriya-prahalad)

## Support

For support, email thoriyaprahalad@gmail.com
