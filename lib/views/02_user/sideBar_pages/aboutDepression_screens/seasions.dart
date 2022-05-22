
import 'package:flutter/material.dart';

class Sessions extends StatefulWidget {
  const Sessions({Key? key}) : super(key: key);


  @override
  State<Sessions> createState() => SessionsState();
}

class SessionsState extends State<Sessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Sessions',
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
        children:[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection:Axis.vertical,
              child: Column(
                children:[
                  Container(
                    child: Column(
                      //mainAxisAlignment:MainAxisAlignment.center,
                      children:const [
                        Image(
                            image:NetworkImage('https://images.citizenmatters.in/wp-content/uploads/sites/14/2017/11/29170317/Yeshwanthpur.png'),
                            fit:BoxFit.fill),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      //mainAxisAlignment:MainAxisAlignment.center,
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: " Dr. Center Ahmed Said Nasr City ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " El-Nasr Rd Street, Qesm Awal, Nasr City \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " https://m.facebook.com/doctornafsy/ \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "01022630411 \n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: "Rakhawy hospital mental health ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Street 12 from Street 10 from street 9، Street 10, El Mokattam, \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " http://www.rakhawyhospital.org/ \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "01211113073 \n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: " Psychiatry Center                        ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "37FH+J5W, Private Corridor, El-Demerdash Hospital, El-Mohamady, El Weili, Cairo Governorate\n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " https://www.innfrad.com/\n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "0224346918 \n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: " Nile Clinic for Mental Health       ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " 40 Misr Helwan Agricultural Rd., MAADI, Maadi, Cairo, Cairo Governorate \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " http://www.nilesanatorium.com/\n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "0223581433 \n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: " Dr. Maha psychiatric clinic          ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "485J+283, Sheikh Mohamed Refaat, El Nozha, El Nozha, Cairo Governorate \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " http://mahanafsy.wordpress.com/\n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "01158795879 \n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: " Maadi Palace Hospital                 ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " 13 A, Corniche El Nil, Qism Maadi, Cairo Governorate \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "0223581051 \n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: " Ishraq Psychiatric Hospital           ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " 3 Al Arqam Ibn Al Arqam, Al Miraj Al Alawi, Maadi \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " https://eshraqhospital.com/ \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "01003222228\n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children:[
                        RichText(
                          text: TextSpan(
                            children: const [

                              TextSpan(
                                text: "Dr.Ahmed Jamal Madi                 ",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.directions, size: 50,color:Colors.blue,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock, size: 50,color:Colors.blue,),
                              ),
                              TextSpan(text:"\n"),
                              WidgetSpan(
                                child: Icon(Icons.location_on, size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "41 El-Imam Ali St.El-Bostan,Heliopolis Cairo\n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.access_time,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " Closed ⋅ Opens 5PM bUpdated \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.vpn_lock,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: " https://abouelazayem.com/ \n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.web_asset_outlined,  size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "www.facebook.com/abouelazayem/\n",
                              ),
                              WidgetSpan(
                                child: Icon(Icons.phone,size: 30,color:Colors.blue,),
                              ),
                              TextSpan(
                                text: "01022575701 \n",
                              ),
                            ],
                            style: TextStyle(
                              color:Theme.of(context).textTheme.bodyText1?.color,
                              fontSize:20,
                              height: 1.8,
                            ),
                          ),

                        ),

                      ],
                    ),
                    decoration:BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(18)),
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

                ],),
            ),
          ),
        ],
      ),

    );
  }
}
