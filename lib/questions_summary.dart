import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                final bool isCorrect =
                    data['user_answer'] == data['correct_answer'];

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          isCorrect
                              ? const Color.fromARGB(255, 0, 255, 55)
                              : Color.fromARGB(255, 255, 0, 0),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              data['question'] as String,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              data['user_answer'] as String,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color:
                                    isCorrect
                                        ? const Color.fromARGB(255, 0, 255, 55)
                                        : Color.fromARGB(255, 255, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (!isCorrect)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data['correct_answer'] as String,
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 1, 49, 86),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
