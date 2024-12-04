import 'package:flutter/material.dart';

class LoginHomePage extends StatelessWidget {
  const LoginHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 배경 흰색 설정
          Container(
            color: Colors.white, // 흰색 배경
          ),
          // 배경 이미지 (알약)
          Positioned(
            bottom: 190, // 화면 하단에 배치
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/1.png', // 알약 이미지
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          // 메인 콘텐츠를 중앙 정렬
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // 가로축 중앙 정렬
              children: [
                const Text(
                  'Pill check',
                  textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cursive', // 원하는 폰트 스타일
                  ),
                ),
                const SizedBox(height: 40),
                // 불투명한 회색 박스
                Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2), // 불투명한 회색
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 세로축 중앙 정렬
                    crossAxisAlignment: CrossAxisAlignment.center, // 가로축 중앙 정렬
                    children: [
                      // 카카오톡 로그인 버튼
                      SizedBox(
                        width: double.infinity, // 버튼을 컨테이너 너비에 맞게 확장
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // 추후 카카오 로그인 기능 구현
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow, // 카카오톡 색상
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          icon: Image.asset(
                            'assets/images/kakao.png', // 카카오톡 아이콘 이미지
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                          label: const Text(
                            '카카오 계정으로 로그인',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      // 구글 로그인 버튼
                      SizedBox(
                        width: double.infinity, // 버튼을 컨테이너 너비에 맞게 확장
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // 추후 구글 로그인 기능 구현
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // 구글 색상
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          icon: Image.asset(
                            'assets/images/google.png', // 구글 아이콘 이미지
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                          label: const Text(
                            '구글 계정으로 로그인',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
