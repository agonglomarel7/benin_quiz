import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey,
                    child: Text("AD", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Amaury Djidenou",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "A passionate cultural explorer and dedicated quiz master.",
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                      Text(
                        "Level 7",
                        style: TextStyle(fontSize: 13, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text("Your Stats", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2,
              children: const [
                _StatCard(label: "Quizzes Completed", value: "23", icon: Icons.bar_chart),
                _StatCard(label: "Highest Score", value: "95%", icon: Icons.star),
                _StatCard(label: "Badges Earned", value: "12", icon: Icons.emoji_events),
                _StatCard(label: "Avg. Quiz Time", value: "5 min", icon: Icons.timer),
              ],
            ),

            const SizedBox(height: 24),
            const Text("Quiz History", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const _QuizHistoryTile(title: "Benin History Quiz", score: 80, date: "2023-10-25"),
            const _QuizHistoryTile(title: "Fon Language Basics", score: 65, date: "2023-10-20"),
            const _QuizHistoryTile(title: "Beninese Politics Overview", score: 90, date: "2023-10-15"),

            const SizedBox(height: 24),
            const Text("Achievements", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: const [
                _AchievementCard(
                  title: "History Buff",
                  description: "Successfully completed 5 history quizzes with 80%+.",
                  icon: Icons.book,
                ),
                _AchievementCard(
                  title: "Language Learner",
                  description: "Answered 10+ questions in a dialect quiz.",
                  icon: Icons.language,
                ),
                _AchievementCard(
                  title: "Quiz Champion",
                  description: "Earned top scores across 3 categories.",
                  icon: Icons.emoji_events,
                ),
                _AchievementCard(
                  title: "First Step",
                  description: "Embark on your learning journey by completing your very first quiz!",
                  icon: Icons.flag,
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

    );
  }
}

// Reusable stat card
class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepOrange),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.black54)),
            ],
          )
        ],
      ),
    );
  }
}

// Quiz history tile
class _QuizHistoryTile extends StatelessWidget {
  final String title;
  final int score;
  final String date;

  const _QuizHistoryTile({
    required this.title,
    required this.score,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final passed = score >= 70;
    return ListTile(
      leading: const Icon(Icons.quiz, color: Colors.deepPurple),
      title: Text(title),
      subtitle: Text(date),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$score / 100",
            style: TextStyle(
              color: passed ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(passed ? "Passed" : "Failed",
              style: TextStyle(
                color: passed ? Colors.green : Colors.red,
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}

// Achievement card
class _AchievementCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _AchievementCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.amber),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 9, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
