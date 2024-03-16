import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = const [
    {
      'questionText': 'Apa ibukota Indonesia?',
      'answers': [
        {'text': 'Jakarta', 'score': 10},
        {'text': 'Surabaya', 'score': 0},
        {'text': 'Bandung', 'score': 0},
        {'text': 'Bali', 'score': 0},
      ],
    },
    {
      'questionText': 'Berapa jumlah provinsi di Indonesia?',
      'answers': [
        {'text': '34', 'score': 0},
        {'text': '35', 'score': 0},
        {'text': '33', 'score': 0},
        {'text': '34', 'score': 10},
      ],
    },
    {
      'questionText': 'Siapa presiden pertama Indonesia?',
      'answers': [
        {'text': 'Soekarno', 'score': 10},
        {'text': 'Soeharto', 'score': 0},
        {'text': 'BJ Habibie', 'score': 0},
        {'text': 'Megawati', 'score': 0},
      ],
    },
        {
      'questionText': 'Siapa presiden Indonesia saat ini?',
      'answers': [
        {'text': 'Jokowi', 'score': 10},
        {'text': 'Soeharto', 'score': 0},
        {'text': 'BJ Habibie', 'score': 0},
        {'text': 'Megawati', 'score': 0},
      ],
    },
            {
      'questionText': 'Kabupaten Purbalingga berada di provinsi mana?',
      'answers': [
        {'text': 'Sumatera', 'score': 0},
        {'text': 'Bali', 'score': 0},
        {'text': 'Jawa Tengah', 'score': 10},
        {'text': 'Papua', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _score += score;

    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion,
            )
          : Result(_score, _resetQuiz),
    );
  }
}

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, dynamic>> questions;
  final Function answerQuestion;

  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Answer(
            answerText: answer['text'],
            selectHandler: () => answerQuestion(answer['score']),
          );
        }).toList(),
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback selectHandler;

  Answer({
    required this.answerText,
    required this.selectHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 20) {
      resultText = 'Anda hebat!';
    } else if (resultScore >= 10) {
      resultText = 'Anda lumayan!';
    } else {
      resultText = 'Anda perlu belajar lebih keras.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text('Ulangi Kuis'),
          ),
        ],
      ),
    );
  }
}
