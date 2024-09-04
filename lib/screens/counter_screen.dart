import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int? number = 0;
  late SharedPreferences prefs;

  @override
  void initState() async {
    prefs = await SharedPreferences.getInstance();
    readNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
            child: Text(
          "Counter App",
          style: TextStyle(color: Colors.grey),
        )),
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "$number",
            style: const TextStyle(
              fontSize: 70,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: add,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: reset,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              GestureDetector(
                onTap: subtract,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  void add() async {
    setState(() {
      number = number! + 1;
    });
    await prefs.setInt("number", number!);
  }

  void subtract() async {
    setState(() {
      number = number! - 1;
    });
    await prefs.setInt("number", number!);
  }

  void readNumber() async {
    number = prefs.getInt("number") ?? 0;
  }

  void reset() async {
    setState(() {
      number = 0;
    });
    await prefs.setInt("number", number!);
  }
}
