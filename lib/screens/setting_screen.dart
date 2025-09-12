import 'package:flutter/material.dart';
import '../Utils/settings_manager.dart';
import '../bloc/game_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Difficulty _selectedDifficulty = Difficulty.easy;

  @override
  void initState() {
    super.initState();
    _loadDifficulty();
  }

  Future<void> _loadDifficulty() async {
    final difficulty = await SettingsManager.getDifficulty();
    setState(() {
      _selectedDifficulty = difficulty;
    });
  }

  Future<void> _saveDifficulty(Difficulty difficulty) async {
    await SettingsManager.setDifficulty(difficulty);
    setState(() {
      _selectedDifficulty = difficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AI Difficulty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Easy'),
              leading: Radio<Difficulty>(
                value: Difficulty.easy,
                groupValue: _selectedDifficulty,
                onChanged: (Difficulty? value) {
                  if (value != null) {
                    _saveDifficulty(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Medium'),
              leading: Radio<Difficulty>(
                value: Difficulty.medium,
                groupValue: _selectedDifficulty,
                onChanged: (Difficulty? value) {
                  if (value != null) {
                    _saveDifficulty(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Hard'),
              leading: Radio<Difficulty>(
                value: Difficulty.hard,
                groupValue: _selectedDifficulty,
                onChanged: (Difficulty? value) {
                  if (value != null) {
                    _saveDifficulty(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}