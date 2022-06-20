
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
        title:const Text('People get rid of depression',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
                child: Column(
                    children :[
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            //mainAxisAlignment:MainAxisAlignment.center,
                            children:[
                              const Text(
                                '\nJeanette\n',
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '\nTo say that my life has been a upward challenge for the last 25 years would be a complete understatement.\n'
                                      '\nI dealt with depression for the last few years which I am trying to cope with.'
                                      'So on a beautiful spring day Sept 1991 was supposed to be the most perfect day of my life. But unfortunately that’s when it first started. My depression worsened  over the next few years. I turned to the person that was supposed to support you and love you but had to deal with depression on my own.\n'
                                      '\nIt was a struggle for me so I told my GP what I was going through. She then wrote me out a script for antidepressants. I thought I was brave and powerful that I could deal with it on my own, so I did n’t take the medication. How wrong I was if only I took those antidepressants I would n’t of attempted my suicide in 2006. \n'
                                      '\nAfter an argument with my ex husband in 2006 I stormed out of work and said I could not bear this anymore. I grabbed my keys and took off. Not knowing what I was doing I texted my best friend to look after my children. I wrote a suicide note and then attempted to take my life. I was found two days later. I then spent the next three months on life support. Then doctors wanted to turn the machine off because they said that there was no way I could live and if I do, I’d be a complete vegetable all my life. I would never walk or be independent again. My best friend yelled at the doctors and said ‘NO’ she’s a fighter. Well I definitely proved the doctors wrong, because my friend had seen a flicker in my eye. I then started to breath for myself.\n '
                                      '\nIt has been a real struggle for me to try and get better and the next few years I know I have to get better for my faith and for my four children I have now.\n'
                                      '\nOne in three people actually suffer with depression. It could even be the person sitting next to you. If you see a person acting strange, depressed and or anxious, try to interact with them.\n'
                                      '\nA very close friend would go up to them and ask them out for a nice cup of coffee hoping they will spill the beans on what’s going on and show them that you care and that you will go with them to get the help that they need.\n'
                                      '\nIf we all put our heads together and be more loving and thoughtful towards each other, we can help tackle depression and suicide.\n '
                                  ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                ),
                              ),

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(
                        height:30,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            //mainAxisAlignment:MainAxisAlignment.center,
                            children:[
                              const Text(
                                '\nBill\n',
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.bold,
                                  color:Colors.green,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '\nI have been affected by depression and anxiety for around twenty years. That was when I suffered a total mental breakdown and lost everything I had including my wife, my children, my business and my mind. I ended up in a caravan park where I was “living on the gutters edge”.  I would hide inside the van for most of the day being too afraid to go outside in case I had to talk to people. My brain simply stopped working. I could n’t even get it together to make a cup of cup of coffee let alone make a meal.  It was so bad I hated waking up in the morning and often wished that I had n’t.\n'
                                      '\nI constantly had emotions of anxiety, fear, guilt, sadness and terror welling up from inside of me. It was the gut wrenching feeling from my stomach and ache in my heart I dreaded the most. Many times I thought about committing suicide and tried to figure out ways to do it.  On a day when it was really bad, I was seriously considering it when the phone rang and the voice simply said, “How are your going?”  “Terrible” I replied – and I’m sure the person could hear the despair in my voice.  “Where are you?” he said – “Stay there, don’t go anywhere else”. \n'
                                      '\nAbout ten minutes later, there was a knock on the caravan door. I went to open it and there was a stranger standing there. “Can I come in?” was all he said. That man simply talked to me about his life and what had happened for him. He told me how it took a long time to overcome his problem step-by-step and having faith and the belief that he would some day become well. I could see the similarities in my life and began to accept myself as being one of the many people that suffers from a mental condition. The stranger inspired me in two ways. Firstly, that if he could re-build his life it was proof that I could also get my life back together again. Secondly and more important, was that this man valued me sufficiently enough for him to leave work and come to see me.\n'
                                      '\nThis meant I must have been of some value to another person and I did n’t have the right to end my life. And it does n’t stop there. People suffering from mental conditions need support and encouragement to keep working on themselves. I’ve been using pressure points on myself to make the feelings of depression go away within a few minutes and I no longer have thoughts of suicide.\n'
                                  ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                ),
                              ),

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(
                        height:30,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            //mainAxisAlignment:MainAxisAlignment.center,
                            children:[
                              const Text(
                                '\nSteph\n',
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.bold,
                                  color:Colors.green,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '\nI have two black dogs. Sometimes I only have one. But once I see him, I know the other one will shortly follow. I don’t always have the black dogs with me. Some days I feel completely weightless, like I’m not carrying a burden. I’m so used to the black dogs being around. I feel guilty not having them. I worry if they are not with me they are with someone else. But when they are there I want them to leave. I wish they would die and never return. But they can not be killed.\n'
                                      '\nThe black dogs names are depression and anxiety. You never know when they are going to come back to their master. Although I am their master I have no control over them. They are constantly barking. Confusing me. I can’t think with them barking so loudly. The shame of owning these black dogs is real. You feel like they are a sign of weakness. You don’t want anyone knowing you have these black dogs. Especially dogs you can’t control. When you see friends, you put the music on loud, so they can’t hear the black dogs. You pull the curtain so they can’t see the black dogs. You’re so busy worrying about people seeing the black dogs, so worried the black dogs will escape and bite someone that you give up trying. You isolate yourself, wanting to be alone with them.\n'
                                      '\nThe dogs soon take over everything in your life. They take up all your time.  People who come over, you push away because you don’t want them to see the real side of you, the pain and shame you are feeling. If people see the dogs get defensive. You reassure people that “that they are OK” and “I have them trained and under control”. But you (alone) can never get control over them.  \n'
                                      '\nAll the things you used to enjoy are now pointless. The dogs distract you and ruin everything surrounding you. You don’t want anyone to be affect by you having the dogs. This is why you hide. When you finally admit to yourself that you need to get a trainer to help train the black dogs, they leave. You think the worst is over. They won’t come back.  But (for me) they always come back. They can come back at any time and who knows, the dogs maybe bigger and more viscous next time.\n'
                                      '\nSome days I just want to end it all, I have tried once, but luckily it was unsuccessful. I just want to have a day without the black dogs, or a day when I can fully control them. I am glad I am now getting help, because everyday it is getting better, and I am beginning to see a light at the end of the tunnel.  \n'
                                  ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                ),
                              ),

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),
                      const SizedBox(
                        height:30,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            //mainAxisAlignment:MainAxisAlignment.center,
                            children:[
                              const Text(
                                '\nIsabelle\n',
                                style:TextStyle(
                                  fontSize:25,
                                  fontWeight:FontWeight.bold,
                                  color:Colors.green,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '\nWhen I think of good mental health I think of being able to look at myself in the mirror everyday and say I\'m proud of who I am. I\'m happy in my skin and I\'m positive about who I am and what I say and do.\n '
                                      '\nHow easy do you think it is to be happy? Can we simply choose to be happy?  What happens when big life events happen? These events could be being bullied or someone you love being sick or dying or.....and this is the BIG one.....Donald Trump becoming president.\n'
                                      '\nSo what are some things that can go wrong with mental health?  Imagine waking up every day feeling like you can\'t live with yourself. Picture having no motivation or interest in anything. This is the reality for too many.\n'
                                      '\nAccording to the White Cloud foundation currently over 3 million Australians suffer from mental illness. 10,000 of these are young people.\n'
                                      '\nThe World Health organisation reports that over 350 million people suffer from depression. This is a more than serious issue. I am your youth, here is my voice and it is up to us to educate ourselves, protect ourselves and support others.\n'
                                      '\nI feel passionately about this subject. My cousin Lisa suffered from mental illness that started when she was my age. She fought her depression every day for 8 years. She looked after herself, she exercised, she sought medical treatment.\n'
                                      '\nShe battled long and hard on a quest to be at peace with herself and to be well. Unfortunately when she was 20 Lisa could fight no longer and she took her life.\n'
                                      '\nAs I get older and see more things I think about how brave she was and how desperate she was. It makes me want to scream and yell. \n'
                                      '\nMy well-loved uncle Glenn was Lisa\'s father. After she had taken her life he could n\'t live with her loss and the fact that he could n\'t help her and he too ended his life a year ago.\n'
                                      '\nI was 10 when that happened and it had more of an impact on me as I was older and I loved him. I felt like he was pretty quiet and I did n\'t get to know him as I wanted to. Depression is a thief it robbed me of him.\n'
                                      '\nBoth my cousin and uncle were young, had families that loved them, had all the support in the world and had so much to live for. They and so many others see no other way out.\n'
                                      '\nHowever, my voice is here to say that for anyone out there who suffers with a mental illness that this does n\'t have to be the outcome. Is there hope? Absolutely! Does sadness mean you are going to die?  Of course not! There is help out there and help has been given to many.\n'
                                      '\nSo what can we do to look after our mental health? Things like exercise, eating right, medication and talking to someone can help you feel better.\n'
                                      '\nIt might be a long journey but remember it never should end that way. The impacts on those left behind are huge.\n'
                                      '\nThere are lots of organisations such as Beyond Blue, The Black Dog Institute and Suicide Prevention Australia. That have a lot of tools to help you.\n'
                                      '\nWe need to tackle this problem early and often.\n'
                                      '\nGrown-ups….I beg you to educate yourselves. No family is immune. It does n\'t always happen to other people. We can\'t run away from this problem. We need to face it head on.\n'
                                      '\nI wanted to talk to you about this topic today because it is very dear to my heart. I don\'t want the same thing to happen to your family as what\'s happened to mine.\n'
                                      '\nOnce it is done it is done. You are special, you are unique, you cannot be replaced. Join me in the fight to look after our mental health and stop suicide. And finally, in the words of Donald Trump. ‘Depression!....You\'re fired‘.\n'
                                  ,style: Theme.of(context).textTheme.bodyText1!.copyWith( height: 1.5,letterSpacing: 1.0, fontSize:18),
                                ),
                              ),

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.grey[200],
                        elevation: 5,
                      ),

                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
