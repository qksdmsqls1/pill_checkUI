import 'package:flutter/material.dart';
import 'package:untitled/mmain.dart';
import 'custom_app_bar.dart'; // CustomAppBar 컴포넌트 import
import 'custom_bottom_bar.dart'; // CustomBottomBar 컴포넌트 import
import 'result_page.dart'; // ResultPage import

class PillDetailPage extends StatelessWidget {
  final String pillId; // 전달받은 알약 ID

  const PillDetailPage({super.key, required this.pillId});

  @override
  Widget build(BuildContext context) {
    // 더미 데이터: 알약 정보를 ID에 따라 가져옴
    final Map<String, dynamic> pillData = getPillData(pillId);

    return Scaffold(
      appBar: CustomAppBar(
        title: '상세 정보', // CustomAppBar에서 제목 설정
        onBackPressed: () {
          Navigator.pop(context); // 이전 화면으로 이동
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // 흰색 배경 설정
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  pillData['image'], // 알약 이미지
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              _buildInfoBlock('이름', pillData['name']),
              _buildInfoBlock('분류번호', pillData['classification']),
              _buildInfoBlock('구분', pillData['type']),
              _buildInfoBlock('효능', pillData['effect']),
              _buildInfoBlock('설명', pillData['description']),
              _buildInfoBlock('부작용', '매우 드문 부작용으로 알레르기 반응이 보고되었습니다. 사용 전 전문가와 상의하세요.'),
              _buildInfoBlock('주의사항', '고혈압, 간 질환 환자는 주의해서 사용하세요.'),
              _buildInfoBlock(
                  '추가 정보',
                  '이 약은 18세 이상 성인에게만 권장됩니다. 6시간 이상 간격으로 복용하며, 24시간 내 최대 복용량은 초과하지 않아야 합니다. '
                      '심각한 간 손상 위험이 있으므로 음주와 함께 복용하지 마세요.'),
              const SizedBox(height: 24),
            ],
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

  // 블록 빌드 함수
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
        '$title: $content',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  // 더미 데이터 제공 함수
  Map<String, dynamic> getPillData(String id) {
    const data = {
      'pill1': {
        'name': '타이레놀',
        'classification': 'A13D3',
        'type': '아세트아미노펜',
        'effect': '진통 및 해열',
        'description': '타이레놀은 일반적인 통증 및 열을 완화하는 데 사용됩니다.',
        'image': 'assets/images/2.png',
      },
      'pill2': {
        'name': '다른 약',
        'classification': 'B45X9',
        'type': '다른 성분',
        'effect': '다른 효능',
        'description': '이 약은 특정한 조건에 사용됩니다.',
        'image': 'assets/images/2.png',
      },
    };

    return data[id] ?? {}; // ID에 해당하는 데이터 반환
  }
}
