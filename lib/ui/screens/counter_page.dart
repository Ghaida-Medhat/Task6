import 'package:flutter/material.dart';

class MyPage2 extends StatefulWidget {

  @override
  State<MyPage2> createState() => _MyPage2State();

}

class _MyPage2State extends State<MyPage2> {
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  double sum = 0;

  void getSum() {
    setState(() {
      sum = double.parse(input1Controller.text) +
          double.parse(input2Controller.text);

    }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: const Text('Counter',
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: input1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter the first number',
                  hintStyle: TextStyle(
                    color: Colors.white, fontSize: 20
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: input2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter the second number',
                  hintStyle: TextStyle(
                    color: Colors.white, fontSize: 20
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  alignment: Alignment.center,
                  maximumSize: const Size(200, 100),
                  padding: const EdgeInsets.all(10)),
              onPressed: () {
                getSum();
              },
              child: Text('Calculate sum',
              style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The sum = $sum',
                  style: TextStyle( fontSize: 20),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}