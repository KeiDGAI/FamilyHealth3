import 'package:cloud_firestore/cloud_firestore.dart';

class HealthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveHealthData(String userId, String date, Map<String, dynamic> data) async {
    await _firestore.collection('healthData').doc(userId).collection('dates').doc(date).set(data);
  }

  Future<Map<String, dynamic>?> getHealthData(String userId, String date) async {
    final doc = await _firestore.collection('healthData').doc(userId).collection('dates').doc(date).get();
    return doc.data();
  }
}
