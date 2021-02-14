import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

const customColor = Color(0xfff4DC0B1);
const customColorIcon = Color(0xfff807d7d);
const customColorDivider = Color(0xfffe1e1e1);
//////////////////////////////////////////////////////////
PreferredSizeWidget customAppBar({String title}) => AppBar(
      centerTitle: true,
      toolbarHeight: 80,
      backgroundColor: customColor,
      title: Text(
        title,
        style: AppTheme.heading.copyWith(
          color: Colors.white,
        ),
      ),
    );

//////////////////////////////////////////////////////
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

/////////////////////////////////////////////////////////////////////////////////
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
/////////////////////////////////////////////////////////////////////////////////

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
/////////////////////////////////////////////////////////////////////////////////

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
/////////////////////////////////////////////////////////////////////////////////

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
/////////////////////////////////////////////////////////////////////////////////

class CustomCarouselSlider extends StatefulWidget {
  final bool reverse;
  final Function onTap;
  final List<dynamic> listOfObject;

  const CustomCarouselSlider({
    Key key,
    @required this.listOfObject,
    @required this.reverse,
    @required this.onTap,
  }) : super(key: key);

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> offer = widget.listOfObject;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlayInterval: Duration(seconds: 2),
                autoPlay: true,
                reverse: widget.reverse,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
              ),
              items: offer
                  .map(
                    (items) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        items.imgUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(height: 40),
                                        Text(
                                          items.contant,
                                          style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          items.title,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
