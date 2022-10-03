import 'package:flutter/material.dart';
import 'package:flutter_application_9/bottomnav.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:flutter_application_9/listofadded.dart';
import 'package:hive_flutter/adapters.dart';

class AddingScrean extends StatefulWidget {
  bool isedited = false;
  Student? studforedit = null;
  int position = -1;

  AddingScrean(this.isedited, this.studforedit, this.position);

  @override
  State<AddingScrean> createState() => _AddingScreanState();
}

class _AddingScreanState extends State<AddingScrean> {
  final _namecontroller = TextEditingController();

  final _agecontroller = TextEditingController();

  final _schoolcontroller = TextEditingController();

  final _subjectcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (widget.isedited) {
      _namecontroller.text = widget.studforedit!.name;
      _agecontroller.text = widget.studforedit!.age;
      _schoolcontroller.text = widget.studforedit!.school;
      _subjectcontroller.text = widget.studforedit!.subject;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,
        title: Text('Register'),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 207, 164, 215),
            border: Border.all(
              color: Color.fromARGB(255, 179, 12, 208),
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(20))),
        child: Form(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                        controller: _namecontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.purple.shade800),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        validator: (valeu) {
                          if (valeu == null || valeu.isEmpty) {
                            return 'test is empty';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _agecontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.purple.shade800),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.purple.shade400),
                          ),
                          labelText: 'Age',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty or invalid';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                        controller: _schoolcontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.purple.shade800),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'School',
                        ),
                        validator: (valeu) {
                          if (valeu == null || valeu.isEmpty) {
                            return 'test is empty';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                        controller: _subjectcontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.purple.shade800),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Subject',
                        ),
                        validator: (valeu) {
                          if (valeu == null || valeu.isEmpty) {
                            return 'test is empty';
                          } else {
                            return null;
                          }
                        }),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                        width: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 96, 57, 109),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          child: const Text('save'),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              await addingTobox();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ListOfAdded()));
                            }
                          },
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Future<void> addingTobox() async {
    final _namecontroller1 = _namecontroller.text.trim();
    final _agecontroller1 = _agecontroller.text.trim();
    final _schoolController1 = _schoolcontroller.text.trim();
    final _subjectController1 = _subjectcontroller.text.trim();
    if (_agecontroller1.isNotEmpty ||
        _agecontroller1.isNotEmpty ||
        _schoolController1.isNotEmpty ||
        _subjectController1.isNotEmpty) {
      final data = Student(
          name: _namecontroller1,
          age: _agecontroller1,
          school: _schoolController1,
          subject: _subjectController1);

      final box = await Hive.openBox<Student>('studentcolection');
      if (widget.isedited) {
        await box.putAt(widget.position, data);
      } else {
        await box.add(data);
      }
    }
  }
}
