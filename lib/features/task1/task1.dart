import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as extendedImage;

//1) Преобразовать изображение из RGB в оттенки серого. Реализовать два варианта формулы
//с учетом разных вкладов R, G и B в интенсивность (см презентацию).
//Затем найти разность полученных полутоновых изображений. Построить гистограммы
//интенсивности после одного и второго преобразования.

//1) grayscale = 0.3 * R + 0.59 * G + 0.11 * B
//2) grayscale = (R + G + B)/3
//3) int getLuminanceRgb(int r, int g, int b) =>
//    (0.299 * r + 0.587 * g + 0.114 * b).round();

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    final file = File('assets/1.jpg').readAsBytesSync();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: grayscale(extendedImage.decodeJpg(file)!),
      ),
    );
  }
}

Image grayscale(extendedImage.Image src) {
  final p = src.getBytes();
  for (var i = 0, len = p.length; i < len; i += 4) {
    final l = getLuminanceRgb(p[i], p[i + 1], p[i + 2]);
    p[i] = l;
    p[i + 1] = l;
    p[i + 2] = l;
  }

  return Image.memory(Uint8List.fromList(extendedImage.encodeJpg(p)));
}

int getLuminanceRgb(int r, int g, int b) =>
    (0.299 * r + 0.587 * g + 0.114 * b).round();
