import 'package:flutter/material.dart';
import 'package:news_app/common/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
          backgroundColor: AppConst.kBlueLight,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profile-pic.png")),
              const SizedBox(height: 16.0),
              const Text(
                'Aashish Lamsal',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Computer Engineer',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16.0),
              const CareerInfoCard(
                title: 'Skills',
                content: 'Flutter, Dart, JavaScript, Python, ReacJs ',
              ),
              const CareerInfoCard(
                title: 'Education',
                content: 'Batchelors in Computer Engineering',
              ),
              const CareerInfoCard(
                title: 'Contact',
                content: 'aashish33lamsal@gmail.com\n 9846999230',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CareerInfoCard extends StatelessWidget {
  final String title;
  final String content;

  const CareerInfoCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(content),
      ),
    );
  }
}
