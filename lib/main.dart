import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizLayout());
}

class QuizLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.blueGrey[800],
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  QuizContents quizContents = QuizContents();

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizContents.isQuizFinished() == true) {
        Alert(context: context, title: "QUIZ OVER", desc: "Congrats on completing the quiz, you will be redirected to starting again").show();
        scoreKeeper = [];
      }
      else {
        if (quizContents.getQuestionAnswer() == userPickedAnswer) {
          quizContents.nextQuestion();
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          quizContents.nextQuestion();
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 15,
          child: Container(
            child: Center(
              child: Text(
                quizContents.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(children: <Widget>[
            Card(
              color: Colors.lightGreenAccent,
              child: FlatButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: ListTile(
                  title: Center(
                    child: Text(
                      'True',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: FlatButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: ListTile(
                  title: Center(
                    child: Text(
                      'False',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
