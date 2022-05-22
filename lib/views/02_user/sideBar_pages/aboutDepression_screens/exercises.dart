
import 'package:flutter/material.dart';
import 'dart:async';
class Exercises extends StatefulWidget {
  const Exercises({Key? key}) : super(key: key);


  @override
  State<Exercises> createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  int counter1 = 10, counter2=10,counter3=10,counter4=10;
  late Timer timer1, timer2,timer3,timer4;

  void startTimer1() {
    counter1 = 10;
    timer1 = Timer.periodic(const Duration(seconds: 1), (timer1) {
      if (counter1 > 0) {
        setState(() {
          counter1--;
        });
      } else {
        timer1.cancel();
      }
    });
  }
  void startTimer2() {
    counter2 = 10;
    timer2 = Timer.periodic(const Duration(seconds: 1), (timer2) {
      if (counter2 > 0) {
        setState(() {
          counter2--;
        });
      } else {
        timer2.cancel();
      }
    });
  }
  void startTimer3() {
    counter3 = 10;
    timer3 = Timer.periodic(const Duration(seconds: 1), (timer3) {
      if (counter3 > 0) {
        setState(() {
          counter3--;
        });
      } else {
        timer3.cancel();
      }
    });
  }
  void startTimer4() {
    counter4 = 10;
    timer4= Timer.periodic(const Duration(seconds: 1), (timer4) {
      if (counter4 > 0) {
        setState(() {
          counter4--;
        });
      } else {
        timer4.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title:const Text('Exercises',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
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
                  mainAxisAlignment:MainAxisAlignment.center,

                  children:[
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child:Column(
                          children: const [
                            Image(
                              image : NetworkImage('https://c.tenor.com/gI-8qCUEko8AAAAS/pushup.gif'),
                              width:250, fit:BoxFit.fill,
                            )

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(22)),
                          color: Colors.green.withOpacity(0.6),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 8,
                              blurRadius: 7,
                              offset: const Offset(0, .5), // changes position of shadow
                            ),
                          ],
                        ),
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$counter1',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:Theme.of(context).textTheme.bodyText1?.color,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            startTimer1();
                          },
                          child: const Text('Start Timer'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            timer1.cancel();
                          },
                          child: const Text('Pause'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              timer1.cancel();
                              counter1 = 10;
                            });
                          },
                          child: const Text('Reset'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),

                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child:Column(
                          children: const [
                            Image(
                              image : NetworkImage('https://i.pinimg.com/564x/0a/90/76/0a9076bac2fe839ab177f8c42f389e39.jpg'),
                              width:250,
                              fit:BoxFit.fill,
                            )

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(22)),
                          color: Colors.green.withOpacity(0.6),
                          // color: Colors.purpleAccent[100].withOpacity(0.6),
                          // color: Colors.teal[800].withOpacity(0.6),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 8,
                              blurRadius: 7,
                              offset: const Offset(0, .5), // changes position of shadow
                            ),
                          ],
                        ),
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$counter2',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:Theme.of(context).textTheme.bodyText1?.color,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            startTimer2();
                          },
                          child: const Text('Start Timer'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            timer2.cancel();
                          },
                          child: const Text('Pause'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              timer2.cancel();
                              counter2 = 10;
                            });
                          },
                          child: const Text('Reset'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),

                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child:Column(
                          children: const [
                            Image(
                              image : NetworkImage('https://i.pinimg.com/originals/02/b6/2b/02b62b7ee1484dcb9331297658803a9f.gif'),
                              width:250,
                              fit:BoxFit.fill,
                            )

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(22)),
                          color: Colors.green.withOpacity(0.6),
                          // color: Colors.purpleAccent[100].withOpacity(0.6),
                          // color: Colors.teal[800].withOpacity(0.6),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 8,
                              blurRadius: 7,
                              offset: const Offset(0, .5), // changes position of shadow
                            ),
                          ],
                        ),
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$counter3',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:Theme.of(context).textTheme.bodyText1?.color,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            startTimer3();
                          },
                          child: const Text('Start Timer'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            timer3.cancel();
                          },
                          child: const Text('Pause'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              timer3.cancel();
                              counter3 = 10;
                            });
                          },
                          child: const Text('Reset'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),

                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child:Column(
                          children: const [
                            Image(
                              image : NetworkImage('https://i.pinimg.com/originals/47/03/09/4703093a70ba47001bf2c86319aae091.gif'),
                              width:250,
                              fit:BoxFit.fill,
                            )

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(22)),
                          color: Colors.green.withOpacity(0.6),
                          // color: Colors.purpleAccent[100].withOpacity(0.6),
                          // color: Colors.teal[800].withOpacity(0.6),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 8,
                              blurRadius: 7,
                              offset: const Offset(0, .5), // changes position of shadow
                            ),
                          ],
                        ),
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$counter4',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:Theme.of(context).textTheme.bodyText1?.color,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            startTimer4();
                          },
                          child: const Text('Start Timer'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            timer4.cancel();
                          },
                          child: const Text('Pause'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              timer4.cancel();
                              counter4 = 10;
                            });
                          },
                          child: const Text('Reset'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),

                        )
                      ],
                    ),

                  ],

                ),
              ),
            ),
          ]
      ),

    );



  }
}
