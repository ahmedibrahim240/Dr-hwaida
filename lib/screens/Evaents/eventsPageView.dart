import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/events.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../CustomBottomNavigationBar.dart';

class EventsPageView extends StatefulWidget {
  final CustomEvent events;

  const EventsPageView({Key key, @required this.events}) : super(key: key);
  @override
  _EventsPageViewState createState() => _EventsPageViewState();
}

class _EventsPageViewState extends State<EventsPageView> {
  YoutubePlayerController _controller;

  String id;

  @override
  void initState() {
    super.initState();
    if (widget.events.video != null) {
      id = YoutubePlayer.convertUrlToId(widget.events.video);
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
  }

  @override
  void deactivate() {
    if (widget.events.video != null) {
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.events.video != null) {
      _controller.dispose();
    }

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
          return scaffoldWtihVideo(context);
        }
      },
    );
  }

  Scaffold scaffoldWtihVideo(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.events.imageUl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.events.title,
                          style: AppTheme.heading.copyWith(
                            color: customColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Start date: ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                              Text(
                                widget.events.start_date,
                                style: AppTheme.subHeading,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'End date: ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                              Text(
                                widget.events.start_date,
                                style: AppTheme.subHeading,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Start time: ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                              Text(
                                widget.events.start_time,
                                style: AppTheme.subHeading,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'End time: ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                              Text(
                                widget.events.start_time,
                                style: AppTheme.subHeading,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            getTranslated(context, "Price") + ': ',
                            style: AppTheme.heading.copyWith(
                              color: customColor,
                            ),
                          ),
                          Row(
                            children: [
                              (widget.events.discount != '0')
                                  ? Text(
                                      widget.events.price,
                                      style: AppTheme.heading.copyWith(
                                        color: Colors.grey[500],
                                        fontSize: 8,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : Container(),
                              SizedBox(width: 5),
                              Text(
                                gitnewPrice(
                                      price: widget.events.price,
                                      descaound: widget.events.discount,
                                    ) +
                                    '\$',
                                style: AppTheme.heading.copyWith(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: Divider(
                          thickness: 2,
                          color: customColorDivider,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            getTranslated(context, "About") + ': ',
                            style: AppTheme.heading.copyWith(
                              color: customColor,
                            ),
                          ),
                          Text(
                            widget.events.title,
                            style: AppTheme.subHeading,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      (widget.events.contant != null)
                          ? Text(
                              parseHtmlString(widget.events.contant),
                              textAlign: TextAlign.justify,
                              style: AppTheme.subHeading.copyWith(
                                height: 1.5,
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: Divider(
                          thickness: 2,
                          color: customColorDivider,
                        ),
                      ),
                      (widget.events.video != null)
                          ? youtubePlayer(_controller)
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: CustomButtonWithchild(
                          color: customColor,
                          onPress: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => CheckOut(),
                            //   ),
                            // );
                          },
                          child: Text(
                            'Booking Naw',
                            style:
                                AppTheme.heading.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
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
}
