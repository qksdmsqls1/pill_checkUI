import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // CustomAppBar 컴포넌트 불러오기
import 'custom_bottom_bar.dart'; // CustomBottomBar import
import 'mmain.dart'; // MainPage import

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 박스의 가로, 세로 크기 및 높이를 조정할 수 있도록 변수화
    final double boxWidth = MediaQuery.of(context).size.width * 0.8; // 가로 크기 비율
    final double boxHeight = 200; // 세로 크기
    final double boxBottomMargin = 80.0; // 하단 여백 (위치 조절)

    // 텍스트와 로딩 아이콘의 위치를 조정할 수 있는 변수
    final double topOffset = -50; // 텍스트와 로딩 아이콘을 위로 50px 이동

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pill Check', // CustomAppBar에서 제목 설정
        onBackPressed: () {
          // 메인 페이지로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white, // 화면 배경
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 그룹 전체를 위로 이동
                Transform.translate(
                  offset: Offset(0, -130),
                  child: Column(
                    children: [
                      const Text(
                        '알약 인식중..\n10초 이상 소요될 수 있습니다',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 90), // 텍스트와 아이콘 사이 간격
                      const CircularProgressIndicator(), // 로딩 애니메이션
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: boxBottomMargin, // 화면 하단에서 여백
            left: (MediaQuery.of(context).size.width - boxWidth) / 2, // 중앙 정렬
            child: Container(
              width: boxWidth,
              height: boxHeight,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'tip!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '그거 아시나요? 약학정보원 API를 통해\n알약의 데이터베이스를 제공합니다',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        onHomePressed: () {
          // 메인 페이지로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
      ),
    );
  }
}
