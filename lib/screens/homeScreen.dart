  import 'package:flutter/material.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        drawer: const Drawer(), // Optionnel : à compléter selon tes besoins
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text(
            "Culture Quiz Benin",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue,
              child: Text("JD", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 16),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B63F3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back, Quizzer!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Ready to test your knowledge on Benin's rich heritage? Dive into a category!",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.flash_on),
                      label: const Text("Start a Daily Challenge"),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                "Explore Quiz Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Categories Grid
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _CategoryCard(label: 'Politics', icon: Icons.gavel, color: Colors.redAccent),
                  _CategoryCard(label: 'Languages', icon: Icons.menu_book, color: Colors.lightBlue),
                  _CategoryCard(label: 'Religions', icon: Icons.temple_hindu, color: Colors.purple),
                  _CategoryCard(label: 'History', icon: Icons.history_edu, color: Colors.orangeAccent),
                  _CategoryCard(label: 'Geography', icon: Icons.public, color: Colors.green),
                  _CategoryCard(label: 'Arts & Culture', icon: Icons.palette, color: Colors.indigo),
                ],
              ),

              const SizedBox(height: 32),
              // Achievements Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.emoji_events, size: 40, color: Colors.indigo),
                    const SizedBox(height: 8),
                    const Text(
                      "Unlock New Achievements!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Master a category and earn special badges. Your journey to becoming a Benin Culture Expert starts now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("View Your Profile"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              const Text(
                "Our Educational Partners",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _PartnerLogo(label: "Benin Edu", imagePath: "assets/logos/benin_edu.png"),
                  _PartnerLogo(label: "AfriLearn", imagePath: "assets/logos/afrilearn.png"),
                  _PartnerLogo(label: "CulturePath", imagePath: "assets/logos/culturepath.png"),
                  _PartnerLogo(label: "Heritage Link", imagePath: "assets/logos/heritage_link.png"),
                  _PartnerLogo(label: "QuizAfrique", imagePath: "assets/logos/quizafrique.png"),
                  _PartnerLogo(label: "Local Voices", imagePath: "assets/logos/local_voices.png"),
                ],
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),

        // Bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            // TODO: navigate by index
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Summary'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
    }
  }

  // Category card widget
  class _CategoryCard extends StatelessWidget {
    final String label;
    final IconData icon;
    final Color color;

    const _CategoryCard({
      required this.label,
      required this.icon,
      required this.color,
    });

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          // TODO: navigate to quiz category
        },
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    }
  }

  // Partner logo widget (placeholder)
  class _PartnerLogo extends StatelessWidget {
    final String label;
    final String imagePath;

    const _PartnerLogo({required this.label, required this.imagePath});

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      );
    }
  }
