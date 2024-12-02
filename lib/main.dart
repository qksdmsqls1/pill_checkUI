import 'package:flutter/material.dart';
import 'tema.dart'; // 테마 설정 페이지 import
import 'user.dart';
import 'mmain.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pill Check',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SettingsPage(),
    );
  }
}

// 전역 상태 관리
class ThemeState {
  static ValueNotifier<Color> backgroundColor = ValueNotifier<Color>(Colors.white);
  static ValueNotifier<Color> textColor = ValueNotifier<Color>(Colors.black);
  static ValueNotifier<double> textSize = ValueNotifier<double>(16.0); // 글씨 크기 초기값
  static ValueNotifier<int> fontIndex = ValueNotifier<int>(0); // 폰트 인덱스 상태
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
          onPressed: () { Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()), // mmain.dart의 MainPage로 이동
          );
            // 뒤로가기 로직
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: ThemeState.backgroundColor,
        builder: (context, backgroundColor, child) {
          return Container(
            color: backgroundColor,
            child: Column(
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
                                '설정',
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
                  child: ListView(
                    children: [
                      _buildSettingsTile(
                        icon: Icons.color_lens,
                        title: '화면 테마 설정',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ThemeSettingsPage(),
                            ),
                          );
                        },
                      ),
                      _buildSettingsTile(
                        icon: Icons.person,
                        title: '계정 설정',
                        onTap: () {
                          // 계정 설정 로직
                        },
                      ),
                      _buildSettingsTile(
                        icon: Icons.update,
                        title: '버전 및 업데이트 확인',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BlankPage(), // BlankPage로 이동
                            ),
                          );
                        },
                      ),
                      // 이미지 추가 부분
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/1.png', // 이미지 경로
                            width: 300, // 이미지 너비
                            height: 300, // 이미지 높이
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: ThemeState.textColor,
                  builder: (context, textColor, child) {
                    return ValueListenableBuilder(
                      valueListenable: ThemeState.textSize,
                      builder: (context, textSize, child) {
                        return ValueListenableBuilder(
                          valueListenable: ThemeState.fontIndex,
                          builder: (context, fontIndex, child) {
                            final fonts = ['Default', 'Serif', 'Monospace'];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'version 1.0',
                                style: TextStyle(
                                  fontFamily: fonts[fontIndex] == 'Default' ? null : fonts[fontIndex],
                                  color: textColor,
                                  fontSize: textSize * 0.8,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
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
              // 홈 이동 로직
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ValueListenableBuilder(
      valueListenable: ThemeState.backgroundColor,
      builder: (context, backgroundColor, child) {
        final buttonBackgroundColor = backgroundColor == Colors.black
            ? Colors.grey.shade800
            : Colors.white; // 버튼 배경색
        final buttonTextColor = backgroundColor == Colors.black
            ? Colors.white
            : Colors.black; // 버튼 텍스트 색상

        return ValueListenableBuilder(
          valueListenable: ThemeState.textSize,
          builder: (context, textSize, child) {
            return ValueListenableBuilder(
              valueListenable: ThemeState.fontIndex,
              builder: (context, fontIndex, child) {
                final fonts = ['Default', 'Serif', 'Monospace'];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: buttonBackgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: const Color(0xFFBBBBBB)),
                  ),
                  child: ListTile(
                    leading: Icon(icon, size: 30, color: buttonTextColor),
                    title: Text(
                      title,
                      style: TextStyle(
                        fontFamily: fonts[fontIndex] == 'Default' ? null : fonts[fontIndex],
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                        color: buttonTextColor,
                      ),
                    ),
                    onTap: onTap,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
