
import 'package:ai_chat_bot/core/core.dart';


class IconsBarTransition extends AnimatedWidget {
  final Animation<double> firstBallAnimation,
      secondBallAnimation,
      opacityAnimation,
      firstIconOpacityAnimation,
      secondIconOpacityAnimation,
      sizeAnimation;
  final void Function() cropIconOnTap,
      shapeIconOnTap,
      editIconOnTap,
      cancelIconOnTap;
  final Animation<Color?> colorAnimation;
  IconsBarTransition({
    super.key,
    required BuildContext context,
    required super.listenable,
    required this.cropIconOnTap,
    required this.shapeIconOnTap,
    required this.editIconOnTap,
    required this.cancelIconOnTap,
  })  : firstBallAnimation = Tween<double>(begin: 0.12, end: 0.0).animate(
          CurvedAnimation(
            parent: listenable as AnimationController,
            curve: Curves.easeIn,
          ),
        ),
        secondBallAnimation = Tween<double>(begin: 0.24, end: 0.0).animate(
          CurvedAnimation(
            parent: listenable,
            curve: Curves.easeIn,
          ),
        ),
        opacityAnimation = Tween<double>(begin: 1, end: 0).animate(
          CurvedAnimation(
            parent: listenable,
            curve: Curves.easeIn,
          ),
        ),
        firstIconOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
          CurvedAnimation(
            parent: listenable,
            curve: const Interval(
              0.0,
              0.6,
              curve: Curves.easeIn,
            ),
          ),
        ),
        secondIconOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: listenable,
            curve: const Interval(
              0.6,
              1.0,
              curve: Curves.easeIn,
            ),
          ),
        ),
        sizeAnimation = Tween<double>(begin: 1, end: 1.2).animate(
          CurvedAnimation(
            parent: listenable,
            curve: const Interval(0.4, 1, curve: Curves.easeIn),
          ),
        ),
        colorAnimation = ColorTween(
          begin: Theme.of(context).colorScheme.onPrimaryContainer,
          end: Theme.of(context).colorScheme.primary,
        ).animate(
          CurvedAnimation(
            parent: listenable,
            curve: const Interval(0.4, 1, curve: Curves.easeIn),
          ),
        );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            right: width * firstBallAnimation.value,
            child: Opacity(
              opacity: opacityAnimation.value,
              child: GestureDetector(
                onTap: shapeIconOnTap,
                child: CircleWidget(
                    iconData: Icons.shape_line_outlined,
                    bgColor: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ),
          Positioned(
            right: width * secondBallAnimation.value,
            child: Opacity(
              opacity: opacityAnimation.value,
              child: GestureDetector(
                onTap: cropIconOnTap,
                child: CircleWidget(
                    iconData: Icons.crop,
                    bgColor: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            child: ScaleTransition(
              scale: sizeAnimation,
              child: GestureDetector(
                onTap: editIconOnTap,
                child: EditCircleWidget(
                  bgColor: colorAnimation.value!,
                  firstOpacity: firstIconOpacityAnimation.value,
                  secondOpacity: secondIconOpacityAnimation.value,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            top: width * 0.13,
            child: ScaleTransition(
              scale: sizeAnimation,
              child: GestureDetector(
                onTap: cancelIconOnTap,
                child: CancelCircleWidget(
                  bgColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  secondOpacity: secondIconOpacityAnimation.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CircleWidget extends StatelessWidget {
  final Color bgColor;
  final IconData iconData;
  const CircleWidget({
    super.key,
    required this.bgColor,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: width * 0.1,
      width: width * 0.1,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(iconData),
    );
  }
}

class EditCircleWidget extends StatelessWidget {
  final Color bgColor;
  final double firstOpacity;
  final double secondOpacity;
  const EditCircleWidget({
    super.key,
    required this.bgColor,
    required this.firstOpacity,
    required this.secondOpacity,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: width * 0.1,
      width: width * 0.1,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Opacity(
            opacity: firstOpacity,
            child: const Icon(Icons.edit_outlined),
          ),
          Opacity(
            opacity: secondOpacity,
            child: const Icon(
              Icons.done,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CancelCircleWidget extends StatelessWidget {
  final Color bgColor;
  final double secondOpacity;
  const CancelCircleWidget({
    super.key,
    required this.bgColor,
    required this.secondOpacity,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Opacity(
      opacity: secondOpacity,
      child: Container(
        height: width * 0.1,
        width: width * 0.1,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.close),
      ),
    );
  }
}
