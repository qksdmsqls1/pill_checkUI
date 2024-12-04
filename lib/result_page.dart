import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // CustomAppBar 컴포넌트 import
import 'custom_bottom_bar.dart'; // CustomBottomBar 컴포넌트 import
import 'mmain.dart'; // MainPage import 추가
import 'PillDetailPage.dart'; // PillDetailPage import

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '인식결과', // CustomAppBar에서 제목 설정
        onBackPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()), // MainPage로 이동
                (route) => false,
          );
        },
      ),
      body: Container(
        color: Colors.white, // 배경을 흰색으로 설정
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '타이레놀',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '자세히 보시려면 사진을 클릭해주세요',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                // 이미지 영역
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // PillDetailPage로 이동 (pill1)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PillDetailPage(pillId: 'pill1'),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/2.png', // 알약 이미지
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        // PillDetailPage로 이동 (pill2)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PillDetailPage(pillId: 'pill2'),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/2.png', // 동일한 알약 이미지
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // 약 정보 블록
                _buildInfoBlock('이름', '타이레놀'),
                _buildInfoBlock('제형','동그라미'),
                _buildInfoBlock('색상','하양'),
                _buildInfoBlock('효능', '타이레놀은 통증 및 열을 완화하는 데 사용됩니다.'),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // 사진 불러오기 버튼 동작
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade200,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    ),
                    child: const Text(
                      '사진 불러오기',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onHomePressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false,
          );
        },
      ),
    );
  }

  // 블록 빌드 함수 (한 줄 형태로 표시)
  Widget _buildInfoBlock(String title, String content) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$title: $content', // 한 줄 형태로 데이터 표시
        style: const TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}
