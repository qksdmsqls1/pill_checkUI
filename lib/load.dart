import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // CustomAppBar 컴포넌트 불러오기
import 'custom_bottom_bar.dart'; // CustomBottomBar import
import 'mmain.dart'; // MainPage import
import 'option.dart'; // ThemeState import

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeState.backgroundColor,
      builder: (context, backgroundColor, child) {
        return ValueListenableBuilder(
          valueListenable: ThemeState.textColor,
          builder: (context, textColor, child) {
            return ValueListenableBuilder(
              valueListenable: ThemeState.textSize,
              builder: (context, textSize, child) {
                return ValueListenableBuilder(
                  valueListenable: ThemeState.fontIndex,
                  builder: (context, fontIndex, child) {
                    final fonts = ['Default', 'Serif', 'Monospace'];
                    return Scaffold(
                      appBar: CustomAppBar(
                        title: 'Pill Check', // CustomAppBar에서 제목 설정
                        onBackPressed: () {
                          // 메인 페이지로 이동
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        },
                      ),
                      body: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              color: backgroundColor, // 테마 배경색 적용
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // 그룹 전체를 위로 이동
                                Transform.translate(
                                  offset: const Offset(0, -130),
                                  child: Column(
                                    children: [
                                      Text(
                                        '알약 인식중..\n10초 이상 소요될 수 있습니다',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: textSize,
                                          fontWeight: FontWeight.bold,
                                          color: textColor, // 테마 텍스트 색상 적용
                                          fontFamily: fonts[fontIndex] ==
                                              'Default'
                                              ? null
                                              : fonts[fontIndex],
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
                            bottom: 80.0, // 화면 하단에서 여백
                            left: (MediaQuery.of(context).size.width * 0.1),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 200,
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
                                children: [
                                  Text(
                                    'tip!',
                                    style: TextStyle(
                                      fontSize: textSize,
                                      fontWeight: FontWeight.bold,
                                      color: textColor, // 테마 텍스트 색상 적용
                                      fontFamily: fonts[fontIndex] == 'Default'
                                          ? null
                                          : fonts[fontIndex],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '그거 아시나요? 약학정보원 API를 통해\n알약의 데이터베이스를 제공합니다',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: textSize * 0.8,
                                      color: textColor, // 테마 텍스트 색상 적용
                                      fontFamily: fonts[fontIndex] == 'Default'
                                          ? null
                                          : fonts[fontIndex],
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
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
