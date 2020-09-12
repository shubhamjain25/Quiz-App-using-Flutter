

class Question {
  String questionText;
  bool questionAnswer;

  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}

class QuizContents {
  int _i = 0;

  List<Question> _questionBank = [
    Question(q:'Is a new born kangaroo small enough to fit in a cup?', a: true),
    Question(q: 'Does a mouse have more bones than a human?', a: true),
    Question(q: 'Does a rabbit take about 18 naps a day?', a: true),
    Question(q: 'Windsor Castle is known as the \'Key to England\'', a: false),
    Question(q: 'Lewis Carol was Mark Twain\'s real name', a: false),
    Question(q: 'In nautical terms, port means left', a: true),
    Question(q: 'Florida has two time zones', a: true),
    Question(q: 'Benjamin Franklin was the first post master general', a: true),
    Question(q: 'You can only see a rainbow with your back to the Sun', a: false),
    Question(q: 'Original name of Pac-man was Puck-man', a: true),
  ];

  String getQuestionText() {
    return _questionBank[_i].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_i].questionAnswer;
  }

  void nextQuestion() {
    if (_i < _questionBank.length - 1) {
      _i++;
    }
  }

  bool isQuizFinished(){
    if (_i == _questionBank.length - 1) {
      _i=0;
      return true;
    }
    else{
      return false;
    }
  }
}
