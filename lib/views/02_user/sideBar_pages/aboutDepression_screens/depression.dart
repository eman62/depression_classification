import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class deprssion extends StatefulWidget {

  @override
  State<deprssion> createState() => _deprssionState();
}

class _deprssionState extends State<deprssion> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'depression',
          ),
          backgroundColor:Colors.green,
          leading: BackButton(
            color: Colors.white,
          ),

        ),
        body:Column(
            children: [
              Expanded(
                child: Container(

                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://cdn-icons-png.flaticon.com/128/7145/7145217.png'),
                        fit:BoxFit.contain

                    ),
                  ),

                  child: SingleChildScrollView(
                    scrollDirection:Axis.vertical,

                    child: Column(
                      // mainAxisAlignment:MainAxisAlignment.center,
                      children:[
                        Container(
                          child: Column(
                            children:[
                              Text(
                                'what is depression?',
                                style:TextStyle(
                                  fontSize:30,
                                  fontWeight:FontWeight.bold,
                                  color:Colors.purple[900],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height:40,),
                              Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3603/3603734.png'),width:200, height:200,fit:BoxFit.fill),

                              SizedBox(height:25,),
                              Text(
                                '---The past forty years have '
                                    'witnessed an increase in cases of depression as a result of the lifestyle that dominates our lives today.'
                                    ' For many people, the world has become stressful, and fatigue can lead to depression.'
                                    ' In fact, the increase in divorce rates and crime rates is considered \n'
                                ,
                                style:TextStyle(
                                    fontSize:25,
                                    //fontWeight:FontWeight.bold,
                                    color:Colors.white,
                                    height: 1.2, // the height between text, default is 1.0
                                    letterSpacing: 2.0 // the white space between letter, default is 0.0
                                ),
                              ),
                              Text(
                                '--- A disease that affects the body and the mind \n is considered a disease that affects both the mind and the body.'
                                    ' Therefore, depressed people appear mental and physical symptoms. '
                                    'However, its true nature differs from one person to another,'
                                    ' and the symptoms of depression vary, so it appears evident to some and hidden to others.',
                                style:TextStyle(
                                  fontSize:25,
                                  //fontWeight:FontWeight.bold,
                                  color:Colors.white,
                                  // height: 1.2, // the height between text, default is 1.0
                                  // letterSpacing: 2.0 // the white space between letter, default is 0.0
                                ),
                              ),
                            ],),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),
                            // color: Colors.purpleAccent[100].withOpacity(0.6),
                            // color: Colors.teal[800].withOpacity(0.6),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:40),
                        Container(
                          child:Column(
                            children: [
                              Text(
                                'Symptoms of depression.\n In reality, the symptoms of psychological depression and the potential for stammering vary.\n'
                                    'Psychological symptoms.\nirritableLoss of interest in things you used to enjoy.\n anxiety.\n'
                                    ' Loss of ability to feel.\n delusion hallucination Suicidal thoughts.\n physical symptoms.\n'
                                    ' Loss or excess of Alhshaikh.\n overweight.\n exhaustion .\n Constipation .\n Loss of interest in sexual relations.\n',
                                style:TextStyle(
                                  fontSize:25,
                                  color:Colors.white,),

                              ),

                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),
                            // color: Colors.purpleAccent[100].withOpacity(0.6),
                            // color: Colors.teal[800].withOpacity(0.6),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),

                        ),
                        SizedBox(height:40),
                        Container(
                          child:Column(
                            children: [
                              Text(
                                '              Loss of ability to feel\n'
                                    'Some severely depressed people say that they completely lose the ability to feel. This symptom is one of the most common symptoms of depression\n'
                                    '                  gloomy thinking\n'
                                    'When you feel depressed, your thinking pattern changes and you see the world from a different perspective \n'
                                    '                    imagination\n'
                                    'When you are subjected to severe depression, your thinking distorts, and you lose your connection with reality, and your mind betrays you until you think that madness has taken away all that it took from you.\n'
                                    '                   suicidal thoughts \n'
                                    'When you are in the depths of depression, the past looks bad and bleak. Some people may think about suicide, even if these thoughts are just suicidal thoughts.\n'
                                    '                   sleep problems\n'
                                    'Sleep is a common problem among people with depression, and they often bear part of the fatigue that may affect them \n'
                                    '                   Anorexia\n'
                                    'When you feel depressed, you lose a lot of weight. If you lose interest in food, and if you eat some of it, it is flavorless.\n'
                                    '                  Deficiency in chemicals\n'
                                    '  Symptoms of depression may result from low levels of certain chemicals in the brain\n'
                                    '                  The role of hormones\n'
                                    'Hormones contribute significantly to depression\n'
                                    'How do neurons transmit signals?',
                                // textAlign:TextAlign.center,
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,
                                  // wordSpacing:6,
                                  //letterSpacing:5,

                                ),

                              ),



                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),
                            // color: Colors.purpleAccent[100].withOpacity(0.6),
                            // color: Colors.teal[800].withOpacity(0.6),


                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),

                        ),
                        SizedBox(height:50),
                        Container(
                          child: Column(
                            children:[
                              Text(
                                'causes of depression?',
                                style:TextStyle(
                                  fontSize:30,
                                  fontWeight:FontWeight.bold,
                                  color:Colors.purple[900],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height:40,),
                              Image(
                                image:NetworkImage("https://cdn-icons-png.flaticon.com/128/6203/6203193.png"),
                                height:200, width:200, color:Colors.white,fit:BoxFit.fill,),
                              Text(
                                '           why me? why now?  \n'

                                    'why me? why now? These are the questions that depressed people do not stop repeating from time to time.\n'

                                    'To understand the causes of depression, researchers have to go a very long way, and often there are many ways that push a person between the clutches of depression.  ',
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,
                                  // wordSpacing:6,
                                  //letterSpacing:5,

                                ),

                              ),


                            ],),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),
                            // color: Colors.purpleAccent[100].withOpacity(0.6),
                            // color: Colors.teal[800].withOpacity(0.6),


                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:50),
                        Container(
                          child: Column(
                            children:[
                              Text(
                                'Factors that make you susceptible to depression \n'
                                    '      genes:\n'
                                    'Genes (the biological codes you inherit from your parents)'
                                    'An important role in depression, but the genes that are involved in this blindness are many, and scientists are unable to understand precisely how it works\n'
                                    '    Personal\n'
                                    'A group of people with a certain personality is not exposed to depression, but obsessive, assertive, cruel, and religious people hide their feelings, in addition to those who worry quickly are more likely than others to develop depression\n'

                                    '     Family environment\n'
                                    ' Loss of a parent during childhood Studies have shown that people who lost their mother as children are more at risk of developing depression than others.\n'

                                    '   Type of Breeding\n'
                                    'Psychologists claim that demanding and decisive parents who consider success a guaranteed thing and are upset by failure, no matter how small, may push their children to the brink of depression in the future.\n'


                                    '               Factors affecting depression             \n'
                                    'Factors that may increase the risk of depression\n'
                                    'genes\n'
                                    'Personal\n'
                                    'sex\n'
                                    'Thinking patterns\n'
                                    'Limited capacity Pot control cans\n'
                                    'Self pressure and life matters\n'
                                    'physical illness\n'
                                    'Decreased exposure to daylight\n'

                                    '               Factors that may trigger depression\n'
                                    'Stress\n'
                                    'physical illness \n'
                                    'Medicine\n ',
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,
                                  // wordSpacing:6,
                                  //letterSpacing:5,

                                ),
                              ),
                              SizedBox(height:40,),

                            ],),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:50),
                        Container(
                          child: Column(
                            children:[
                              Text(
                                '---- Patterns of thinking'
                                    'The American psychotherapist Aaron Beck described the common thinking patterns among humans in cases of depression, which I believe play an important role in exacerbating these cases.\n'


                                    '  ----- The inability to control fate\n'

                                    'Some specialists believe that religious people who face conditions for a long period of time that they are unable to overcome are vulnerable to depression.'
                                    ' ----- Long-term illnesses that lead to disability\n'

                                    'Lack of comfort, independence, safety and inability to move are all factors that push a person to the brink of depression.',
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,
                                  // wordSpacing:6,
                                  //letterSpacing:5,

                                ),
                              ),
                              SizedBox(height:40,),

                            ],),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:40),
                        Container(
                          child: Column(
                            children:[
                              Text(
                                'The top ten stressful things in life\n'
                                    ' 1. The death of the wife/husband\n'
                                    '2. Divorce\n'
                                    '3. Marital separation\n'
                                    '4. Prison\n'
                                    '5. The death of a close friend\n'
                                    '6. Injury or illness\n'
                                    '7. Marriage\n'
                                    '8. Job Loss\n'
                                    '9. Reconciliation between spouses\n'
                                    '10 retirement\n',
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,


                                ),
                              ),
                              SizedBox(height:40,),
                              Text('Some diseases associated with depression\n'
                                  'Acromegaly\n'
                                  'Addison s disease or primary adrenal insufficiency\n'
                                  'Consuming prohibited drinks: a direct effect on the brain and destruction for life\n'
                                  'Brain abscess\n'
                                  'Brain hemorrhage\n'
                                  'Brain tumors\n'
                                  'Chronic fatigue syndrome\n'
                                  'Cushing s syndrome\n'
                                  'dementia\n'
                                  'diabetes\n'
                                  'encephalitis disease\n'
                                  'Brain injury\n'
                                  'Heart problems\n'
                                  'Overactivity of the parathyroid glands\n'
                                  'pituitary gland activity\n'
                                  'Thyroid inactivity\n'
                                  'Multiple sclerosis\n'
                                  'Parkinson s disease\n'
                                  'Severe head injury\n'
                                  'tuberculosis or meningitis\n'
                                  'Vitamin deficiency\n'
                                  'Viral illness (including influenza and glandular fever)\n'
                                  'Water balance problems (low salt contenthigh or low calcium in the body)',
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,
                                  // wordSpacing:6,
                                  //letterSpacing:5,
                                ),

                              ),
                              SizedBox(height:40,),
                              Text('  --- Medications Some medications cause depression, but that does not mean that the patient stops taking them without consulting his doctor. In fact, these medications do not usually cause depression, and it may usually be due to other reasons.\n'
                                  'Some medicines that cause depression\n'
                                  ' Medicines used to treat epilepsy\n'
                                  ' Anti-high blood pressure medications\n'
                                  'Antimalarials - mefloquine (Ryam)\n'
                                  'Anti-Parkinsonian drugs\n'
                                  '(Some) chemotherapy drugs used in the treatment of'
                                  'cancer diseases\n'
                                  'Digitalis (heart)\n'
                                  'Diuretics (heart and blood pressure)\n'
                                  'Interferon-alpha used to treat viral hepatitis\n'
                                  'sedatives\n'
                                  'Steroid treatment (chest attack, inflammation)\n'
                                  'joints, etc.)\n      '
                                ,
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,
                                  // wordSpacing:6,
                                  //letterSpacing:5,
                                ),

                              ),

                            ],),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),
                            // color: Colors.purpleAccent[100].withOpacity(0.6),
                            // color: Colors.teal[800].withOpacity(0.6),


                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:40),
                        Container(
                          child: Column(
                            children:[
                              Text(
                                'Types of depression?',
                                style:TextStyle(
                                  fontSize:30,
                                  fontWeight:FontWeight.bold,
                                  color:Colors.purple[900],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height:40,),
                              Image(
                                image:NetworkImage("https://cdn-icons-png.flaticon.com/128/3588/3588364.png"),
                                height:200, width:200,fit:BoxFit.fill,),
                              Text('types of depression\n'
                                  'classification of depression\n'
                                  ' When you visit a doctor, counselor, or other specialist, he may use a variety of terms to describe your illness. Some of these terms are used to describe your disease. Some of these terms have overlapping meanings. However, in this book, I have used specific terms, which are mild depression, moderate depression, and severe depression, and each of them is clear and has characteristics.\n'

                                  '                mild depression\n'
                                  'When suffering from mild depression, a person suffers from irritable mood from time to time and usually begins to get sick after a stressful event. The patient becomes anxious and becomes frustrated. In fact, lifestyle changes are often enough to cause this type of depression.\n'
                                  'moderate depression\n'
                                  'When a person suffers from moderate depression, his mood is permanently disturbed, and some symptoms of physical illness appear on him. Note that these symptoms differ from one person to another and do not cause changes in the lifestyle alone. This type of depression often requires medical help when suffering from moderate depression.\n'
                                  ' recurring depression\n'
                                  'Doctors use this term to talk about a person who has gone through more than one stage of depression. It is true that they still use mild, moderate and severe depression, but they are used to attaching it to “recurrent” when a particular person recovers from moderate depression to suffer after years of mild depression and doctors say that he suffers from recurrent depression Currently light\n'


                                  'chronic depression\n'
                                  'Copts use the term chronic depression to talk about depression that accompanies a particular person for a long period of time, but I do not mean that this depression is severe or dangerous. Usually, doctors use this term to denote a depression that has lasted for more than two years.\n'



                                  'intractable depression\n'

                                  'This term is usually used to denote depression, which they have tried hard to treat with antidepressant drugs without the patient completely recovering from it.\n'


                                  'Endogenous depression\n'
                                  'The causes of internal depression have not been determined, and it is usually a severe condition that leaves a person with physical symptoms, including weight loss and appetite, early awakening, irritable mood in the morning, and one does not get rid of depression until after undergoing appropriate treatment\n'


                                  'irritable depression\n'
                                  'This term is used to denote the symptoms of this type of depression, which throws a person into a cycle of anxiety, fear and fatigue\n'


                                  'organic depression\n'
                                  'Doctors give this name to the name depression that results from a physical illness or a specific medication\n',
                                style:TextStyle(
                                  fontSize:25,
                                  height: 1.5,
                                  color:Colors.white,
                                  // wordSpacing:6,
                                  //letterSpacing:5,
                                ),

                              ),

                            ],),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.6),
                            // color: Colors.purpleAccent[100].withOpacity(0.6),
                            // color: Colors.teal[800].withOpacity(0.6),


                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 8,
                                blurRadius: 7,
                                offset: Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:40),

                      ],

                    ),
                  ),
                ),
              ),
            ]
        ),



      ),
    );
  }
}
