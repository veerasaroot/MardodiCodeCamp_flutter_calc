import 'package:calculator/history.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;

  String input = '';
  double output;

  List<Map<String, String>> history = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _submit() {
    if (input.length == 0) {
      return null;
    }
    Parser p = new Parser();
    Expression exp = p.parse(input);
    ContextModel cm = new ContextModel();
    if (mounted) {
      setState(() {
        output = exp.evaluate(EvaluationType.REAL, cm);
        history.add({
          'input': input,
          'output': output.toString(),
        });
      });
    }
  }

  Widget _calculatorPage() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          color: Color(0xFF282828),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 28, bottom: 10),
                child: Text(
                  input,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 28, bottom: 28),
                child: Text(
                  output == null ? '' : output.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Color(0xFF282828),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  // 1 row
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input.length == 0
                                  ? null
                                  : input =
                                      input.substring(0, input.length - 2);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                MaterialIcons.clear,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input = '';
                              output = null;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '% ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '÷',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '/ ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  // 2 row
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '7',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '7 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '8 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '9 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                MaterialIcons.close,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '* ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  // 3 row
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '4 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '5 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '6',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '6 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 42,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '- ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  // 4 row
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '1 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '2 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '3 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 42,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '+ ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  // 5 row
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '^',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '^ ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '0 ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFF727272),
                        ),
                        child: OutlineButton(
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          borderSide: BorderSide(color: Colors.white38),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '.',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: () {
                            setState(() {
                              input += '. ';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF7556),
                      ),
                      width: 75,
                      height: 75,
                      child: Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Color(0xFFFF7556),
                        ),
                        child: OutlineButton(
                          focusColor: Color(0xFFFF7556),
                          splashColor: Colors.white12,
                          shape: CircleBorder(),
                          highlightedBorderColor: Color(0xFFFF7556),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '=',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xFF424242),
                          onPressed: _submit,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        HistoryPage(history: history),
        _calculatorPage(),
      ],
    );
  }
}
