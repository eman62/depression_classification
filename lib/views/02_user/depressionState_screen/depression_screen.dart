import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:save/views/widgets/components.dart';

class DepressionStateScreen extends StatefulWidget {
  const DepressionStateScreen({Key? key}) : super(key: key);

  @override
  State<DepressionStateScreen> createState() => _DepressionStateScreenState();
}

class _DepressionStateScreenState extends State<DepressionStateScreen> {
  var textController = TextEditingController();

  //String SentimentResult = "";
  String sentimentScore = "";
  bool isLoading = false;
  //String text = "";
  final _formKey = GlobalKey<FormState>();

  get text => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(200))),
      ),
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 75,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    hintText: "Enter your twitter Username",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87.withOpacity(0.2), width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87.withOpacity(0.2), width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.green,
                backgroundColor: Colors.black.withOpacity(0.05),
              ),
              icon: const Icon(
                Icons.sentiment_neutral,
                color: Colors.green,
                size: 30,
              ),
              label: Text(
                'Tell Me!',
                style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color,fontSize: 22),
              ),
              onPressed: () => tellMeMethod(),
            ),
            const SizedBox(
              height: 15,
            ),
            if (isLoading)
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/loading.gif',
                  height: 150,
                ),
              ),
            if (sentimentScore != "" && !isLoading)
              Text(
                "$sentimentScore %",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 17, fontWeight: FontWeight.w400),
              ),
            const SizedBox(
              height: 20,
            ),
            if (sentimentScore != "" && !isLoading) getSentimentStatusWidget(sentimentScore),
          ],
        ),
      ),
    ));
  }

  tellMeMethod() async {
    try {
      if (textController.text.isEmpty || textController.text == "") {
        showToast(text: 'Enter a twitter username', state: ToastStates.error);
      } else {
        setState(() {
          isLoading = true;
        });
        print('object');
        final url = Uri.parse("https://gp-depapp.herokuapp.com/depression-detection");
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
          setState(() {
            sentimentScore = jsonResponse['score'].toString();
            isLoading = false;
            print(sentimentScore);
          });
        } else {
          print('Request failed with status:${response.statusCode}');
          setState(() {
            isLoading = false;
            sentimentScore = "";
          });
          showToast(text: 'Error finding this account or the account is hidden', state: ToastStates.error);
        }
      }
    } catch (e, StackTrace) {
      print(e);
      print(StackTrace);
    }
  }
}

Widget getSentimentStatusWidget(String sentimentScore) {
  String image = '';
  String text = '';
  Color textColor = Colors.black;
  double score = double.parse(sentimentScore);
  // score = 55.0;
  if (score >= 0.0 && score < 20.0) {
    text = "Cool, you are good!";
    image = "assets/images/no.png";
    textColor = Colors.green;
  } else if (score >= 20.0 && score < 40.0) {
    text = "Mmm, you are OK!";
    image = "assets/images/ok.png";
    textColor = Colors.lightGreen;
  } else if (score >= 40.0 && score < 60.0) {
    text = "Take care, You are partially depressed!";
    image = "assets/images/medium.png";
    textColor = Colors.orangeAccent;
  } else if (score >= 60.0 && score < 80.0) {
    text = "Oh, don't stay alone!";
    image = "assets/images/high.png";
    textColor = Colors.deepOrange;
  } else if (score >= 80.0 && score <= 100.0) {
    text = "Take it seriously, you have to talk to someone!";
    image = "assets/images/max.png";
    textColor = Colors.red;
  }

  return Column(
    children: [
      Image.asset(image),
      const SizedBox(height: 10),
      Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
        ),
      ),
    ],
  );
}
