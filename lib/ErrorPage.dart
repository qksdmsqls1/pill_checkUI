import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // CustomAppBar 컴포넌트 불러오기
import 'custom_bottom_bar.dart'; // CustomBottomBar 컴포넌트 불러오기
import 'mmain.dart'; // MainPage를 import
import 'option.dart'; // SettingsPage를 import

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pill Check',
        onBackPressed: () {
          // 뒤로가기 버튼을 눌렀을 때 MainPage로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white, // 배경색 흰색으로 설정
          ),
          // 중앙 UI 요소
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 경고 아이콘
                const Icon(
                  Icons.error_outline,
                  size: 80,
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                // 경고 메시지
                const Text(
                  '불러온 이미지가 부정확하거나\n검색 결과가 없습니다',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                // 사진 불러오기 버튼
                ElevatedButton.icon(
                  onPressed: () {
                    // 갤러리에서 사진 다시 불러오기 기능 (추후 구현)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB2E9E9),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 32.0,
                    ),
                  ),
                  icon: const Icon(Icons.camera_alt, color: Colors.black),
                  label: const Text(
                    '사진 불러오기',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // 하단 안내 메시지
                const Text(
                  '흐릿하거나 멀리서 찍은 사진은\n구별하기 어려울 수 있어요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // 왼쪽 아래에 설정 아이콘 및 텍스트 추가
          Positioned(
            bottom: 30, // 하단바 위쪽 위치
            left: 20, // 화면 왼쪽에서 20px
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.grey, size: 40),
                  onPressed: () {
                    // 설정 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8), // 아이콘과 텍스트 간격
                GestureDetector(
                  onTap: () {
                    // 설정 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                  child: const Text(
                    '설정',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        onHomePressed: () {
          // 하단 홈 버튼을 눌렀을 때 MainPage로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
      ),
    );
  }
}
