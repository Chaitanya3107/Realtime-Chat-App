import 'package:flutter/material.dart';
import 'package:realtime_chat_app/Constant/colors.dart';
import 'package:realtime_chat_app/loginPage/chatPage/chatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get screen width to calculate dynamic padding/margins
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,

      // AppBar with no elevation, custom background, and an avatar in the actions
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Text(
          "Chats",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/user.png"),
            ),
          ),
        ],
      ),

      // Main content: list of chat items
      body: ListView.builder(
        itemCount: 10, // Number of chat tiles
        itemBuilder: (context, index) => ListTile(
          // Opens chat page on tap
          onTap: () => Navigator.pushNamed(context, "/chat"),
          leading: Stack(
            children: [
              // User avatar
              CircleAvatar(
                backgroundImage: AssetImage("assets/user.png"),
              ),
              // Online status indicator positioned at bottom-right
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: screenWidth * 0.013,
                ),
              ),
            ],
          ),
          // Chat item main details: title, subtitle, and trailing
          title: Text("Other User"),
          subtitle: Text("Hi, how are you?"),

          // Trailing widget showing unread messages count and last message time
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circle showing unread message count
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: screenWidth * 0.025,
                child: Text(
                  "10",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
              // Space between unread count and message time
              SizedBox(height: screenWidth * 0.02),
              // Time of last message
              Text("12:05"),
            ],
          ),
        ),
      ),

      // Floating action button for new chat
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define action for new chat here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
