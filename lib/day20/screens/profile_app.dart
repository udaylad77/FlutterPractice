import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  // Sample data for skills/hobbies
  final List<String> skills = [
    'Flutter Development',
    'Mobile App Design',
    'Photography',
    'Traveling',
    'Cooking',
    'Reading',
    'Surfing Web',
    'Tumblr',
    'Pinterest',
    'Instagram',
    'Facebook',
    'Twitter',
    'LinkedIn',
    'YouTube',
    'Snapchat',
    'WhatsApp',
    'Telegram',
    'Skype',
    'Discord',
    'Slack',
    'Google Hangouts',
    'Zoom',
    'Skype',
  ];
  ProfileApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        // Allows scrolling if content overflows
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                radius: 80,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/500'),
              ),
              SizedBox(height: 10),
              Text(
                'Uday Lad',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Mobile App Developer',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              // ListView of skills/hobbies
              ...skills
                  .map((skill) => ListTile(
                        title: Text(skill),
                        leading: Icon(Icons.star,
                            color: Colors.blue), // Optional: Adds an icon
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
