import 'package:flutter/material.dart';
import 'package:quizz_app_course/data/questions.dart';
import './questions_summary.dart';

class ResultsScreen extends StatelessWidget {
   const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.restartAction,
    });


  final List<String> chosenAnswers;
  final VoidCallback restartAction;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'You anwered $numCorrectQuestions out of $numTotalQuestions questions correctly!', 
              style: TextStyle(
                color: const Color.fromARGB(255, 194, 139, 246),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
                ), textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30,),
            OutlinedButton.icon(
              onPressed: restartAction,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Color.fromARGB(0, 0, 0, 0))
              ), 
              label: const Text('Restart Quiz!'),
              icon: Icon(Icons.refresh_outlined),
              )
      ],
    ),
      ),
    );
  }
}
