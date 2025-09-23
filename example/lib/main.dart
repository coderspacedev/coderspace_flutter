import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';

void main() {
  AppTheme.useLight();

  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'coderspace', home: Example());
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      appBar: CoderBar(
        title: 'coderspace',
        backgroundColor: AppTheme.colors.accent,
        isBack: false,
        forceMaterialTransparency: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CoderButton(
              text: "Click Me",
              paddingH: context.scale(56),
              onPressed: () {
                context.showSnackBar('Click Me');
              },
            ),
            SizedBox(height: context.scale(16)),
            CoderTextField(
              controller: TextEditingController(),
              hint: "Enter your name",
              prefixIcon: Icons.person,
            ),
            SizedBox(height: context.scale(16)),
            CoderContainer(
              padding: EdgeInsets.all(context.scale(16)),
              color: AppTheme.colors.card,
              child: Text("CoderContainer", style: context.bodyLarge),
            ),
            SizedBox(height: context.scale(16)),
            CoderCard(
              title: "Card Title",
              subtitle: "Subtitle here",
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            SizedBox(height: context.scale(16)),
            CoderShakingIcon(
              iconData: Icons.alarm,
              size: context.scale(36),
              duration: const Duration(seconds: 2),
            ),
            SizedBox(height: context.scale(16)),
            CoderCircularShake(
              child: Icon(
                Icons.star,
                size: context.scale(48),
                color: Colors.amber,
              ),
            ),
            SizedBox(height: context.scale(16)),
            CoderAnimatedGradientBorder(
              gradientColors: [Colors.blue, Colors.purple],
              borderRadius: BorderRadius.circular(context.scale(16)),
              child: CoderContainer(
                padding: EdgeInsets.all(context.scale(24)),
                margin: EdgeInsets.all(context.scale(2)),
                child: Text('Gradient Border', style: context.bodyBoldLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
