import 'package:flutter/material.dart';

class Listviewdemo extends StatefulWidget {
  const Listviewdemo({super.key});

  @override
  State<Listviewdemo> createState() => _ListviewdemoState();
}

class _ListviewdemoState extends State<Listviewdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.pinkAccent,
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
