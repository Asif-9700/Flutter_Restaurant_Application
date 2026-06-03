// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DatabaseMethods {
//   Future addTodayWork(Map<String, dynamic> userTodayMap, String id) async {
//     return await FirebaseFirestore.instance
//         .collection("Today")
//         .doc(id)
//         .set(userTodayMap);
//   }
//
//   Future addTomorrowWork(Map<String, dynamic> userTodayMap, String id) async {
//     return await FirebaseFirestore.instance
//         .collection("Tomorrow")
//         .doc(id)
//         .set(userTodayMap);
//   }
//
//   Future addNextWeekWork(Map<String, dynamic> userTodayMap, String id) async {
//     return await FirebaseFirestore.instance
//         .collection("NextWeek")
//         .doc(id)
//         .set(userTodayMap);
//   }
//
//   Future<Stream<QuerySnapshot>> getallthework(String day) async {
//     return await FirebaseFirestore.instance.collection(day).snapshots();
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DatabaseMethods {
//   Stream<QuerySnapshot> getallthework(String category) {
//     return FirebaseFirestore.instance
//         .collection(category)
//         .snapshots(); // 🔥 VERY IMPORTANT
//   }
//
//   Future addTodayWork(Map<String, dynamic> data, String id) async {
//     return FirebaseFirestore.instance.collection("Today").doc(id).set(data);
//   }
//
//   Future addTomorrowWork(Map<String, dynamic> data, String id) async {
//     return FirebaseFirestore.instance.collection("Tomorrow").doc(id).set(data);
//   }
//
//   Future addNextWeekWork(Map<String, dynamic> data, String id) async {
//     return FirebaseFirestore.instance.collection("NextWeek").doc(id).set(data);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Stream<QuerySnapshot> getallthework(String category) {
    return FirebaseFirestore.instance.collection(category).snapshots();
  }

  Future addTodayWork(Map<String, dynamic> data, String id) async {
    return FirebaseFirestore.instance.collection("Today").doc(id).set(data);
  }

  Future addTomorrowWork(Map<String, dynamic> data, String id) async {
    return FirebaseFirestore.instance.collection("Tomorrow").doc(id).set(data);
  }

  Future addNextWeekWork(Map<String, dynamic> data, String id) async {
    return FirebaseFirestore.instance.collection("NextWeek").doc(id).set(data);
  }
}
