import 'package:flutter/material.dart';

class Depression extends StatefulWidget {
  const Depression({Key? key}) : super(key: key);


  @override
  State<Depression> createState() => _Depression();
}

class _Depression extends State<Depression> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Depression',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          elevation: 0,
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
                    // mainAxisAlignment:MainAxisAlignment.center,
                    children:[
                      // Container(
                      //   //margin: EdgeInsets.all(12.0),
                      //   child: Column(
                      //     //mainAxisAlignment:MainAxisAlignment.center,
                      //     children:const [
                      //       Image(image : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBFgpK4O15J2mqClCZwkqWrIhD7eXnojMpmw&usqp=CAU'),
                      //         height:260,width:500,fit:BoxFit.fitWidth,
                      //
                      //       ),
                      //     ],
                      //   ),
                      //   decoration:BoxDecoration(
                      //       borderRadius:BorderRadius.circular(18),
                      //       color: Colors.white,
                      //       boxShadow:const [
                      //         BoxShadow(
                      //           color:Colors.grey,
                      //           blurRadius:10,
                      //           offset: Offset(0, 10),
                      //         )
                      //       ]
                      //   ),
                      // ),
                      const SizedBox(height:20),
                      Card(
                        child: Column(
                          children:[
                            const SizedBox(height:30,),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3603/3603734.png'),width:200, height:200,fit:BoxFit.fill),
                            const Text(
                              '\n' 'What is depression ?', style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Colors.green,),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height:25,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '\nThe past forty years have witnessed an increase in cases of depression as a result of the lifestyle that dominates our lives today'
                                        'For many people, the world has become stressful, and fatigue can lead to depression.In fact, the increase in divorce rates and crime rates is considered  \n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                    TextSpan(text:'A disease that affects the body and the mind is considered a disease that affects both the mind and the body. '
                                        'There for depressed people appear mental and physical symptoms. However, its true nature differs from one person to another and the symptoms of depression vary, so it appears evident to some and hidden to others.''\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:40),
                      Card(
                        child:Column(
                          children: [
                            const SizedBox(height:30,),
                            const Text( 'Symptoms of depression\n',
                              style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.green,),
                            ),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1491/1491414.png'),width:200, height:200,fit:BoxFit.fill),
                            const SizedBox(height:30,),
                            const Text(  '1.Psychological symptoms.''\n',
                              style:  TextStyle(fontSize:23, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/5684/5684648.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\n''\nIrritableLoss of interest in things you used to enjoy\n'' anxiety\n'' Loss of ability to feel\n'' delusion hallucination Suicidal thoughts\n'' physical symptoms\n'' Loss or excess of Alhshaikh\n'
                                        ' overweight\n'' exhaustion\n'' Constipation\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:40),
                      Card(
                        child:Column(
                          children: [
                            const SizedBox(height:40),
                            const Text(  '2. Loss of ability to feel''\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1497/1497115.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nSome severely depressed people say that they completely lose the ability to feel. This symptom is one of the most common symptoms of depression\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text(  '3. Gloomy thinking''\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/7283/7283448.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nWhen you feel depressed, your thinking pattern changes and you see the world from a different perspective \n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ////////////////
                            const Text(  '4. Imagination''\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/4214/4214072.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nWhen you are subjected to severe depression, your thinking distorts, and you lose your connection with reality, and your mind betrays you until you think that madness has taken away all that it took from you.\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ////////////////
                            const Text(  '5. Suicidal thoughts''\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/4897/4897365.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nWhen you are in the depths of depression, the past looks bad and bleak. Some people may think about suicide, even if these thoughts are just suicidal thoughts\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////////
                            const Text(  '6. Sleep problems''\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image:NetworkImage('https://cdn-icons-png.flaticon.com/128/1488/1488187.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nSleep is a common problem among people with depression, and they often bear part of the fatigue that may affect them \n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////
                            const Text(  '7. Anorexia''\n',
                              style:  TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/2869/2869504.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nWhen you feel depressed, you lose a lot of weight. If you lose interest in food, and if you eat some of it, it is flavorless\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ////////
                            const Text(  '8. Deficiency in chemicals''\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1784/1784064.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nSymptoms of depression may result from low levels of certain chemicals in the brain\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text(  '9. The role of hormones''\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1754/1754425.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nHormones contribute significantly to depression\n'
                                        'How do neurons transmit signals?\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:50),
                      Card(
                        child: Column(
                          children:[
                            const SizedBox(height:30,),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/6203/6203193.png"),
                              height:200, width:200, color:Colors.black,fit:BoxFit.fill,),
                            const SizedBox(height:40,),
                            const Text(
                              'Causes of depression ?',
                              style:TextStyle(fontSize:27,fontWeight:FontWeight.bold,color:Colors.green,),
                              textAlign: TextAlign.center,),
                            const SizedBox(height:30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'               why me? why now? \n''why me? why now? These are the questions that depressed people do not stop repeating from time to time.\n'
                                        'To understand the causes of depression, researchers have to go a very long way, and often there are many ways that push a person between the clutches of depression.''\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:50),
                      Card(
                        child: Column(
                          children: [
                            const Text('\n' 'Factors affecting depression',
                              style: TextStyle(fontSize:27, fontWeight:FontWeight.bold,color: Colors.green),),
                            const SizedBox(height:30,),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/2051/2051945.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Text('\n'' A.Factors that make you susceptible to depression\n',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.7,letterSpacing: 1.0, fontSize:20),
                            ),
                            const Text(  '1. Genes\n',
                              style: TextStyle(fontSize:27, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3419/3419137.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:  '\nGenes (the biological codes you inherit from your parents)'
                                        'An important role in depression, but the genes that are involved in this blindness are many, and scientists are unable to understand precisely how it works\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////////
                            const Text( '2. Personal\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1077/1077012.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '\nA group of people with a certain personality is not exposed to depression, but obsessive, assertive, cruel, and religious people hide their feelings, in addition to those who worry quickly are more likely than others to develop depression\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////////
                            const Text(      ' 3. Family environment\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/745/745205.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '\nLoss of a parent during childhood Studies have shown that people who lost their mother as children are more at risk of developing depression than others.\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////////
                            const Text( ' 4. Type of Breeding\n',
                              style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/2219/2219802.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:    '\nPsychologists claim that demanding and decisive parents who consider success a guaranteed thing and are upset by failure, no matter how small, may push their children to the brink of depression in the future.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:50),
                      Card(
                        child: Column(
                          children:[
                            const SizedBox(height:30,),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/7145/7145266.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            const Text('\n''  B.Factors that may increase the risk of depression :-\n',
                              style: TextStyle(fontSize:20, fontWeight:FontWeight.bold,color: Colors.green),),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'  genes\n''  Personal\n''   Thinking patterns\n''   Limited capacity Pot control cans\n'
                                        '   Self pressure and life matters\n''   physical illness\n''   Decreased exposure to daylight\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ///////////////////
                            const SizedBox(height:30,),
                            const Image(
                              image: NetworkImage("https://cdn-icons-png.flaticon.com/128/7148/7148805.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            const Text('\n'  '  C.Factors that may trigger depression :-\n',
                              style:  TextStyle(fontSize:20, fontWeight:FontWeight.bold,color: Colors.green),),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:   '  Stress\n' '  physical illness \n''  Medicine\n ',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:50),
                      Card(
                        child: Column(
                          children:[
                            const SizedBox(height: 30,),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3521/3521815.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(text:  '       Patterns of thinking''\n',
                                      style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                                    TextSpan(text: '\nThe American psychotherapist Aaron Beck described the common thinking patterns among humans in cases of depression, which I believe play an important role in exacerbating these cases.\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ///////////////////
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/2855/2855027.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(text:'     inability to control fate\n',
                                      style: TextStyle(fontSize:25, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                                    TextSpan(text:   '\nSome specialists believe that religious people who face conditions for a long period of time that they are unable to overcome are vulnerable to depression.\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ///////////////////
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/2707/2707234.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(text:'\nLong-term illnesses that lead to disability\n',
                                      style: TextStyle(fontSize:20, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                                    TextSpan(text:    '\nLack of comfort, independence, safety and inability to move are all factors that push a person to the brink of depression.\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:40),
                      Card(
                        child: Column(
                          children: [
                            const SizedBox(height: 30,),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/7420/7420374.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(text:  '\nThe top ten stressful things in life :\n\n',
                                      style: TextStyle(fontSize:20, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                                    TextSpan(text:  '  1. The death of the wife/husband\n''  2. Divorce\n''  3. Marital separation\n' '  4. Prison\n'
                                        '  5. The death of a close friend\n''  6. Injury or illness\n' '  7. Marriage\n''  8. Job Loss\n' '  9. Reconciliation between spouses\n'
                                        '  10 retirement',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ////////////////////
                            const SizedBox(height: 30,),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/2167/2167018.png'),width:200, height:200,fit:BoxFit.fill),
                            Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(text:  'Some diseases associated with depression :\n\n',
                                    style: TextStyle(fontSize:20, height: 1.7, fontWeight:FontWeight.bold, letterSpacing: 1.0,color: Colors.green),),
                                  TextSpan(text:'    1.Acreage\n''    2.Addison s disease or primary adrenal insufficiency\n''   3.Consuming prohibited drinks: a direct effect on the brain and destruction for life\n''   4.Brain abscess\n' '   5. hemorrhage\n''   6.Brain tumors\n''   7.Chronic fatigue syndrome\n'
                                      '   8.Crushing s syndrome\n''   9.dementia\n''   10.diabetes\n''   11.encephalitis disease\n'
                                      '  12.Brain injury\n''  13.Heart problems\n''   14.Overactivity of the parathyroid glands\n'  '   15.Overactivity of the parathyroid glands\n'
                                      '   16.pituitary gland activity\n''   17.Thyroid inactivity\n''   18.Multiple sclerosis\n' '   19.Parkinson s disease\n' '   20.Severe head injury\n''   21.tuberculosis or meningitis\n' '   22.Vitamin deficiency\n'
                                      '   23.Viral illness (including influenza and glandular fever)\n''   24.Water balance problems (low salt content high or low calcium in the body).',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                  ),
                                ],
                              ),
                            ),
                            /////////////////////
                            const SizedBox(height: 30,),
                            const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1546/1546140.png'),width:200, height:200,fit:BoxFit.fill),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:'\nMedications Some medications cause depression, but that does not mean that the patient stops taking them without consulting his doctor. In fact, these medications do not usually cause depression, and it may usually be due to other reasons.\n',
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.7,letterSpacing: 1.0, fontSize:20),),
                                    TextSpan(text:  '\n''\n' 'Some medicines that cause depression\n''Medicines used to treat epilepsy\n'' Anti-high blood pressure medications\n'
                                        'Antimalarials - mefloquine (Ryam)\n''Anti-Parkinsonian drugs\n''(Some) chemotherapy drugs used in the treatment of''cancer diseases\n'
                                        'Digitalis (heart)\n''Diuretics (heart and blood pressure)\n''Interferon-alpha used to treat viral hepatitis\n'
                                        'sedatives\n''Steroid treatment (chest attack, inflammation)\n''joints, etc.)\n'
                                      , style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ////////////////////
                          ],),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,

                      ),
                      const SizedBox(height:40),
                      Card(
                        child: Column(
                          children:[
                            const SizedBox(height:40,),
                            const Text(
                              'Types of Depression ?',
                              style:TextStyle(fontSize:27, fontWeight:FontWeight.bold,color: Colors.green,),
                              textAlign: TextAlign.center,
                            ),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/3588/3588364.png"),
                              height:200, width:200,fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '\nWhen you visit a doctor, counselor, or other specialist, he may use a variety of terms to describe your illness. Some of these terms are used to describe your disease. Some of these terms have overlapping meanings. However, in this book, I have used specific terms, which are mild depression, moderate depression, and severe depression, and each of them is clear and has characteristics.\n'
                                      , style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   1. Mild Depression\n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/7145/7145235.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '\nWhen suffering from mild depression, a person suffers from irritable mood from time to time and usually begins to get sick after a stressful event. The patient becomes anxious and becomes frustrated. In fact, lifestyle changes are often enough to cause this type of depression.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   2. Moderate Depression\n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/6203/6203156.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:    '\n''When a person suffers from moderate depression, his mood is permanently disturbed, and some symptoms of a physical illness appear on him. Note that these symptoms differ from one person to another and do not cause changes in the lifestyle alone. This type of depression often requires medical help when suffering from moderate depression.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   3. Recurring Depression\n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/4897/4897191.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '\n' 'Doctors use this term to talk about a person who has gone through more than one stage of depression. It is true that they still use mild, moderate, and severe depression, but they are used to attaching it to “recurrent” when a particular person recovers from moderate depression to suffer after years of mild depression and doctors say that he suffers from recurrent depression Currently light.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   4. Chronic Depression\n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green,),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/4576/4576621.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text:  '\nCopts use the term chronic depression to talk about the depression that accompanies a particular person for a long period of time, but I do not mean that this depression is severe or dangerous. Usually, doctors use this term to denote a depression that has lasted for more than two years.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   5. Intractable Depression\n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green,),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/5684/5684435.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '\n' 'This term is usually used to denote depression, which they have tried hard to treat with antidepressant drugs without the patient completely recovering from it.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   6. Endogenous Depression\n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green,),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/4576/4576659.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:'\n' 'The causes of internal depression have not been determined, and it is usually a severe condition that leaves a person with physical symptoms, including weight loss and appetite, early awakening, the irritable mood in the morning, and one does not get rid of depression until after undergoing appropriate treatment.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   7. Irritable Depression\n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green,),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/7145/7145141.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:'\n' 'This term is used to denote the symptoms of this type of depression, which throws a person into a cycle of anxiety, fear, and fatigue.\n'
                                      ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),],
                                ),
                              ),
                            ),
                            //////////////
                            const Text('\n'  '   8.Organic Depression \n',
                              style: TextStyle(fontSize:25, fontWeight:FontWeight.bold,color: Colors.green),),
                            const Image(
                              image:NetworkImage("https://cdn-icons-png.flaticon.com/128/7081/7081237.png"),
                              height:200, width:200, fit:BoxFit.fill,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:    '\n' 'Doctors give this name to the name depression that results from a physical illness or a specific medication.\n'
                                      , style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(height:40),
                    ],

                  ),
                ),
              ),
            ]
        ),



      ),
    );
  }
}
