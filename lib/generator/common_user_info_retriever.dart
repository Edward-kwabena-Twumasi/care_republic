import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> getUserInformation(
    Map<String, dynamic> matchingRegistryAccount) {
  List firstUserAccount = matchingRegistryAccount['_ids'][0].split('-');

  if (int.parse(firstUserAccount[1]) >= 5) {
    return FirebaseFirestore.instance
        .collection('shop')
        .doc(firstUserAccount[0])
        .get();
  } else if (int.parse(firstUserAccount[1]) >= 2) {
    return FirebaseFirestore.instance
        .collection('worker')
        .doc(firstUserAccount[0])
        .get();
  } else {
    return FirebaseFirestore.instance
        .collection('client')
        .doc(firstUserAccount[0])
        .get();
  }
}
