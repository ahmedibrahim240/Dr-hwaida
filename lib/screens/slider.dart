import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

// class OnBoard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     if (UserData.isSingin == true) {
//       return Authenticate();
//     } else {
//       return OnBoarding();
//     }
//   }
// }

class Slider extends StatelessWidget {
  final String title, contant;
  final String image;
  final String backImage;
  Slider({this.backImage, this.contant, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 60),
          Container(
            height: height * .6,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(backImage),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Center(
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                width: width,
              ),
            ),
          ),
          Center(
              child: Text(
            title,
            style: AppTheme.heading.copyWith(color: customColor),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                contant,
                style: AppTheme.subHeading.copyWith(
                  height: 1.5,
                  letterSpacing: .07,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();
  List<Widget> _pages = [
    Slider(
      title: 'Title',
      contant:
          'Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant ',
      image: 'lib/images/img2.png',
      backImage: 'lib/images/back2.png',
    ),
    Slider(
      title: 'Title',
      contant:
          'Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant ',
      image: 'lib/images/img1.png',
      backImage: 'lib/images/back3.png',
    ),
    Slider(
      title: 'Title',
      contant:
          'Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant Title Contant ',
      image: 'lib/images/img2.png',
      backImage: 'lib/images/back2.png',
    ),
  ];
  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Positioned(
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
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/logo.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _pages.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? customColor
                            : customColor.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: (_currentPage == (_pages.length - 1))
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (_currentPage == (_pages.length - 1)) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => Authenticate(),
                            ),
                          );
                        } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeInOutQuint,
                          );
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: customColor,
                        ),
                        child: (_currentPage == (_pages.length - 1))
                            ? Center(
                                child: Text(
                                  'start',
                                  style: AppTheme.heading
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            : Center(
                                child: Text(
                                  'next',
                                  style: AppTheme.heading
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => Authenticate(),
                          ),
                        );
                      },
                      child: (_currentPage == (_pages.length - 1))
                          ? Container()
                          : Row(
                              children: [
                                Text(
                                  'skip',
                                  style: AppTheme.heading
                                      .copyWith(color: customColor),
                                ),
                                Transform.rotate(
                                  angle: 180 * 3.14 / 180,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: customColor,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
