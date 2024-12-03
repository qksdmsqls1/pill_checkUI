import 'package:flutter/material.dart';
import 'main.dart'; // ThemeState를 가져오기 위해 import

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: ThemeState.textColor,
          builder: (context, textColor, child) {
            return ValueListenableBuilder(
              valueListenable: ThemeState.textSize,
              builder: (context, textSize, child) {
                return ValueListenableBuilder(
                  valueListenable: ThemeState.fontIndex,
                  builder: (context, fontIndex, child) {
                    final fonts = ['Default', 'Serif', 'Monospace'];
                    return Text(
                      'Pill check',
                      style: TextStyle(
                        fontFamily: fonts[fontIndex] == 'Default' ? null : fonts[fontIndex],
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: textSize,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
        backgroundColor: const Color(0xFFE9E9E9),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: ThemeState.backgroundColor,
        builder: (context, backgroundColor, child) {
          return Container(
            color: backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xFFBDBDBD),
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: ValueListenableBuilder(
                    valueListenable: ThemeState.textColor,
                    builder: (context, textColor, child) {
                      return ValueListenableBuilder(
                        valueListenable: ThemeState.textSize,
                        builder: (context, textSize, child) {
                          return ValueListenableBuilder(
                            valueListenable: ThemeState.fontIndex,
                            builder: (context, fontIndex, child) {
                              final fonts = ['Default', 'Serif', 'Monospace'];
                              return Text(
                                '버전 및 업데이트 확인',
                                style: TextStyle(
                                  fontFamily: fonts[fontIndex] == 'Default' ? null : fonts[fontIndex],
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      // 이미지가 뒤로 가도록 먼저 추가
                      Positioned(
                        left: 0, // 좌측 위치
                        right: 0, // 우측 위치
                        top: 250, // 상단 위치
                        child: Image.asset(
                          'assets/images/1.png', // 이미지 경로
                          width: 300, // 원하는 너비
                          height: 350, // 원하는 높이
                          fit: BoxFit.contain, // 이미지 비율 유지
                          alignment: Alignment.center, // 이미지 중앙 정렬
                        ),
                      ),
                      // 텍스트가 이미지 위에 오도록 배치
                      ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8), // 텍스트 배경 투명도 조절
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: ThemeState.textColor,
                              builder: (context, textColor, child) {
                                return ValueListenableBuilder(
                                  valueListenable: ThemeState.textSize,
                                  builder: (context, textSize, child) {
                                    return Text(
                                      '- Pill check의 현 버전은 1.0입니다.\n'
                                          '사진불러오기 권한허용 업데이트.\n'
                                          '카카오톡/구글 로그인을 업데이트 하였습니다.\n',
                                      style: TextStyle(
                                        fontSize: textSize,
                                        color: textColor,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8), // 텍스트 배경 투명도 조절
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: ThemeState.textColor,
                              builder: (context, textColor, child) {
                                return ValueListenableBuilder(
                                  valueListenable: ThemeState.textSize,
                                  builder: (context, textSize, child) {
                                    return Text(
                                      '- 12/26 version 업데이트 예정 (v1.3):\n'
                                          '알약 커뮤니티 기능 생성\n'
                                          '사용자 프로필 기능 생성',
                                      style: TextStyle(
                                        fontSize: textSize,
                                        color: textColor,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ValueListenableBuilder(
                    valueListenable: ThemeState.textColor,
                    builder: (context, textColor, child) {
                      return ValueListenableBuilder(
                        valueListenable: ThemeState.textSize,
                        builder: (context, textSize, child) {
                          return Text(
                            'version 1.0',
                            style: TextStyle(
                              fontSize: textSize * 0.8,
                              fontStyle: FontStyle.italic,
                              color: textColor,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFE9E9E9),
        child: Container(
          height: 78,
          alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(Icons.home, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/')); // 홈으로 이동
            },
          ),
        ),
      ),
    );
  }
}
