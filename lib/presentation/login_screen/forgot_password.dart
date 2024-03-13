

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword.forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _textController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter your email address and we will send u a password reset link",
            style: TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          // Add spacing
          Padding(
            padding: const EdgeInsets.all(8.0), // Consistent padding
            child: Column(
              // Align elements horizontally
              children: [
                // Expand the text field to fill most of the row
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Enter your email",
                    suffixIcon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0), // Add spacing between elements

                MaterialButton(
                  onPressed: ()=> passwordReset(),
                  color: Colors.blue,
                  elevation: 5.0,
                  // Add depth effect
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: Text(
                    "Password Reset",
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
