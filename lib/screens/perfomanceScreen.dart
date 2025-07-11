import 'package:flutter/material.dart';

class PerformanceSummaryScreen extends StatefulWidget {
  @override
  _PerformanceSummaryScreenState createState() => _PerformanceSummaryScreenState();
}

class _PerformanceSummaryScreenState extends State<PerformanceSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Performance Summary',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(), // Remove back button
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main performance card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Title with star icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Benin Culture & History\nSummary',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.grey[400],
                        size: 24,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Score
                  Text(
                    '4/5',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Circular progress indicator
                  Container(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 0.8, // 4/5 = 0.8
                            strokeWidth: 8,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Correct/Incorrect stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('Correct', '4', Colors.green),
                      _buildStatItem('Incorrect', '1', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Action buttons
            _buildActionButton('Return to Home', Colors.red, Colors.white, () {
              // Navigate to home
            }),
            SizedBox(height: 12),
            _buildActionButton('Retake Quiz', Colors.white, Colors.red, () {
              // Retake quiz
            }, isOutlined: true),
            SizedBox(height: 30),
            // Quiz Breakdown section
            Text(
              'Quiz Breakdown',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            // Quiz questions breakdown
            _buildQuizBreakdownItem(
              'What is the official language of Benin?',
              'Your Answer: French',
              'Correct Answer: French',
              true,
            ),
            _buildQuizBreakdownItem(
              'Which West African country borders Benin to the east?',
              'Your Answer: Ghana',
              'Correct Answer: Nigeria',
              false,
            ),
            _buildQuizBreakdownItem(
              'What is the capital city of Benin?',
              'Your Answer: Porto-Novo',
              'Correct Answer: Porto-Novo',
              true,
            ),
            _buildQuizBreakdownItem(
              'Which major river runs through Benin?',
              'Your Answer: Niger River',
              'Correct Answer: Niger River',
              true,
            ),
            _buildQuizBreakdownItem(
              'Benin was formerly known by what colonial name?',
              'Your Answer: Dahomey',
              'Correct Answer: Dahomey',
              true,
            ),
            SizedBox(height: 30),
            // Areas for Improvement section
            Text(
              'Areas for Improvement',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            _buildImprovementItem(
              'Geography',
              'You got 1/2 (50%) of geography questions correct.',
              'Review this section for better performance next time.',
            ),
            _buildImprovementItem(
              'History',
              'You got 1/1 (100%) of history questions correct.',
              'Review this section for better performance next time.',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            label == 'Correct' ? Icons.check : Icons.close,
            color: color,
            size: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, Color backgroundColor, Color textColor, VoidCallback onPressed, {bool isOutlined = false}) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          side: isOutlined ? BorderSide(color: Colors.red, width: 1) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildQuizBreakdownItem(String question, String userAnswer, String correctAnswer, bool isCorrect) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isCorrect ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCorrect ? Icons.check : Icons.close,
                  color: isCorrect ? Colors.green : Colors.red,
                  size: 12,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userAnswer,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    if (!isCorrect) ...[
                      SizedBox(height: 4),
                      Text(
                        correctAnswer,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImprovementItem(String topic, String description, String recommendation) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Topic: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                topic,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              height: 1.4,
            ),
          ),
          SizedBox(height: 8),
          Text(
            recommendation,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage in main.dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Performance Summary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PerformanceSummaryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}