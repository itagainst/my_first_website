import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '의현의 웹사이트',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text('Flutter로 만든 첫 번째 홈페이지', style: TextStyle(fontSize: 20)),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: null, child: Text('회원가입')),

                SizedBox(width: 20),

                ElevatedButton(onPressed: null, child: Text('로그인')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
