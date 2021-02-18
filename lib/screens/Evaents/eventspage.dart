import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/models/events.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/Evaents/eventsPageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Events'),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listEvent.length,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EventsPageView(
                        events: listEvent[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(listEvent[index].imageUl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
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
                            listEvent[index].title,
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            listEvent[index].contant.substring(0, 25),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
            ],
          );
        },
      ),
    );
  }
}
