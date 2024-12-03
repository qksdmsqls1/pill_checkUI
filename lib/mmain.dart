import 'package:flutter/material.dart';
import 'main.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pill check',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: const Color(0xFFE9E9E9), // 상단바 배경색
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 버튼 동작
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()), // SettingsPage로 이동
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // 안의 배경색을 흰색으로 설정
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/1.png', // 이미지 경로
                width: 150, // 이미지 너비
                height: 150, // 이미지 높이
                fit: BoxFit.contain, // 이미지 비율 유지
              ),
              const SizedBox(height: 20),
              const Text(
                '사진 불러오기를 통해 알약을\n인식해보세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  // 사진 불러오기 버튼 기능 (추후 구현)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB2E9E9), // 버튼 색상
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 12.0,
                  ),
                ),
                icon: const Icon(Icons.camera_alt, color: Colors.black),
                label: const Text(
                  '사진 불러오기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFE9E9E9),
        child: Container(
          height: 78, // 하단바 높이
          alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(Icons.home, size: 30, color: Colors.black),
            onPressed: null, // 홈 버튼 비활성화
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: const Color(0xFFE9E9E9),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 버튼 동작
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
