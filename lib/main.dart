import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyWebsite());
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '이의현',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double opacity = 0;
  double offset = 50;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1;
        offset = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.22,
              child: Image.asset(
                'assets/kyunghee_rogo.png',
                width: width * 1.8,
                fit: BoxFit.contain,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(
                              Colors.white10,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AboutPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'About',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Center(
                    child: AnimatedOpacity(
                      duration: const Duration(seconds: 2),
                      opacity: opacity,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        transform: Matrix4.translationValues(0, offset, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: width < 600 ? 70 : 140,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 20),

                              Text(
                                '이의현의 페이지에 오신 것을 환영합니다',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: width < 600 ? 18 : 28,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Widget infoTile(String title, String value, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MouseRegion(
        cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF333333),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(value, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openInstagram() async {
    final uri = Uri.parse('https://instagram.com/dldmlhyn');

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> sendEmail() async {
    final uri = Uri.parse('mailto:uyhyun1234@gmail.com');

    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),

      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: const Text('About'),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '이의현',
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                infoTile('생년월일', '2005년 09월 21일'),

                infoTile('대학교', '경희대학교 응용수학과 25학번'),

                infoTile('전화번호', '010-2321-9857'),

                infoTile('Instagram', '@dldmlhyn', onTap: openInstagram),

                infoTile('E-Mail', 'uyhyun1234@gmail.com', onTap: sendEmail),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
