import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive UI"),
        elevation: 30,
      ),
      body: SizedBox(
        width: width,
        height: 600,
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.2,
                width: double.infinity,
                color: Colors.red,
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.3,
                        height: double.infinity,
                        child: Text("ss"),
                        color: Colors.blue,
                      ),
                      Container(
                        width: constraints.maxWidth * 0.3,
                        height: double.infinity,
                        child: Text("ssss"),
                        color: Colors.grey,
                      ),
                      Container(
                        width: constraints.maxWidth * 0.3,
                        color: Colors.white,
                        height: double.infinity,
                        child: Text("sss"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.2,
                width: double.infinity,
                child: Text(""),
                color: Colors.black,
              ),
              Container(
                height: constraints.maxHeight * 0.2,
                width: double.infinity,
                child: Text(""),
                color: Colors.grey,
              ),
              Container(
                height: constraints.maxHeight * 0.2,
                width: double.infinity,
                child: Text(""),
                color: Colors.deepOrange,
              ),
              Container(
                height: constraints.maxHeight * 0.2,
                width: double.infinity,
                child: Text(""),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
