
import 'package:flutter/material.dart';
import 'package:save/models/on_boarding_model.dart';
import 'package:save/views/01_auth/login_screen.dart';
import 'package:save/views/widgets/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();

  List<BoardingModel> onBoarding = [
    BoardingModel(
        image: 'https://pbs.twimg.com/media/E2qR8-IWUAQ_1o2.jpg',
        title: 'Test Depression',
        body: 'To find out if you have depression or not, by doing a test to tweets on your Twitter account, and also showing how much your depression is.\n'
            'All this by analyzing your words in your tweets using Machine Learning'),
    BoardingModel(
        image: 'https://iranilike.com/wp-content/uploads/2021/12/Add-friends-bro-300x300.png',
        title: 'Friends',
        body: 'You can add three friends or Relatives  phone numbers so that we can communicate with them'
            ' if you need a help By sending them sms'),
    BoardingModel(
        image: 'https://www.concept-cda.com/wp-content/uploads/2019/11/Content-bro-1.png',
        title: "Post",
        body: 'You can add a post to tell about your depression and respond and interact with the rest of the users\n''\n'
            'Also, when you skip this stage, you can tell your success story in this matter and help those in need.\n''\n'
            'You can delete the post if you want\n''\n'
            'You can see who interacted with you from the user\n''\n'
            'You can add your own picture\n''\n'
            'You can also comment if you want\n'),
    BoardingModel(
        image: 'https://www.truepush.com/blog/wp-content/uploads/2021/03/push-notifications-concept-illustration_114360-4850.jpg',
        title: "Notification",
        body: 'Through the application, a text message notification appears to motivate you to get rid of depression every quarter of an hour\n''\n'
            'Through the application, you can know what depression is, its types and causes, as well as many ways to get rid of it\n''\n'
            'There is a page for exercises that you can view''\n'
            'There are many ways to treat depression''\n'),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardingController,
                itemBuilder: (context, index) =>
                    buildPageItem(onBoarding[index]),
                itemCount: onBoarding.length,
                onPageChanged: (int index) {
                  if (index == onBoarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),

            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller: boardingController,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.black12,
                        activeDotColor: Colors.green,
                        dotHeight: 15,
                        dotWidth: 40,
                        expansionFactor: 4,
                        spacing: 5.0,
                      ),
                      count: onBoarding.length),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        navigateAndFinish(context, LoginScreen());
                        // navigateAndFinish(context, depression());
                      } else {
                        boardingController.nextPage(
                          duration: const Duration(
                            milliseconds: 800,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageItem(BoardingModel model) => Expanded(
    child: SingleChildScrollView(
      scrollDirection:Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(model.image),
            height:500,width:400,fit:BoxFit.fill,),
          Text(
            model.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:30,
              color:Colors.lightGreen[900],
            ),
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize:20,
              color:Colors.black,
              letterSpacing:1.5,
              height:1.6,


            ),
          ),

        ],
      ),
    ),
  );
}


// void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
//   context,
//   MaterialPageRoute(
//     builder: (context) => widget,
//   ),
//       (Route<dynamic> route) => false,
// );



