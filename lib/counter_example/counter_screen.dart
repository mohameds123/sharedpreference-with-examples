import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    getCounter();
  }

  void increment() {
    setState(() {
      count++;

    });

    saveCounter();
  }

  void decrement() {
    count--;
    setState(() {});
    saveCounter();
  }

  void reset() {
    count = 0;
    setState(() {});
    saveCounter();
  }

  Future saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("counter", count);
  }

  Future getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int savedCount = prefs.getInt("counter") ?? 0;
    setState(() {
      count = savedCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "$count",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    increment();
                  },
                  icon: Icon(Icons.plus_one),
                ),
                IconButton(
                  onPressed: () {
                    decrement();
                  },
                  icon: Icon(Icons.exposure_minus_1_sharp),
                ),
                IconButton(
                  onPressed: () {
                    reset();
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
