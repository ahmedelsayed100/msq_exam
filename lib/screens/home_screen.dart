import 'package:flutter/material.dart';

import '../components.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.circular(20),
  );
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Linux Acadamy'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(screenWidth * 0.05),
        alignment: Alignment.center,
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: _border,
                  focusedBorder: _border,
                  filled: true,
                ),
                controller: _nameController,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter your name";
                  }
                },
              ),
              SizedBox(
                height: screenHeigth * 0.03,
              ),
              continueButton(
                label: "Continue",
                screenHeigth: screenHeigth,
                screenWidth: screenWidth,
                myFun: () {
                  if (_key.currentState.validate()) {
                    Navigator.of(context).pushNamed('exam');
                  }
                  setState(() {
                    _nameController.text = "";
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
