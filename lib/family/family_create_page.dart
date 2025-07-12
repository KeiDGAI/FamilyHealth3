import 'package:flutter/material.dart';
import '../widgets/large_button.dart';

class FamilyCreatePage extends StatefulWidget {
  const FamilyCreatePage({super.key});

  @override
  State<FamilyCreatePage> createState() => _FamilyCreatePageState();
}

class _FamilyCreatePageState extends State<FamilyCreatePage> {
  final _formKey = GlobalKey<FormState>();
  // サービス連携時に使用予定
  // ignore: unused_field
  String _groupName = '';
  String? _error;
  bool _loading = false;

  void _createGroup() {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _loading = true; _error = null; });
    _formKey.currentState!.save();
    Future(() async {
      try {
        // TODO: サービス層でグループ作成処理を呼び出す
        await Future.delayed(const Duration(seconds: 1)); // 仮処理
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        setState(() { _error = '作成に失敗しました:  ${e.toString()}'; });
      } finally {
        setState(() { _loading = false; });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('家族グループ作成')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'グループ名'),
                  validator: (v) => (v == null || v.isEmpty) ? 'グループ名を入力してください' : null,
                  onSaved: (v) => _groupName = v ?? '',
                  enabled: !_loading,
                ),
                const SizedBox(height: 24),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(_error!, style: const TextStyle(color: Colors.red)),
                  ),
                LargeButton(
                  label: '作成',
                  onPressed: _loading ? null : _createGroup,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
