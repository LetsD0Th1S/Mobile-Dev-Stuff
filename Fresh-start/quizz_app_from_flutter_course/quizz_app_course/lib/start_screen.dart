import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png', 
            height: 300,
            color: Color.fromARGB(150, 255, 255, 255),
            ),
          SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color:Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide.none,
              ),
              label: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
              icon: const Icon(Icons.arrow_right_alt),
            ),
          ),
        ],
      ),
    );
  }
}
