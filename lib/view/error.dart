import 'package:flutter/material.dart';
import 'package:randomquiz/service/remote_service.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          child: Card(
            child: Column(
              children: [
                Text("No Internet Connection"),
                ElevatedButton(
                  onPressed: () {
                    fetchQuiz();
                  },
                  child: Text("Try Again"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
