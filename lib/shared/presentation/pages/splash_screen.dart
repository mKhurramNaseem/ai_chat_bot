import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              const Spacer(
                flex: 22,
              ),
              const Expanded(flex: 42, child: Placeholder()),
              const Spacer(
                flex: 8,
              ),
              Expanded(
                flex: 20,
                child: SpinKitCircle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Spacer(
                flex: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
