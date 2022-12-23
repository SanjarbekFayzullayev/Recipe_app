import 'package:flutter/material.dart';


class DetalsPage extends StatefulWidget {
  final String image;
  final String name;
  final String about;
  final int maynan;

  DetalsPage({
    Key? key,
    required this.image,
    required this.name,
    required this.about,
    required this.maynan,
  }) : super(key: key);

  @override
  State<DetalsPage> createState() => _DetalsPageState();
}

class _DetalsPageState extends State<DetalsPage> {
  int zakast = 0;
  int add = 0;


  void buy() {
    setState(() {
      add = zakast * widget.maynan;
    });
  }

  void zAdd() {
    setState(() {
      zakast++;
      add = zakast * widget.maynan;
    });
  }

  void zDelet() {
    setState(() {
      if (zakast != 0) {
        zakast--;
        add = zakast * widget.maynan;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detals Page"),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 19,
                      shadowColor: Colors.grey,
                      child: Column(
                        children: [
                          Image.asset(
                            widget.image,
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            widget.about,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            zAdd();
                          },
                          child: Icon(Icons.plus_one),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${zakast}",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {
                            zDelet();
                          },
                          child: Icon(Icons.exposure_minus_1),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          add.toString() + " SUM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 350,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Buy")),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
