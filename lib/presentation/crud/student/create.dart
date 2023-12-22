import 'package:flutter/material.dart';

class CreateStudent extends StatefulWidget {
  const CreateStudent({super.key, required this.title});
  final String title;
  @override
  State<CreateStudent> createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  String _selectedGender = 'Male';
  bool _cricketSelected = false;
  bool _footballSelected = false;
  bool _chessSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Student Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // ligne 1
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      color: Colors.grey,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      color: Colors.grey,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // ligne 2
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      color: Colors.grey,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      color: Colors.grey,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // ligne 3
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      color: Colors.grey,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'City Name',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Male'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Hobbies',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _cricketSelected,
                        onChanged: (value) {
                          setState(() {
                            _cricketSelected = value!;
                          });
                        },
                      ),
                      Text('Cricket'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _footballSelected,
                        onChanged: (value) {
                          setState(() {
                            _footballSelected = value!;
                          });
                        },
                      ),
                      Text('Football'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _chessSelected,
                        onChanged: (value) {
                          setState(() {
                            _chessSelected = value!;
                          });
                        },
                      ),
                      Text('Chess'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Center(child: Text('Register')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
