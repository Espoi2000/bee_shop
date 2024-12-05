import 'package:beep_shop/boostrap.dart';
import 'package:beep_shop/shared/application.dart';
import 'package:flutter/material.dart';

void main() async {
  await boostrap(
    () => const Application(),
  );
}
