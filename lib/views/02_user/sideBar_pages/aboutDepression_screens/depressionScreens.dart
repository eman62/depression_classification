import 'package:flutter/material.dart';
import 'package:save/views/02_user/sideBar_pages/aboutDepression_screens/depression.dart';
import 'package:save/views/02_user/sideBar_pages/aboutDepression_screens/exercises.dart';
import 'package:save/views/02_user/sideBar_pages/aboutDepression_screens/people.dart';
import 'package:save/views/02_user/sideBar_pages/aboutDepression_screens/seasions.dart';
import 'package:save/views/02_user/sideBar_pages/aboutDepression_screens/sports.dart';
import 'package:save/views/02_user/sideBar_pages/aboutDepression_screens/treatment.dart';


class screen extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<screen> with SingleTickerProviderStateMixin{
  get decoration => null;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Self Care', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),),
      ),
      body:Column(
        children: [
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child:GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Depression()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,

                          children:const [
                            Image(
                                image:NetworkImage('https://cdn-icons-png.flaticon.com/128/3603/3603740.png'),
                                height:90, width: 90, color:Colors.white, fit:BoxFit.fill
                            ),
                            SizedBox(
                              height:15,
                            ),
                            Text(
                              'Depression',
                              style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color: Colors.green,
                        ),

                      ),
                    ),),
                  const SizedBox(
                    width:20,
                  ),
                  Expanded(
                    child:GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Treament()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: const [
                            Image(
                              image:NetworkImage('https://cdn-icons-png.flaticon.com/128/1971/1971503.png'),
                              height:90, width: 90, color:Colors.white,fit:BoxFit.fill,
                            ),
                            SizedBox(
                              height:15,
                            ),
                            Text(
                              'Treatment',
                              style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child:GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>People()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: const [
                            Image(
                              image:NetworkImage('https://cdn-icons-png.flaticon.com/128/681/681494.png'),
                              height:90, width: 90, color:Colors.white,fit:BoxFit.fill,
                            ),
                            SizedBox(
                              height:15,
                            ),
                            Text(
                              'People',
                              style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width:20,
                  ),
                  Expanded(
                    child:GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Sessions()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: const [
                            Image(
                              image:NetworkImage('https://cdn-icons-png.flaticon.com/128/2807/2807685.png'),
                              height:90, width: 90, color:Colors.white,fit:BoxFit.fill,
                            ),
                            SizedBox(
                              height:15,
                            ),
                            Text(
                              'Sessions',
                              style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child:GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Exercises()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: const [
                            Image(
                              image:NetworkImage('https://cdn-icons-png.flaticon.com/128/3022/3022315.png'),
                              height:90, width: 90, color:Colors.white,fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height:15,
                            ),
                            Text(
                              'Exercises',
                              style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width:20,
                  ),
                  Expanded(
                    child:GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Sports()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: const [
                            Image(
                              image:NetworkImage('https://cdn-icons-png.flaticon.com/128/94/94183.png'),
                              height:90, width: 90, color:Colors.white,fit:BoxFit.fill,
                            ),
                            SizedBox(
                              height:15,
                            ),
                            Text(
                              'Sports',
                              style:TextStyle(
                                fontSize:25,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}