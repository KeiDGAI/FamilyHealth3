import 'package:flutter/material.dart';

class HealthDashboardPage extends StatelessWidget {
  const HealthDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('健康データダッシュボード')),
      body: const Center(child: Text('健康データダッシュボード画面（仮）')),
    );
  }
}
