import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '이의현',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: isMobile ? const MobileLayout() : const DesktopLayout(),
            ),
          ),
        ),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex: 2, child: ProfileCard()),
        const SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: Column(
            children: const [
              InfoCard(
                title: '기본 정보',
                content: ['이름 : 이의현', '생년월일 : 2005.09.21', '경희대학교 응용수학과 25학번'],
              ),
              SizedBox(height: 20),
              InfoCard(title: '활동', content: ['고품 26-1 총무']),
              SizedBox(height: 20),
              InfoCard(
                title: '연락처',
                content: [
                  'Instagram : @dldmlhyn',
                  '전화번호 : 010-2321-9857',
                  '이메일 : uyhyun1234@gmail.com',
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileCard(),
        SizedBox(height: 20),
        InfoCard(
          title: '기본 정보',
          content: ['이름 : 이의현', '생년월일 : 2005.09.21', '경희대학교 응용수학과 25학번'],
        ),
        SizedBox(height: 20),
        InfoCard(title: '활동', content: ['고품 26-1 총무']),
        SizedBox(height: 20),
        InfoCard(
          title: '연락처',
          content: [
            'Instagram : @dldmlhyn',
            '전화번호 : 010-2321-9857',
            '이메일 : uyhyun1234@gmail.com',
          ],
        ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const CircleAvatar(radius: 60, child: Icon(Icons.person, size: 60)),
            const SizedBox(height: 20),
            Text('이의현', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            const Text(
              'Kyung Hee University\nApplied Mathematics',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final List<String> content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 15),
            ...content.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
