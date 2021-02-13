import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';

const customColor = Color(0xfff4DC0B1);

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2 - 150, size.height / 2,
        size.width / 2, size.height / 2 + 30);

    path.quadraticBezierTo(
        size.width, size.height - 60, size.width + 80, size.height / 2 - 150);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPress;
  CustomButton({this.onPress, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: double.infinity,
          height: 48,
          child: Text(
            text,
            style: AppTheme.heading.copyWith(
              fontSize: 14,
              color: customColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithchild extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function onPress;
  CustomButtonWithchild({this.onPress, this.child, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        color: color,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: double.infinity,
          height: 48,
          child: child,
        ),
      ),
    );
  }
}

void showSettingsPanel(
    {@required BuildContext context, @required Widget child}) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    builder: (context) {
      return child;
    },
  );
}

class CustomAppBar extends StatelessWidget {
  final Widget child;
  const CustomAppBar({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: MyCliper(),
        child: Container(
          height: 220,
          padding: EdgeInsets.only(top: 8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: AppTheme.containerBackground,
          ),
          child: child,
        ),
      ),
    );
  }
}
