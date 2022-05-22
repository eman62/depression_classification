
import 'package:flutter/material.dart';
class Treament extends StatefulWidget {
  const Treament({Key? key}) : super(key: key);


  @override
  State<Treament> createState() => TreatmentState();
}

class TreatmentState extends State<Treament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title:const Text('Treatment', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),),
        backgroundColor:Colors.green,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body:Column(
        children:[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection:Axis.vertical,
              child: Column(
                children:[
                  Container(
                    //  margin: EdgeInsets.all(12.0),
                    child: Column(
                      //mainAxisAlignment:MainAxisAlignment.center,
                      children:const [
                        Image(image : NetworkImage('https://www.ra2ed.com/photos/900x675/2MEDI1.jpg'),
                          //width:250,
                          fit:BoxFit.fill,
                        ),
                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(18),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text('How do you help yourself ?',
                          style:TextStyle(fontSize:25, color:Colors.blueGrey,fontWeight:FontWeight.bold,),),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3997/3997872.png'),
                          fit:BoxFit.fill,width:200, height:200,),
                        const SizedBox(height:30,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\nAsk your doctor s help \n \n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),

                              TextSpan(text: 'Some people get over mild depression by doing so using self-help measures. The self-help plans are variedprovided by doctors, or which can be obtained online.'
                                  'Even if the depressed patient uses self-help techniques,It is better to visit a doctor for several reasons, for example, he may'
                                  'about a physical illness, and a doctor can Depression is caused bySelf-help adopted by the patient or not. He assesses his condition and can then provide an independent view that confirms the effectiveness of\n',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn.iconscout.com/icon/premium/png-64-thumb/high-confidence-3383790-2812143.png'),
                          fit:BoxFit.fill,width:300, height:300,),
                        const SizedBox(height:30,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Be prepared to face difficulties \n \n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text:'Some people become depressed because of a particular loss. from here that it One can prepare oneself to face the change that one knows for sure'
                                  'will happen in his life. Possible things that could lead to . include: social whenHaving depression, for example, losing support'
                                  'Someone means university, loss of freedom or a certain professional position When a woman asks for maternity leave, or loses the routine of work and communication'
                                  'Social when referring to retirement, and so on. Hence, it is not surprising to mention that depression rates are very high'
                                  'in the aforementioned stages.In fact, one can use one of these two methods'
                                  'To reduce stress from a potential loss:\n'
                                  '1. To remain open and aware of the possibility of facing a particular problem\n'
                                  '2. To be prepared for any possible change'
                                , style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color),),
                            ],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3050/3050525.png'),
                          fit:BoxFit.fill, width:200, height:200,),
                        const SizedBox(height:30,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\nStay in touch with a specific group \n \n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text:'Helping others and joining a particular group that deals with these matters'
                                  'It will undoubtedly bring you much good. In this regard, offers Your doctor gives you some information about these groups in the area you are inreside in it. In addition, some private groups dedicate their time'
                                  'and efforts to provide advice over the phone or directly in case did not wish to be contacted with your doctor. This is provided'
                                  'Associations already help All aspects of life are valuable, especially since they cover Some of them support you'
                                  'Post-depressive episodes separation from a partner, Some of them will help you Times of grief and mourning. \n \n'
                                , style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color),),
                            ],
                          ),
                        ),
                        const Image(image: NetworkImage('https://www.psychosissucks.ca/wp-content/uploads/2022/02/medications.png'),
                          width:200, height:200,fit:BoxFit.fill,),
                        const SizedBox(height:30,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Take care \n   ', style:TextStyle(fontSize:25, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                            ],
                          ),

                        ),

                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/706/706195.png'),
                          width:200, height:200,fit:BoxFit.fill,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\n1-Food and nutrition\n \n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.w500),),
                              TextSpan(text: 'Your appetite may not be great, but you should always You eat regularly. And if you feel like you cant eat a mealYou can t eat a meal'
                                  'Try to make up for it with balanced snacks. And always remember that when you refrain from eating rich food, you will not be able to regain your strength, you will enter a vicious cycle in which your condition will worsen more and more. Sometimes you may feel that you are really unable to eat appropriate food or prepare'
                                  'a meal, in that you are effectively unable to eat food sometimes In this case, you have to buy a food alternative from the pharmacy without the need for a prescription, and these alternatives are a liquid that contains food It is daily and often easy to prepare. \n\n',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const Image(image: NetworkImage('https://pngimage.net/wp-content/uploads/2018/06/prohibido-bebidas-alcoholicas-png-2-300x200.png'),
                          width:200, height:200,fit:BoxFit.fill,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\n\n2.Forbidden drinks\n \n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.w500),),
                              TextSpan(text: 'Remember that forbidden drinks will not help you overcome your problems'
                                  'On the contrary, it will increase your depression and turn into a habit that eliminates'
                                  'your life. Also, forbidden drinks increase inhibition, and can lead to'
                                  'Suicidal thoughts, so you should always beware'
                                  'Contraindicated, especially if you are taking antidepressants. \n\n',
                                  style: TextStyle(fontSize:20, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),

                        ),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/3094/3094845.png'),
                          width:200, height:200,fit:BoxFit.fill,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\n\n3.sleep\n\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.w500),),
                              TextSpan(text: 'Sleep disturbances are common in people with of depression, especially patients who are prone to insomnia. And it is hidden'
                                  'Lack of sleep prevents a person from gathering the energy necessary to fight depression.',
                                  style: TextStyle(fontSize:20, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(18),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow:const [
                          BoxShadow(
                            color:Colors.grey,
                            blurRadius:10,
                            offset: Offset(0, 2),
                          ),
                        ]
                    ),
                  ),
                  const SizedBox(height:30,),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text('Treatment ?',
                          style:TextStyle(fontSize:25, color:Colors.blueGrey,fontWeight:FontWeight.bold,),),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://t3.ftcdn.net/jpg/04/65/95/26/240_F_465952617_CYZDj9evsT31coU1NIBPadYVUXGPtgJN.jpg'),
                          width:200, height:200,   fit:BoxFit.fill,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\nTalk to your doctor \n\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text:  'Go to a doctor if treatment methods do not come result, or if your depression is severe. I request For help or call the emergency and accident number at'
                                  'The local hospital in case you become severely depressed or have a headachesuicidal thoughts In fact, a GP helps to get rid of Depression is:\n'
                                  '- He has a lot of information about depression\n'
                                  '- He can listen to you\n'
                                  '- Knows you and knows your medical record\n'
                                  '- He can make sure that there is an organic problem that may be the cause of thisdepression\n'
                                  '- He can perform some procedures and start therapy sessionsHelp you heal',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3588/3588472.png'),
                          width:200, height:200,fit:BoxFit.fill,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\nTMedical therapies - Speech-based therapies \n\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text:  'Psychological therapies are the most popular type of treatment for treating conditionsDepression, because it does not require medication nor does it have an intuitive meaning . It may seem like sitting down and revealing the things that weigh you down'
                                  'right thing It also seems like diving into the depths of things and discovering the causes Feelings when you feel depressed for no reason'
                                  'It s also clear thats right, but you can sometimes be very depressed To the point that you won t be able to think clearly, and so tired that you wont be able to start psychotherapy Psychological treatments often require a long time and real commitment, and you should always be aware that they are not an easy option and require a lot of energy in case your depression is severe. You may need to take some antidepressant medication before you start psychiatric treatment. In the same vein, you should see your doctor to discuss solutions available in your area.'
                                  'There are many types of psychotherapy based on many theories\n'
                                  '1 . Short-term treatments that last up to six weeks\n'
                                  '2 . Long-term treatments lasting more than six weeks\n'
                                  'Short-term treatments consist of four to twenty weekly sessions, each lasting one hour, while long-term treatments consist of 50 sessions.',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/4661/4661703.png'),
                          width:200, height:200,   fit:BoxFit.fill,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\nCognitive therapy \n\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text:  'Cognitive therapy yields effective results when used to treat patterns depressive thinking The attending physician asks you for the purpose of this treatment'
                                  'Record the negative thoughts that come to your mind and take the way you want Think about it. This way you will help yourself to challenge'
                                  'Your unrealistically negative thoughts. Over 10 to 20 sessions Weekly, a therapist tries to help you stop thinking about things'
                                  'my depression; This method has proven to be effective in treating depression Medium and severe. In addition, this method may lead to'
                                  'Results last longer than over the counter medications for depression. Also, it can be used with antidepressants. by adopting this treatment technique. You have to think seriously.',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3588/3588375.png'),
                          fit:BoxFit.fill,width:200, height:200,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\n\nBehavioral therapy \n\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text: 'His treatment differs from cognitive therapy in that it focuses on What we do is more than what we think, helps you unlearn'
                                  'It is more depressing in terms of behavior than in terms of behaviour. And from This is where a behavior change program aims to help you sleep better'
                                  'It is better to pay more attention to yourself and to your diet, and it pushes you forward. It is no secret that some people They find in this type of treatment the first steps of recovery.',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(18),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow:const [
                          BoxShadow(
                            color:Colors.grey,
                            blurRadius:10,
                            offset: Offset(0, 2),
                          ),
                        ]
                    ),
                  ),
                  const SizedBox(height:30,),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text('Pharmaceutical ?',
                          style:TextStyle(fontSize:25, color:Colors.blueGrey,fontWeight:FontWeight.bold,),),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn.iconscout.com/icon/premium/png-64-thumb/pharmaceutical-engineering-4304079-3571981.png'),width:200, height:200,fit:BoxFit.fill,),
                        const SizedBox(height:50,),
                        Text('What are antidepressants ?',textAlign: TextAlign.left,
                          style:TextStyle(fontSize:25, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),

                        ),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/991/991884.png'),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text:  '\nAntidepressants may be effective when treating Depression. When the patient continues to take it according to the doses that'
                                  'As prescribed by the doctor, he begins to recover from his symptoms within the period that these medicines require about six weeks or more To give complete results. frequently'
                                  'The patient does not take this type of medication for another six months after the depression crisis ends to prevent Relapse before it stops gradually'
                                  'Doctors usually only advise people who have had a crisis Depression, taking the same medication for at least one year, While they advise people who have had more than one crisis to take the drug for at least two years. This has beenTake antidepressant medication for a long time. In fact, you leave'
                                  'Best anti-inflammatory drug Moderate or severe depression.',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1488/1488096.png'),width:200, height:200,fit:BoxFit.fill),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\n\nWill I become addicted ?\n\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text: 'Some people think that they will become addicted to taking antidepressants, but this is unlikely. Medicines are only for people with depression, and therefore they do not leave any effect on healthy people. Rather, they do not raise morale, and they often market some types of drugs that raise morale and that a person may become addicted to on the black market, but I do not say that it cannot happen in relation to antidepressant drugs.',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1207/1207890.png'),
                          width:200,fit:BoxFit.fill, height:200,),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\n\nHow do antidepressants work?\n\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold),),
                              TextSpan(text: 'When a person is depressed, a number of physical changes occur in the body that affect his daily functions and antidepressants help to restore things to normal. With them are messages, provided that there is a sufficient amount of neurotransmitters that are transmitted back and forth to the brain cells that produced them.',
                                  style: TextStyle(fontSize:20, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),],
                          ),
                        ),
                        const SizedBox(height:30,),
                        const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/4228/4228742.png'),width:400, height:200,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '\n''Different types of antidepressants\n\n', style:TextStyle(fontSize:22, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold,),),
                              TextSpan(text: 'Tricyclic antidepressants\n\n', style:TextStyle(fontSize:20, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold,),),
                              TextSpan(text: 'Doctors try to stay away from this type of medication when prescribing a treatment for depression, especially since studies have shown that a patient can stop taking other medications as a result of severe side effects. Usually, the doses of this type of medication in excess, excluding lofipramine, are more dangerous than doses of selective serotonin reuptake inhibitors. Known as SSR. \n\n',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),

                            ],

                          ),
                        ),
                        const Image(image: NetworkImage('https://kidneydiseaseclinic.net/assets/images/Tricyclic%20Antidepressants.jpg'),
                          width:500, height:300,fit:BoxFit.fill,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: ' \n''\nSelective serotonin reuptake inhibitors known as SSR\n''\n', style:TextStyle(fontSize:23, color:Theme.of(context).textTheme.bodyText1?.color,fontWeight:FontWeight.bold,),),
                              TextSpan(text: 'These drugs work just like tricyclic drugs by blocking the transporters, which is serotonin. These drugs are considered antidepressants, and experiments have shown that they have some side effects less than those left by tricyclic drugs, but studies have proven that their effects are completely different from the effects of tricyclic drugs, they do not have an advantage Calming, does not cause weight gain and does not affect the heart as tricyclic drugs do.\n''\n',
                                  style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.0,color:Theme.of(context).textTheme.bodyText1?.color)),

                            ],

                          ),
                        ),
                        const Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGiO9oD3hRZ_XdgsNATJHxWBJHejxCDit0xQ&usqp=CAU'),
                          width:500, height:300,fit:BoxFit.fill,
                        ),
                        Text(' \n''Similar to the tricyclic drugs, one must be careful in conflict situations and realize that they cause intestinal troubles in the beginning, in addition to the possibility of diarrhea and vomiting, as well as headache, fatigue and anxiety, but despite that when things reach additional doses,'
                            'these drugs are considered safer Tricyclic medicine. \n' 'Unlike tricyclic drugs, selective serotonin reuptake inhibitors (SSRs) have not been popular for a long time, and research has shown that people who take these inhibitors are less likely to stop taking these drugs due to side effects than those who take tricyclic drugs, so the authorities advise using the TCAs. Selective serotonin reabsorption.',
                            style: TextStyle(fontSize:18, height: 1.5,letterSpacing: 1.7,color:Theme.of(context).textTheme.bodyText1?.color)),
                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(18),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow:const [
                          BoxShadow(
                            color:Colors.grey,
                            blurRadius:10,
                            offset: Offset(0, 2),
                          ),
                        ]
                    ),
                  ),

                ],),
            ),
          ),
        ],
      ),
    );
  }
}
