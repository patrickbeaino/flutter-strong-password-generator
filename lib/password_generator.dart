// ignore_for_file: unnecessary_string_interpolations

import 'dart:math';

// Generate a mix of 20 characters
String generatePassword() {
  const length = 20;
  const lowerLetter = 'abcdefghijklmnopqrstuvwxyz';
  const upperLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const numbers = '0123456789';
  const characters = '!@#*()_-=+{]}|:?;/>.,<';

  String chars = '';
  chars += '$upperLetter$lowerLetter';
  chars += '$numbers';
  chars += '$characters';

  return List.generate(length, (index) {
    final indexRandom = Random().nextInt(chars.length);

    return chars[indexRandom];
  }).join('');
}

// Generate a mix of 10 characters

String generatePasswordTenChar() {
  const length = 10;
  const lowerLetter = 'abcdefghijklmnopqrstuvwxyz';
  const upperLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const numbers = '0123456789';
  const characters = '!@#*()_-=+{]}|:?;/>.,<';

  String chars = '';
  chars += '$upperLetter$lowerLetter';
  chars += '$numbers';
  chars += '$characters';

  return List.generate(length, (index) {
    final indexRandom = Random().nextInt(chars.length);

    return chars[indexRandom];
  }).join('');
}

// Generate a mix of 7 characters

String generatePasswordSevenChar() {
  const length = 7;
  const lowerLetter = 'abcdefghijklmnopqrstuvwxyz';
  const upperLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const numbers = '0123456789';
  const characters = '!@#*()_-=+{]}|:?;/>.,<';

  String chars = '';
  chars += '$upperLetter$lowerLetter';
  chars += '$numbers';
  chars += '$characters';

  return List.generate(length, (index) {
    final indexRandom = Random().nextInt(chars.length);

    return chars[indexRandom];
  }).join('');
}

// Generate a password without Characters

String generatePasswordNoChar() {
  int length = 10;
  const lowerLetter = 'abcdefghijklmnopqrstuvwxyz';
  const upperLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const numbers = '0123456789';

  String chars = '';
  chars += '$upperLetter$lowerLetter';
  chars += numbers;

  return List.generate(length, (index) {
    final indexRandom = Random().nextInt(chars.length);

    return chars[indexRandom];
  }).join('');
}

// Generate a password without Numbers

String generatePasswordNoNum() {
  const length = 10;
  const lowerLetter = 'abcdefghijklmnopqrstuvwxyz';
  const upperLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  const characters = '!@#*()_-=+{]}|:?;/>.,<';

  String chars = '';
  chars += '$upperLetter$lowerLetter';

  chars += '$characters';

  return List.generate(length, (index) {
    final indexRandom = Random().nextInt(chars.length);

    return chars[indexRandom];
  }).join('');
}

// Generate a password without Characters and Numbers

String generatePasswordNoCharNoNum() {
  const length = 10;
  const lowerLetter = 'abcdefghijklmnopqrstuvwxyz';
  const upperLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  String chars = '';
  chars += '$upperLetter$lowerLetter';

  return List.generate(length, (index) {
    final indexRandom = Random().nextInt(chars.length);

    return chars[indexRandom];
  }).join('');
}
