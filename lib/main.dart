import 'package:dot_calculator/Calculator_Dot.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextinputControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('شمارشگر نقطه'),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      controller: TextinputControl,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'متن خود را وارد کنید',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                          )),
                      // اضافه کردن یک اسپیس آخر متن برای  نشمردن حرف  ی که اگه آخر متن باشه
                      onChanged: (text) {
                        if (!text.endsWith(' ')) {
                          TextinputControl.value = TextEditingValue(
                            text: '$text ',
                            selection:
                                TextSelection.collapsed(offset: text.length),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 40),
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          DotCalculator(TextinputControl.toString());
                        });
                      },
                      child: Text(
                        '!!! بشمار',
                        style: TextStyle(fontSize: 19),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '${DotCalculator(TextinputControl.toString())}',
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
