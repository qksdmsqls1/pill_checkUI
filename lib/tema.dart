import 'package:flutter/material.dart';
import 'main.dart'; // ThemeState를 가져오기 위해 import

class ThemeSettingsPage extends StatefulWidget {
  const ThemeSettingsPage({super.key});

  @override
  _ThemeSettingsPageState createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  double _temporaryTextSize = ThemeState.textSize.value; // 임시 글씨 크기
  Color _temporaryBackgroundColor = ThemeState.backgroundColor.value;
  Color _temporaryTextColor = ThemeState.textColor.value;

  final List<String> _fonts = ['Default', 'Serif', 'Monospace']; // 사용할 폰트 리스트
  int _temporaryFontIndex = ThemeState.fontIndex.value; // 임시 폰트 인덱스

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pill check',
          style: TextStyle(
            fontFamily: _fonts[_temporaryFontIndex] == 'Default'
                ? null
                : _fonts[_temporaryFontIndex],
            fontWeight: FontWeight.bold,
            color: _temporaryTextColor,
            fontSize: _temporaryTextSize,
          ),
        ),
        backgroundColor: const Color(0xFFE9E9E9),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _temporaryTextColor),
          onPressed: () {
            Navigator.pop(context); // 이전 페이지로 돌아가기
          },
        ),
      ),
      body: Stack(
        children: [
          // 배경색 적용
          Positioned.fill(
            child: Container(
              color: _temporaryBackgroundColor, // 배경색
            ),
          ),
          // UI 요소
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFFBDBDBD),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '화면 테마 설정',
                  style: TextStyle(
                    fontSize: _temporaryTextSize,
                    fontWeight: FontWeight.bold,
                    color: _temporaryTextColor,
                    fontFamily: _fonts[_temporaryFontIndex] == 'Default'
                        ? null
                        : _fonts[_temporaryFontIndex],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '배경색상',
                  style: TextStyle(
                    fontSize: _temporaryTextSize,
                    fontWeight: FontWeight.bold,
                    color: _temporaryTextColor,
                    fontFamily: _fonts[_temporaryFontIndex] == 'Default'
                        ? null
                        : _fonts[_temporaryFontIndex],
                  ),
                ),
              ),
              _buildColorOptions(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Text(
                  '글씨 크기 및 폰트 설정',
                  style: TextStyle(
                    fontSize: _temporaryTextSize,
                    fontWeight: FontWeight.bold,
                    color: _temporaryTextColor,
                    fontFamily: _fonts[_temporaryFontIndex] == 'Default'
                        ? null
                        : _fonts[_temporaryFontIndex],
                  ),
                ),
              ),
              _buildFontSettings(),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // 설정 적용: 배경색, 텍스트 색상, 글씨 크기, 폰트 반영
                    ThemeState.backgroundColor.value = _temporaryBackgroundColor;
                    ThemeState.textColor.value = _temporaryTextColor;
                    ThemeState.textSize.value = _temporaryTextSize;
                    ThemeState.fontIndex.value = _temporaryFontIndex; // 폰트 상태 업데이트

                    Navigator.pop(context); // 설정 적용 후 뒤로가기
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDDD6D6),
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                  ),
                  child: Text(
                    '적용',
                    style: TextStyle(
                      fontSize: _temporaryTextSize,
                      color: _temporaryTextColor,
                      fontFamily: _fonts[_temporaryFontIndex] == 'Default'
                          ? null
                          : _fonts[_temporaryFontIndex],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          // 이미지를 UI 요소 위로 이동
          Positioned(
            left: 0, // 좌측 위치
            right: 0, // 우측 위치
            top: 300, // 상단 위치
            child: IgnorePointer( // 이미지를 터치 불가능하게 설정 (UI와 상호작용 방지)
              child: Image.asset(
                'assets/images/1.png', // 이미지 경로
                width: 300, // 이미지 너비
                height: 350, // 이미지 높이
                fit: BoxFit.contain, // 이미지 비율 유지
                alignment: Alignment.center, // 이미지 중앙 정렬
              ),
            ),
          ),
        ],
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

  Widget _buildColorOptions() {
    final colors = [
      {'color': Colors.red, 'label': '기본'},
      {'color': Colors.black, 'label': '블랙'},
      {'color': Colors.white, 'label': '화이트'},
      {'color': Colors.purple, 'label': '퍼플'},
      {'color': Colors.yellow, 'label': '옐로우'},
      {'color': Colors.greenAccent, 'label': '연두'},
      {'color': Colors.blue, 'label': '하늘'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: colors.map((colorInfo) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _temporaryBackgroundColor = colorInfo['color'] as Color;
                // 배경이 검정색이면 텍스트는 흰색, 아니면 검정색
                _temporaryTextColor = _temporaryBackgroundColor == Colors.black
                    ? Colors.white
                    : Colors.black;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: colorInfo['color'] as Color,
                ),
                const SizedBox(height: 8),
                Text(
                  colorInfo['label'] as String,
                  style: TextStyle(
                    fontSize: _temporaryTextSize * 0.6,
                    color: _temporaryTextColor,
                    fontFamily: _fonts[_temporaryFontIndex] == 'Default'
                        ? null
                        : _fonts[_temporaryFontIndex],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
  Widget _buildFontSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '글씨 크기',
                style: TextStyle(
                    fontSize: _temporaryTextSize, color: _temporaryTextColor),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_temporaryTextSize < 24.0) _temporaryTextSize += 2.0; // 최대 24.0
                  });
                },
                icon: const Icon(Icons.arrow_drop_up),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_temporaryTextSize > 12.0) _temporaryTextSize -= 2.0; // 최소 12.0
                  });
                },
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '폰트',
                style: TextStyle(
                    fontSize: _temporaryTextSize, color: _temporaryTextColor),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_temporaryFontIndex < _fonts.length - 1) {
                      _temporaryFontIndex++;
                    }
                  });
                },
                icon: const Icon(Icons.arrow_drop_up),
              ),
              Text(
                _fonts[_temporaryFontIndex],
                style: TextStyle(
                    fontSize: _temporaryTextSize, color: _temporaryTextColor),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_temporaryFontIndex > 0) {
                      _temporaryFontIndex--;
                    }
                  });
                },
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
