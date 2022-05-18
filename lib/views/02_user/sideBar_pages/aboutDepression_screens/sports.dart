import 'package:flutter/material.dart';

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);


  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Sports',
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
                      // padding: EdgeInsets.all(15.0),
                      width:900,
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:const [
                          Image(image: NetworkImage('https://www.elbalad.news/UploadCache/libfiles/866/6/600x338o/760.jpg'),
                              width:900,
                              fit: BoxFit.cover
                          )

                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(18),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Colors.white,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(image: NetworkImage('https://cdnnarabic1.img.sputniknews.com/img/102056/18/1020561876_4:0:1915:1080_600x0_80_0_0_aa5d63c106ab52e36f3716af1857cf83.jpg.webp'),
                            fit: BoxFit.contain,
                            width: 900,
                          ),

                          Text(
                            'A study confirmed that satisfactory exercises for middle-aged adults '
                                'and the elderly have an effect on reducing depression, after'
                                'it was found that about 50% of people in these age groups complain '
                                'of symptoms of chronic insomnia, and the study revealed that exercise'
                                ' improves sleep in most patients, including that. sleep time',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image( image:NetworkImage('https://cdn.teb21.com/thumb/1280/036/sports-benefits-for-health.webp'),
                            fit: BoxFit.contain,
                            width: 900,
                          ),
                          Text(
                            'First, the yoga exercises \n'
                                'Yoga is a sport of the soul and body and does not change over time.'
                                'It has been around since its inception all over the world about 500 years ago'
                                '. The practice of this sport has increased in the nineties and has become a great popular. It is a physical, mental and spiritual sport. The practice of yoga as a spiritual sport can offer a person many And many of the hearts that benefit him, as it is a sport that helps to relax in the first place and treat oneself from the stresses that may be exposed to the burdens of daily life',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(image: NetworkImage("https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2017/11/10/3053936-360956810.jpg?itok=5XoEGqHV"),
                            fit: BoxFit.contain,
                            // fit: BoxFit.fitWidth,
                            width: 900,
                          ),
                          Text(
                            'econd, imagination exercises'
                                'Depression is the immersion of the mind in negative, sequential thoughts, so that the person is prepared to be unable to think of things other than depression, and for this reason the individual feels isolated from the outside world, and what is happening around him from the causes of depression is the discomfort of the brain from indulging in thoughts'
                                'Imagination exercises on a daily basis and gradually make the brain follow a path of daily exercises is that the person sits in a quiet place and works to monitor and calm her on a daily and gradual basis',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image:NetworkImage("https://media.gemini.media/img/Original/2021/8/22/2021_8_22_17_7_43_128.jpg"),
                            fit: BoxFit.contain,
                            // fit: BoxFit.fitWidth,
                            width: 900,
                          ),
                          Text(
                            'Third, relaxation exercises \n'
                                'It has multiple hearts, it treats anger and various types of obsessive fear \n'
                                'mental depression \n'
                                'Those who suffer from insomnia \n'
                                'Treat headaches of all kinds\n'
                                'Relieves the unity of disorders of the nervous system, especially Irritable Bowel Syndrome',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              height:1.7,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image:NetworkImage("https://static.webteb.net/images/content/tbl_articles_article_26283_9964b158b6-b71c-4cd3-9422-8c34a9a190f0.jpg"),
                            fit: BoxFit.contain,
                            // fit: BoxFit.fitWidth,
                            width: 900,

                          ),
                          Text(
                            'Benefits of morning exercise\n'
                                'Morning exercise offers many benefits, including the following:\n'
                                '  1. Increase energy levels \n'
                                'Doing morning exercises raises the heart rate, which leads to providing the body s organs with oxygen and nutrients necessary to raise energy.\n'
                                ' 2. Increase productivity \n'
                                ' One of the benefits of morning exercise is increased productivity. Getting up early and getting the job done in the morning gives a sense of accomplishment and motivation that lasts for the rest of the day.'
                                'Morning exercise can improve decision-making and focus, which increases a persons productivity and success for the rest of the day.\n'
                                '3. Get rid of depression \n'
                                'Morning exercise may help get rid of depression and psychological problems',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image:NetworkImage("https://cdn.altibbi.com/cdn/cache/1000x500/image/2020/07/30/ce2b4f2bc1541309dbfd6aeee63f1eb8.png.webp"),
                            fit: BoxFit.contain,
                            // fit: BoxFit.fitWidth,
                            width: 900,
                          ),
                          Text(
                            'While sports in old age are very important, human strength and endurance '
                                'decline, and the flexibility of his body decreases significantly when'
                                ' he is over 55 years old. A study conducted in the seventies of the last '
                                'century, looking at the nature and extent of physical disability that afflicts the elderly, indicated that 62% of women between the ages of 75 and 85 had difficulty kneeling or bending. And 66% of them were unable to lift weights more than 4.5 kg. And 42% can\'t hold out for more than 15 minutes.',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              height:1.7,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image:NetworkImage("https://cdn.mosoah.com/wp-content/uploads/2019/03/02110330/%D9%85%D8%B1%D8%A7%D8%AD%D9%84-%D8%AC%D8%B1%D9%8A-%D8%A7%D9%84%D8%B3%D8%B1%D8%B9%D8%A9-%D9%85%D8%B9-%D8%A7%D9%84%D8%AA%D9%81%D8%B3%D9%8A%D8%B1-825x510.jpg"),
                            fit: BoxFit.contain,
                            // fit: BoxFit.fitWidth,
                            width: 900,
                          ),
                          Text(
                            'A new study shows that exercise can cause a lower risk of depression, and '
                                'a genetic analysis of half a million people concluded that just 15 minutes '
                                'of running a day is enough to significantly reduce the risk of depression, '
                                'in addition to that an hour of moderate physical activity will perform the same function.',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),
                    ),
                    const SizedBox(height:30,),
                    Container(
                      // margin: EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        //mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          const Image(
                            image:NetworkImage('https://images.akhbarelyom.com//images/images/medium/20220318212047499.jpg'),
                            fit: BoxFit.contain,
                            // fit: BoxFit.fitWidth,
                            width: 900,
                          ),
                          Text(
                            'The benefits of football from the health of the body to the promotion of mental and psychological health to the extent that it is considered a powerful and effective treatment for many chronic psychological conditions and problems, including:\n'
                                '1.Improving mental abilities: through the role of football in enhancing the performance of cognitive brain functions, as it increases the ability to focus and not forget.\n'
                                ' 2.Enhancing self-confidence: on the way to increase building confidence and self-esteem that already affects family and professional life, speeding up sound decisions, and increasing the ability to persevere and self-control.\n'
                                ' 3.Treating anxiety and fear: Football contributes greatly to eliminating anxiety and stress and treating chronic depression and bad mood, as it stimulates the body to secrete good endorphins, which are essential factors for treatment. Anxiety and psychological fear.\n'
                                '4. Resisting despair: Football also helps to resist feelings of despair and frustration, and to enhance mental and mental skills and abilities, so it is one of the treatment methods for many psychological problems.\n',
                            style:TextStyle(
                              fontSize:20,
                              //fontWeight:FontWeight.bold,
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              height:1.7,
                            ),
                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          // color: Colors.grey[800].withOpacity(0.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow:const [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:10,
                              offset: Offset(0, 2),
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
