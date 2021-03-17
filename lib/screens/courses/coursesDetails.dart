import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/models/coursesquestion.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../CustomBottomNavigationBar.dart';
// import 'components/videoscreens.dart';

class CoursesDetails extends StatefulWidget {
  final Courses courses;

  const CoursesDetails({Key key, @required this.courses}) : super(key: key);
  @override
  _CoursesDetailsState createState() => _CoursesDetailsState();
}

class _CoursesDetailsState extends State<CoursesDetails> {
  int qTapped;
  bool showAnwser = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;

  String url = "https://www.youtube.com/watch?v=H9154xIoYTA";
  String id;

  @override
  void initState() {
    super.initState();
    id = YoutubePlayer.convertUrlToId(url);
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: true,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orien) {
        if (orien == Orientation.landscape) {
          return Scaffold(
            body: youtubePlayer(_controller),
          );
        } else {
          return scafofoldWithappBar(context);
        }
      },
    );
  }

  Scaffold scafofoldWithappBar(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 150,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              padding: EdgeInsets.symmetric(vertical: 10),
              children: [
                courseCard(),
                SizedBox(height: 4),
                aboutThisCourse(context),
                qAs(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtonWithchild(
                    color: customColor,
                    onPress: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => CheckOut(),
                      //   ),
                      // );
                    },
                    child: Center(
                      child: Text(
                        getTranslated(context, "Add_to_Cart"),
                        style: AppTheme.heading.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  ListView qAs() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemCount: questionList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  qTapped = index;
                  showAnwser = !showAnwser;
                });
              },
              child: Container(
                height: 50,
                color: (qTapped == index && showAnwser == true)
                    ? customColor
                    : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      questionList[index].question,
                      textDirection: TextDirection.ltr,
                      style: AppTheme.heading.copyWith(color: Colors.white),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      (qTapped == index && showAnwser == true)
                          ? Icons.add
                          : Icons.minimize,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            (qTapped == index && showAnwser == true)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Text(
                          questionList[index].answer +
                              questionList[index].answer +
                              questionList[index].answer +
                              questionList[index].answer +
                              questionList[index].answer +
                              questionList[index].answer,
                          textDirection: TextDirection.ltr,
                          style: AppTheme.subHeading,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      },
    );
  }

  aboutThisCourse(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: customColorDivider.withOpacity(.5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About this course',
                    style: AppTheme.heading.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.courses.contant,
                    style: AppTheme.heading.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowOfCorseDetaile(
                icon: FontAwesomeIcons.globeAfrica,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Instuctor:' + widget.courses.title,
                      style: AppTheme.heading.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '100% Online',
                          style: AppTheme.heading.copyWith(
                            color: Colors.grey.withOpacity(.9),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          widget.courses.date,
                          style: AppTheme.heading.copyWith(
                            color: Colors.grey[400],
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'start instantly and learn at own schedule',
                      style: AppTheme.heading.copyWith(
                        color: Colors.grey.withOpacity(.9),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              rowOfCorseDetaile(
                icon: FontAwesomeIcons.calendar,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flexible deadline',
                      style: AppTheme.heading.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'start instantly and learn at own schedule',
                      style: AppTheme.heading.copyWith(
                        color: Colors.grey.withOpacity(.9),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              rowOfCorseDetaile(
                icon: FontAwesomeIcons.clock,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 90,
                  child: Text(
                    'Approx. 55 hours to complete and 22 video',
                    style: AppTheme.heading.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  rowOfCorseDetaile({Widget child, IconData icon}) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: customColor),
          ),
          child: Center(
            child: Icon(
              icon,
              color: customColor,
              size: 30,
            ),
          ),
        ),
        SizedBox(width: 10),
        child,
      ],
    );
  }

  circleContainerWithIcon({IconData icon}) {
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: customColor),
      ),
      child: Center(
        child: Icon(
          icon,
          color: customColor,
          size: 40,
        ),
      ),
    );
  }

  courseCard() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: youtubePlayer(_controller),
            ),
            courseDetail(),
          ],
        ),
      ),
    );
  }

  courseDetail() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'solving problem with your son',
                  style: AppTheme.heading,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.starHalfAlt,
                      color: Colors.yellow[900],
                    ),
                    SizedBox(width: 5),
                    Text(
                      '(${widget.courses.rating}K)',
                      style: AppTheme.heading,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.courses.newPrice + '\$',
            style: AppTheme.heading,
          ),
        ],
      ),
    );
  }

  cousrsImage() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.courses.courseImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(.5),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 10,
              child: Container(
                color: Colors.grey.withOpacity(.6),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.play,
                      color: customColor,
                      size: 10,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '150 min',
                      style: AppTheme.subHeading.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.play,
                    color: customColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Divider(
                      thickness: 3,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Colors.grey.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
