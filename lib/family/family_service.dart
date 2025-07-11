import 'package:cloud_firestore/cloud_firestore.dart';

class FamilyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createFamilyGroup(String name, String userId) async {
    final groupRef = await _firestore.collection('familyGroups').add({
      'name': name,
      'members': [userId],
    });
    // 必要に応じてユーザーのfamilyGroupIdを更新
    await _firestore.collection('users').doc(userId).update({
      'familyGroupId': groupRef.id,
    });
  }

  // 他のメソッドは後で追加
}
