import 'package:DrHwaida/comingSoon.dart';
import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/events.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';
import 'package:DrHwaida/screens/Evaents/eventsPageView.dart';
import 'package:DrHwaida/screens/Evaents/eventspage.dart';
import 'package:DrHwaida/screens/consultantPageView/consultantPageView.dart';
import 'package:DrHwaida/screens/mycourses/mycourses.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Container eventSlider({BuildContext context, List<CustomEvent> evetList}) {
  return Container(
    child: Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlayInterval: Duration(seconds: 2),
            autoPlay: true,
            // reverse: widget.reverse,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
          items: evetList
              .map(
                (items) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => EventsPageView(
                          events: items,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 300,
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  image: DecorationImage(
                                    image: AssetImage(items.imageUl),
                                    //  NetworkImage(
                                    //   items,
                                    // ),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(height: 40),
                                      Text(
                                        items.title,
                                        style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Text(
                                        items.contant.substring(0, 25),
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
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

Container rowofHmeTaps(BuildContext context) {
  return Container(
    height: 130,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        homeTabs(
          title: 'Consultants',
          icon: Icons.home,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Consultant(),
              ),
            );
          },
        ),
        homeTabs(
          title: 'Courses',
          icon: FontAwesomeIcons.bookOpen,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MyCourses(),
              ),
            );
          },
        ),
        homeTabs(
          title: 'Events',
          icon: FontAwesomeIcons.bookOpen,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => EventsPage(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

Container homeTabs({String title, IconData icon, Function onTap}) {
  return Container(
    width: 120,
    child: InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: AppTheme.heading,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

consulHomeCard({
  String imageUrl,
  String oldPrie,
  String newPrie,
  String consulName,
  double rate,
  Function onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 200,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 65,
                      backgroundImage: AssetImage(imageUrl),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppTheme.containerBackground,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                oldPrie + '\$',
                                style: AppTheme.subHeading.copyWith(
                                  color: customColorDivider,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                newPrie + '\$',
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                child: Column(
                  children: [
                    Text(
                      consulName,
                      style: AppTheme.subHeading.copyWith(
                        color: customColor,
                      ),
                    ),
                    RatingStar(
                      isReadOnly: true,
                      rating: rate,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

sctionTitle({String title, Function onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.heading.copyWith(
            color: customColor,
            fontSize: 16,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'View All',
            style: AppTheme.subHeading,
          ),
        ),
      ],
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

paner(BuildContext context) {
  return Card(
    elevation: 4,
    child: Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/event.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

///////////////////////////////////////////////////////////////////////////////////////
Container consulHomeList(String imageUrl, String oldPrie, String newPrie,
    String consulName, double rate) {
  return Container(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: (context, index) {
        return consulHomeCard(
          imageUrl: imageUrl,
          oldPrie: oldPrie,
          newPrie: newPrie,
          consulName: consulName,
          rate: rate,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ConsultantPageView(
                  consultName: consulName,
                  imagUrl: imageUrl,
                  rating: rate.toString(),
                  location: 'elmansora',
                  oldPrice: oldPrie,
                  newPrice: newPrie,
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
