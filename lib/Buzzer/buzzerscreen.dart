
import 'package:cart_page/Buzzer/controllers/BuzzerController.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BuzzerController extends GetxController {
  final teamcontroller = TextEditingController();
}

class BuzzerScreen extends StatefulWidget {
  BuzzerScreen({Key? key}) : super(key: key);

  @override
  State<BuzzerScreen> createState() => _BuzzerScreenState();
}

class _BuzzerScreenState extends State<BuzzerScreen> {
  var db = FirebaseFirestore.instance;

  final BuzzerController buzzerController = Get.put(BuzzerController());
  final QuestionController questionController = Get.put(QuestionController());
  final CountDownController _controller = CountDownController();
  late Stream<QuerySnapshot> buzzerStream;
  List<Map<String, dynamic>> results = [];

  Map<String, dynamic> sendData(bool val) {
    return {
      "questionId": questionController.quesId.value,
      "teamName": buzzerController.teamcontroller.text,
      "startTime": DateTime.now().millisecondsSinceEpoch,
      "answer": val
    };
  }

  @override
  void dispose() {
    _cancelBuzzerStreamSubscription();
    super.dispose();
  }

  void _subscribeToBuzzerStream() {
    print(questionController.quesId.value);
    buzzerStream =
        _getBuzzerStreamForQuestionId(questionController.quesId.value);
    buzzerStream.listen((snapshot) {
      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          var data = change.doc.data() as Map<String, dynamic>;
          if (data['answer'] == true) {
            updateResultsTable(data);
          }
        }
      }
    });
  }

  void _cancelBuzzerStreamSubscription() {
    buzzerStream.drain();
  }

  Stream<QuerySnapshot> _getBuzzerStreamForQuestionId(int id) {
    print(id);
    return db.collection("question $id").snapshots();
  }

  Future<void> deleteDocumentsByTeamName(String teamName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("question ${questionController.quesId.value}")
          .where('teamName', isEqualTo: teamName)
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
      }
    } catch (error) {
      print('Error deleting documents: $error');
    }
  }

  void updateResultsTable(Map<String, dynamic> data) async {
    if (!mounted) return;

    String teamName = data['teamName'];
    int startTimeTrue = data['startTime'];
    int timeDifference = 0;

    var querySnapshot = await FirebaseFirestore.instance
        .collection("question ${questionController.quesId.value}")
        .where('teamName', isEqualTo: teamName)
        .where('questionId', isEqualTo: questionController.quesId.value)
        .where('answer', isEqualTo: false)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      int startTimeFalse = querySnapshot.docs.first['startTime'];

      timeDifference = startTimeTrue - startTimeFalse;
    }

    if (!mounted) return;

    setState(() {
      results.add({
        'teamName': teamName,
        'timeDifference': timeDifference,
      });

      results
          .sort((a, b) => a['timeDifference'].compareTo(b['timeDifference']));

      if (results.length > 4) {
        results.removeLast();
      }
    });
  }

  Future<void> calculateTimeDifferenceForOtherTeams(
      String userTeamName, int questionId) async {
    List<Map<String, dynamic>> otherTeamResults = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collectionGroup('question $questionId')
          .where('teamName', isNotEqualTo: userTeamName)
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        if (documentSnapshot.exists) {
          bool isAnswerTrue = documentSnapshot['answer'] == true;
          int startTime = documentSnapshot['startTime'];

          QuerySnapshot oppositeAnswerQuerySnapshot = await FirebaseFirestore
              .instance
              .collection('question $questionId')
              .where('teamName', isEqualTo: documentSnapshot['teamName'])
              .where('answer', isEqualTo: !isAnswerTrue)
              .get();

          if (oppositeAnswerQuerySnapshot.docs.isNotEmpty) {
            int oppositeAnswerStartTime =
                oppositeAnswerQuerySnapshot.docs.first['startTime'];
            int timeDifference = isAnswerTrue
                ? startTime - oppositeAnswerStartTime
                : oppositeAnswerStartTime - startTime;

            otherTeamResults.add({
              'teamName': documentSnapshot['teamName'],
              'timeDifference': timeDifference,
            });
          }
        }
      }
      setState(() {
        results.addAll(otherTeamResults);
        results
            .sort((a, b) => a['timeDifference'].compareTo(b['timeDifference']));
      });
      print(results.toString());
    } catch (error) {
      print('Error calculating time difference for other teams: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Showdown",style: TextStyle(fontFamily: "berky"),),
        actions: [
          IconButton(
            onPressed: () {
              deleteDocumentsByTeamName(buzzerController.teamcontroller.text);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Team : ${buzzerController.teamcontroller.text}",
              style: const TextStyle(fontSize: 22,fontFamily: "berky"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularCountDownTimer(
                  controller: _controller,
                  initialDuration: 30,
                  autoStart: false,
                  width: MediaQuery.of(context).size.height * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  duration: 30,
                  fillColor: Colors.black,
                  ringColor: Colors.grey,
                  onComplete: () async {
                    // calculateTimeDifferenceForOtherTeams(
                    //     buzzerController.teamcontroller.text,
                    //     questionController.quesId.value);
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                  ),
                  onPressed: () {
                    db
                        .collection(
                            "question ${questionController.quesId.value}")
                        .add(sendData(false))
                        .then((DocumentReference ref) => print(ref.id));
                    _controller.restart();
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "berky"),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                  ),
                  onPressed: () {
                    _controller.reset();
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.white,fontFamily: "berky"),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ElevatedButton(
              onPressed: () {
                db
                    .collection("question ${questionController.quesId.value}")
                    .add(sendData(true))
                    .then((DocumentReference ref) => print(ref.id));
                _subscribeToBuzzerStream();
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(80),
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'BUZZER',
                style: TextStyle(
                  fontFamily: "berky",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Question :  ${questionController.quesId.value}",
                  style: const TextStyle(fontSize: 20,fontFamily: "berky"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await deleteDocumentsByTeamName(
                        buzzerController.teamcontroller.text);
                    setState(() {
                      questionController.quesId.value++;
                    });
                    results.clear();
                  },
                  child: const Text("Next Question",style: TextStyle(fontFamily: "berky"),),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Results : ",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10),
            DataTable(
              columns: [
                const DataColumn(label: Text('Team Name',style: TextStyle(fontFamily: "berky"),)),
                const DataColumn(label: Text('Time Difference',style: TextStyle(fontFamily: "berky"),)),
              ],
              rows: results.map((result) {
                return DataRow(
                  cells: [
                    DataCell(Text(result['teamName'])),
                    DataCell(Text('${result['timeDifference'] / 1000} s')),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}