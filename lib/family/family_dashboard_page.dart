import 'package:flutter/material.dart';
import '../widgets/user_avatar.dart';
import '../widgets/large_button.dart';

class FamilyDashboardPage extends StatelessWidget {
  const FamilyDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 仮データ
    final String groupName = '山田家';
    final List<Map<String, String?>> members = [
      {'name': '太郎', 'photoUrl': null},
      {'name': '花子', 'photoUrl': null},
      {'name': '次郎', 'photoUrl': null},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('家族ダッシュボード')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('グループ名: $groupName', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('メンバー一覧:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            SizedBox(
              height: 100, // 高さを調整
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: members.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, i) => Column(
                  children: [
                    UserAvatar(photoUrl: members[i]['photoUrl']),
                    const SizedBox(height: 4),
                    Text(members[i]['name'] ?? '', style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            LargeButton(
              label: '家族グループ作成',
              onPressed: () => Navigator.pushNamed(context, '/family_create'),
            ),
            const SizedBox(height: 16),
            LargeButton(
              label: 'メンバー追加',
              onPressed: () {/* メンバー追加処理 */},
            ),
            const SizedBox(height: 32),
            LargeButton(
              label: '健康データダッシュボードへ',
              onPressed: () => Navigator.pushNamed(context, '/health'),
            ),
          ],
        ),
      ),
    );
  }
}
