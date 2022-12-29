import 'package:flutter/material.dart';
import 'package:registration/result.dart';

const List<String> langs = <String>[
  "English",
  "Română",
  "Русский",
  "Kirundi",
  "Türkmen"
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Регистрация',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Регистрация'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _firstname = "";
  String _lastname = "";
  String _aboutText = "";
  int _gender = 0;
  bool _policy = false;
  bool _isSwiched = false;
  String _lang = langs.first;

  final aboutController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    aboutController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          //child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Registration',
              ),
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(300)
                },
                children: [
                  TableRow(children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: const Text("Имя")),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: firstnameController,
                        decoration: const InputDecoration(
                          hintText: 'Введите ваше имя',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'ИМЯ!!!!!';
                          }
                          return null;
                        },
                        /*onSaved: (String? value) {
                          firstname = value!;
                        },*/
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: const Text("Фамилия")),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: lastnameController,
                        decoration: const InputDecoration(
                          hintText: 'Введите вашу фамилию',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Фамилия!!!!!!';
                          }
                          return null;
                        },
                        /*onSaved: (String? value) {
                          lastname = value!;
                        },*/
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                width: 600,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Выбираем пол"),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                          title: const Text("Женский"),
                          value: 0,
                          groupValue: _gender,
                          onChanged: (int? value) {
                            setState(() {
                              _gender = value!;
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                          title: const Text("Мужской"),
                          value: 1,
                          groupValue: _gender,
                          onChanged: (int? value) {
                            setState(() {
                              _gender = value!;
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                          title: const Text("Котик"),
                          value: 1,
                          groupValue: _gender,
                          onChanged: (int? value) {
                            setState(() {
                              _gender = value!;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.all(5), child: Text("Выбор языка")),
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: DropdownButton(
                          value: _lang,
                          items: langs
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _lang = value!;
                            });
                          }))
                ],
              ),
              Container(
                width: 400,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Text("Потыкаем?"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Switch(
                          value: _isSwiched,
                          onChanged: (bool? value) {
                            setState(() => {_isSwiched = value!});
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                      child: const Text("О себе (необязательно)"),
                    ),
                    TextField(
                      controller: aboutController,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Checkbox(
                        value: _policy,
                        onChanged: (bool? value) {
                          setState(() {
                            _policy = value!;
                          });
                        },
                      )),
                  const Text("Для галочки")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _firstname = firstnameController.text;
                      _lastname = lastnameController.text;
                      _aboutText = aboutController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                              title: "",
                              firstname: _firstname,
                              lastname: _lastname,
                              gender: _gender,
                              lang: _lang,
                              isSwiched: _isSwiched,
                              aboutText: _aboutText,
                              policy: _policy),
                        ),
                      );
                    }
                  },
                  child: const Text('Залетаем'),
                ),
              ),
            ],
          ),
          //),
        ));
  }
}
