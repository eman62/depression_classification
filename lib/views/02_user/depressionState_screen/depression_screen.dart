
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DepressionStateScreen extends StatefulWidget {
  const DepressionStateScreen({Key? key}) : super(key: key);

  @override
  State<DepressionStateScreen> createState() => _DepressionStateScreenState();
}

class _DepressionStateScreenState extends State<DepressionStateScreen> {
  var textController = TextEditingController();

  //String SentimentResult = "";
  String SentimentScore = "";
  //String text = "";
  final _forkey = GlobalKey<FormState>();

  get text => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _forkey,
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(.3),
                        hintText: "Enter your twitter Username",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black87.withOpacity(0.2),
                                width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black87.withOpacity(0.2), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      backgroundColor: Colors.black.withOpacity(0.05),
                    ),
                    icon: Icon(
                      Icons.sentiment_neutral,
                      color: Colors.green,
                      size: 20,
                    ),
                    label: Text(
                      'Tell Me!',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .apply(color: Colors.black87),
                    ),
                    onPressed: () => tellMeMethod()),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$SentimentScore",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ));
  }

  tellMeMethod() async {
    try {
      print('object');
      final url =
      Uri.parse("https://gp-depapp.herokuapp.com/depression-detection");
      final body = {'username': textController.text};
      final headers = {
        'Content-Type': 'application/json',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      };
      print(body);
      print(headers);

      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      print('StatusCode:${response.statusCode}');
      print('Return Date:${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        //SentimentResult = jsonResponse['sentiment'];
        //SentimentScore = jsonResponse['score'].toString();
        //print(SentimentResult);
        //print(SentimentScore);
        setState(() {
          SentimentScore = jsonResponse['score'].toString();
          //SentimentScore = jsonResponse['score'].toStringAsFixed(2);
          print(SentimentScore);
        });
      } else {
        print('Request faild with status:${response.statusCode}');
      }
    } catch (e, StackTrace) {
      print(e);
      print(StackTrace);
    }
  }
}


