import 'package:flutter/material.dart';

class ListBuilder extends StatelessWidget {
  const ListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                color: Colors.blue,
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.pinkAccent,
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black,
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
