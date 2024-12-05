import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // CustomAppBar 컴포넌트 불러오기
import 'custom_bottom_bar.dart'; // CustomBottomBar import
import 'allow.dart'; // AllowPage import
import 'option.dart'; // ThemeState import
import 'home.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginHomePage(),
                            ),
                                (route) => false,
                          );
                        },
                      ),
                      body: Stack(
                        children: [
                          Container(
                            color: backgroundColor, // 테마 배경색 반영
                          ),
                          // 이미지의 위치를 조정
                          Positioned(
                            top: 100, // 화면 상단에서 100px 위치
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              'assets/images/1.png',
                              width: 250, // 가로 크기
                              height: 250, // 세로 크기
                              fit: BoxFit.contain,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 280), // 이미지 아래 여유 공간
                                Text(
                                  '사진 불러오기를 통해 알약을\n인식해보세요!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: textSize,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                    fontFamily: fonts[fontIndex] == 'Default'
                                        ? null
                                        : fonts[fontIndex],
                                  ),
                                ),
                                const SizedBox(height: 50),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // 사진 불러오기 버튼 동작
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                      const AllowPage(),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFB2E9E9),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0,
                                      vertical: 32.0,
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    '사진 불러오기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: textSize,
                                      fontFamily: fonts[fontIndex] == 'Default'
                                          ? null
                                          : fonts[fontIndex],
                                    ),
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
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const SettingsPage(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 8), // 아이콘과 텍스트 간격
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const SettingsPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '설정',
                                    style: TextStyle(
                                      fontSize: textSize,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: fonts[fontIndex] == 'Default'
                                          ? null
                                          : fonts[fontIndex],
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
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName('/'),
                          ); // 홈으로 이동
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
