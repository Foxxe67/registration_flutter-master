import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.title,
      this.firstname,
      this.lastname,
      this.aboutText,
      this.gender,
      this.policy,
      this.isSwiched,
      this.lang});

  final String title;

  final String? firstname;
  final String? lastname;
  final String? aboutText;
  final int? gender;
  final bool? policy;
  final bool? isSwiched;
  final String? lang;

  String getText() {
    String text;
    text = "Имя: $firstname \n" +
        "Фамилия: $lastname \n" +
        "Пол: ${gender == 0 ? "Женский" : "Мужской" "Котик"} \n" +
        "Язык: $lang \n" +
        "Переключатель: ${isSwiched == true ? "вкл" : "выкл"} \n" +
        "О себе: $aboutText \n" +
        "Галочка: ${policy == true ? "Да" : "Нет"}";
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Text(getText()),
          ),
        ));
  }
}
