import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../CustomBottomNavigationBar.dart';

class MyCoursesDetails extends StatefulWidget {
  final Courses courses;

  const MyCoursesDetails({Key key, @required this.courses}) : super(key: key);
  @override
  _MyCoursesDetailsState createState() => _MyCoursesDetailsState();
}

class _MyCoursesDetailsState extends State<MyCoursesDetails> {
  int lecTapped = 0;
  YoutubePlayerController _controller;

  String url;
  String id;
  List<String> videoList = [
    "https://www.youtube.com/watch?v=H9154xIoYTA",
    "https://www.youtube.com/watch?v=BBvod49uySQ",
    "https://www.youtube.com/watch?v=H9154xIoYTA",
    "https://www.youtube.com/watch?v=BBvod49uySQ",
  ];

  @override
  void initState() {
    super.initState();
    url = videoList[0];
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

  youtubePlayers(YoutubePlayerController controller) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        aspectRatio: 16 / 9,
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orien) {
        if (orien == Orientation.landscape) {
          return Scaffold(
            body: youtubePlayers(_controller),
          );
        } else {
          return scafoldWthisAppBar(context);
        }
      },
    );
  }

  Scaffold scafoldWthisAppBar(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 170,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      youtubePlayers(_controller),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      taps(
                        index: 0,
                        title: 'Lecture',
                        onTap: () {
                          setState(
                            () {
                              lecTapped = 0;
                            },
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      taps(
                        index: 1,
                        title: 'More',
                        onTap: () {
                          setState(
                            () {
                              lecTapped = 1;
                            },
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      taps(
                        index: 2,
                        title: 'Review',
                        onTap: () {
                          setState(
                            () {
                              lecTapped = 2;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                (lecTapped == 0)
                    ? lectureBody()
                    : (lecTapped == 1)
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                widget.courses.contant,
                                style: AppTheme.subHeading,
                              ),
                            ),
                          )
                        : reviewBody(),
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

  Container reviewBody() {
    return Container(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add your rate',
                  style: AppTheme.heading.copyWith(
                    color: customColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.courses.title,
                style: AppTheme.heading.copyWith(),
              ),
              SizedBox(height: 10),
              Center(
                child: SmoothStarRating(
                  rating: 2.5,
                  size: 25,
                  filledIconData: Icons.star,
                  color: Colors.yellow[700],
                  halfFilledIconData: Icons.star_half,
                  borderColor: Colors.yellow[900],
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 2.0,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: conectedTextFormStyle(
                  lableText: 'Add comment',
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'سؤال سؤال سؤال سؤال',
                  textDirection: TextDirection.ltr,
                  style: AppTheme.heading.copyWith(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: conectedTextFormStyle(
                  lableText: 'Answer',
                ),
              ),
              SizedBox(height: 10),
              CustomButtonWithchild(
                color: customColor,
                onPress: () {},
                child: Center(
                  child: Text(
                    'Rating',
                    style: AppTheme.heading.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell taps({Function onTap, String title, int index}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: AppTheme.subHeading.copyWith(
              color: (lecTapped == index) ? Colors.black : Colors.grey[400],
            ),
          ),
          SizedBox(
            width: 50,
            child: Divider(
              color: (lecTapped == index) ? Colors.black : Colors.transparent,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }

  Column lectureBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Section 2 -Introduction',
            style: AppTheme.subHeading.copyWith(
              color: Colors.grey[400],
            ),
          ),
        ),
        lectureDetaile(),
      ],
    );
  }

  ListView lectureDetaile() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemBuilder: (context, index) {
        return lecture(
            index: index,
            onTap: () {
              setState(
                () {
                  url = videoList[index];
                  id = YoutubePlayer.convertUrlToId(url);

                  _controller.load(id);

                  print("VideoID: " + id);
                },
              );
            });
      },
    );
  }

  lecture({int index, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${index + 1}',
                style: AppTheme.heading.copyWith(
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: customColor,
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Welcom to 2 course',
                        style: AppTheme.heading,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Video -10.22 mins-Resources (1)',
                    style: AppTheme.subHeading.copyWith(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: customColorDivider,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
