import 'package:flutter/material.dart';
import 'package:qachecklist_login/theme/theme_manager.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

ThemeManager _themeManager=ThemeManager();

class _SettingsState extends State<Settings> {
  
  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
     ThemeMode themmode = _themeManager.themeMode;
    return Scaffold(
      appBar: AppBar(title: Text('Settings ',),actions: [
          Switch(
              value: themmode == ThemeMode.light,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],),
      
      body: Center(child: Text('Setting contents'),),
      
    ); 
  }
}