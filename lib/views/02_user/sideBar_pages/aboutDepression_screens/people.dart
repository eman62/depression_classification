
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);


  @override
  State<People> createState() => PeopleState();
}

class PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('People who got rid of depression',
        style: TextStyle(fontSize: 20),
        ),
        backgroundColor:Colors.green,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection:Axis.vertical,
              child: Column(
                  children :[
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/celebs_with_depression_slideshow/1800s_getty_rm_dwayne_johnson.jpg?resize=652px:*&output-quality=75'),
                            fit:BoxFit.fill,),
                          Text(
                            'Dwayne Johnson',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            'He’s one of Hollywood’s highest paid actors, but “The Rock” recently opened up about depression to the Express, a British newspaper. “Struggle and pain is real,” said Johnson, who saved his mother from a suicide attempt when he was 15.  “Depression never discriminates,” he tweeted later. “Took me a long time to realize it but the key is to not be afraid to open up. Especially us dudes have a tendency to keep it in. You’re not alone.\n”',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/celebs_with_depression_slideshow/1800s_getty_rm_kirsten_dunst.jpg?resize=652px:*&output-quality=75'),
                            fit:BoxFit.fill,),

                          Text(
                            'Kirsten Dunst',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            'The 39-year-old actor has revealed that when she was in her 20s, she entered a rehab center for help with depression. Dunst says she struggled with the condition for years and realized she was bottling up a lot of anger. All Ill say is that medication is a great thing and can really help you come out of something," she says. "I was afraid to take something and so I sat in it for too long. I would recommend getting help when you need it.\n',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/celebs_with_depression_slideshow/1800ss_getty_rm_jon_hamm.jpg?resize=652px:*&output-quality=75'),
                            fit:BoxFit.fill,),

                          Text(
                            'Jon Hamm',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            'Just like his character Don Draper on Mad Men, Hamm has battled some heavy stuff. He’s been open about his bouts with depression and says it was particularly rough after his father died when he was in college. In an interview with InStyle magazine, Hamm spoke about the benefits of therapy. “We live in a world where to admit anything negative about yourself is seen as a weakness, when it’s actually a strength. It’s not a weak move to say, ‘I need help\n',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/celebs_with_depression_slideshow/1800s_getty_rm_michael_phelps.jpg?resize=652px:*&output-quality=75'),
                            fit:BoxFit.fill,),
                          Text(
                            'Michael Phelps',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            'The swimmer who’s won 28 Olympic medals said his first “depression spell” happened in 2004, but his lowest point came after the 2012 Games, according to CNN. Phelps said he sat alone in his bedroom for 3 to 5 days “not wanting to be alive,” and he knew he needed help. After he sought treatment and started talking about his feelings, he said “life became easy.” Now he understands that “it’s OK to not be OK.\n”',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/celebs_with_depression_slideshow/1800s_getty_rm_wayne_brady.jpg?resize=652px:*&output-quality=75'),
                            fit:BoxFit.fill,),
                          Text(
                            'Wayne Brady',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            'This comedian’s upbeat public image hid a long fight with mental illness. Brady described his experience to Entertainment Tonight in 2014. You don\'t want to move; you cant move in the darkness. He opened up in an effort to stop the double standard in Hollywood, he said, where it seems more acceptable to admit to a drug problem than to clinical depression.\n',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://deadline.com/wp-content/uploads/2022/03/Angelina-Jolie-photo-Netflix-Alexei-Hay-e1646407877581.jpeg?w=1024'),
                            fit:BoxFit.fill,),
                          Text(
                            'Angelina Jolie',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            'In an interview with Wall Street Journal, actress Angelina Jolie revealed that she suffered from depression in her teens. “I grew up in L.A., where focus is very inward. I didn’t know why I was so destructive and miserable. I didn’t appreciate or understand my life," she admitted. Since then, she has said that her humanitarian work has played a major role in helping her find herself.\n',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/celebs_with_depression_slideshow/1800s_getty_rm_bruce_springsteen.jpg?resize=652px:*&output-quality=75',),
                            fit:BoxFit.fill,),

                          Text(
                            'Bruce Springsteen',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            '“The Boss” had bouts of depression in his 60s that “lasted for a long time,” he told CBS Sunday Morning. “It’s like this thing that engulfs you. I got to where I didn’t want to get out of bed.” He said it didn’t affect his work, and wife Patti Scialfa’s “strength and love” were key. “She’d say, ‘You’re going to be OK. Maybe not today or tomorrow, but it’s going to be all right. He also got help for the condition from therapy and medication.\n',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image : NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/celebs_with_depression_slideshow/1800ss_getty_rm_ryan_phillippe.jpg?resize=652px:*&output-quality=75',),
                            fit:BoxFit.fill,),

                          Text(
                            'Ryan Phillippe',
                            style:TextStyle(
                              fontSize:25,
                              fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          Text(
                            'The Cruel Intentions actor says his battle with depression began at a young age. “As you get older, I think it decreases some, but Im just innately kind of a sad person, he recently told Elle magazine. Phillippe hasn’t let his condition keep him from shining onscreen, though. He recently starred in the TV drama Secrets and Lies.\n',
                            style:TextStyle(
                              fontSize:20,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 3),
                            )
                          ]
                      ),
                    ),

                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
