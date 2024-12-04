import 'package:flutter/material.dart';

class AllowPage extends StatelessWidget {
  const AllowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '갤러리 접근 권한 요청',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        '사진을 불러오기 위해 갤러리 접근 권한이 필요합니다. 권한을 허용하시겠습니까?',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // 팝업 닫기
          },
          child: const Text(
            '취소',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // 팝업 닫기
            // 추후 권한 요청 로직 추가 가능
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('권한이 허용되었습니다!'),
              ),
            );
          },
          child: const Text(
            '허용',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
