import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF1E1E1E),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF2C2C2C),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
  ),
  home: HomePage(),
));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telegram"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.search)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mode_edit),
      ),
      body: ListView(
        children: [
          chatTile("Telegram", "Video Calls with up to 1000 ...", "12:30 pm", Colors.blue, "T"),
          chatTile("SB Lim", "Good Morning!!", "12:30 pm", Colors.purple, "S"),
          chatTile("John", "How are you?", "12:30 pm", Colors.blue, "J"),
          chatTile("Cindy", "Are you free tonight?", "12:30 pm", Colors.green, "C"),
          chatTile("Lily", "I am fine!!", "12:30 pm", Colors.pink, "L"),
          chatTile("Kathy", "Kathy joined Telegram!!", "12:30 pm", Colors.blue, "K", isJoinMessage: true),
        ],
      ),
    );
  }

  Widget chatTile(String name, String message, String time, Color color, String initial, {bool isJoinMessage = false}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 28,
        child: Text(
          initial,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: isJoinMessage
          ? RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: message,
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ],
        ),
      )
          : Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check, size: 16, color: Colors.blue),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
