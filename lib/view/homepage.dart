import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomquiz/model/quiz_model_Q&A.dart';
import 'package:randomquiz/service/remote_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<QuizModel>> QuizeModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QuizeModel = fetchQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<QuizModel>>(
          future: QuizeModel,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.lightBlue,
                        height: Get.size.height,
                        alignment: Alignment.center,
                        child: Container(
                          height: 500,
                          padding: const EdgeInsets.all(18),
                          width: Get.size.width,
                          // height: 350,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    alignment: Alignment.center,
                                    height: 200,
                                    child: Text(
                                      "${snapshot.data![index].question}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          alignment: Alignment.center,
                                          height: 80,
                                          child: Text(
                                            "${snapshot.data![index].answer}",
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: Get.size.width,
                                    height: 70,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          QuizeModel = fetchQuiz();
                                          setState(() {});
                                        },
                                        child: const Text("Next Please")),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
