// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strong_password_generator/password_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  bool checkbox = false;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;

  bool _newText = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 100.0,
              // ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      readOnly: true,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
                      controller: controller,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                      maxLength: 20,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            final passwordGenerated =
                                ClipboardData(text: controller.text);
                            Clipboard.setData(passwordGenerated);

                            const snackBar =
                                SnackBar(content: Text('✓ Password copied'));
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                          icon: const Icon(Icons.copy),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.all(7.0),
                child: CheckboxListTile(
                    title: const Text('Use a mix of 20 characters'),
                    // checkColor: Colors.black,
                    activeColor: Colors.blue,
                    value: checkbox,
                    onChanged: (newValue) {
                      setState(() {
                        checkbox = newValue!;
                        if (checkbox == true) {
                          checkbox1 = false;
                          checkbox2 = false;
                          checkbox3 = false;
                          checkbox4 = false;
                        }
                      });
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(7.0),
                child: CheckboxListTile(
                    title: const Text('Use a mix of only 10 characters'),
                    // checkColor: Colors.black,
                    activeColor: Colors.blue,
                    value: checkbox1,
                    onChanged: (newValue) {
                      setState(() {
                        checkbox1 = newValue!;
                        if (checkbox1 == true) {
                          checkbox = false;
                          checkbox2 = false;
                          checkbox3 = false;
                        }
                      });
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(7.0),
                child: CheckboxListTile(
                    title: const Text('Use a mix of only 7 characters'),
                    // checkColor: Colors.black,
                    activeColor: Colors.blue,
                    value: checkbox2,
                    onChanged: (newValue) {
                      setState(() {
                        checkbox2 = newValue!;
                        if (checkbox2 == true) {
                          checkbox = false;
                          checkbox1 = false;
                          checkbox3 = false;
                          checkbox4 = false;
                        }
                      });
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(7.0),
                child: CheckboxListTile(
                    title: const Text('No special characters'),
                    // checkColor: Colors.black,
                    activeColor: Colors.blue,
                    value: checkbox3,
                    onChanged: (newValue) {
                      setState(() {
                        checkbox3 = newValue!;
                        if (checkbox3 == true) {
                          checkbox = false;
                          checkbox1 = false;
                          checkbox2 = false;
                        }
                      });
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(7.0),
                child: CheckboxListTile(
                    title: const Text('No numbers'),
                    // checkColor: Colors.black,
                    activeColor: Colors.blue,
                    value: checkbox4,
                    onChanged: (newValue) {
                      setState(() {
                        checkbox4 = newValue!;
                        if (checkbox4 == true) {
                          checkbox = false;
                          checkbox1 = false;
                          checkbox2 = false;
                        }
                      });
                    }),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onLongPress: () {
                  controller.clear();
                  resetCheckbox();
                  setState(() {
                    _newText = true;
                  });
                },
                onPressed: () {
                  onTrigger();
                  if ((checkbox ||
                          checkbox1 ||
                          checkbox2 ||
                          checkbox3 ||
                          checkbox4) ==
                      false) {
                    setState(() {
                      _newText = true;
                    });
                  } else {
                    setState(() {
                      _newText = false;
                    });
                  }
                },
                child: Text(
                  _newText ? 'Generate Password' : 'Generate New Password',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTrigger() {
    if (checkbox3 && checkbox4 == true) {
      final password = generatePasswordNoCharNoNum();
      controller.text = password;
    } else if (checkbox == true) {
      final password = generatePassword();
      controller.text = password;
    } else if (checkbox1 == true) {
      final password = generatePasswordTenChar();
      controller.text = password;
    } else if (checkbox2 == true) {
      final password = generatePasswordSevenChar();
      controller.text = password;
    } else if (checkbox3 == true) {
      final password = generatePasswordNoChar();
      controller.text = password;
    } else if (checkbox4 == true) {
      final password = generatePasswordNoNum();
      controller.text = password;
    }
  }

  void resetCheckbox() {
    setState(() {
      checkbox = false;
      checkbox1 = false;
      checkbox2 = false;
      checkbox3 = false;
      checkbox4 = false;
    });
  }
}
