import 'package:flutter/material.dart';
import 'package:flutter_application_9/db/dbfun/dbfun.dart';
import 'package:flutter_application_9/db/dbmodel/dbmodel.dart';
import 'package:flutter_application_9/homepage.dart';
import 'package:flutter_application_9/imageandname.dart';
import 'package:hive/hive.dart';

class ListOfAdded extends StatefulWidget {
  const ListOfAdded({Key? key}) : super(key: key);

  @override
  State<ListOfAdded> createState() => _ListOfAddedState();
}

class _ListOfAddedState extends State<ListOfAdded> {
  void getstudent() async {
    final Box = await Hive.openBox<Student>('studentcolection');
    setState(() {
      studentdata = Box.values.toList();
    });
  }

  @override
  void initState() {
    getstudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Student List'),
          backgroundColor: Colors.purple.shade800,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final data1 = studentdata[index];
                  final image1 = images[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImageAndname(true, data1, index, image1)));
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddingScrean(true, data1, index)));
                            },
                            icon: Icon(Icons.edit),
                            color: Color.fromARGB(255, 2, 37, 66)),
                        IconButton(
                            onPressed: () async {
                              Dialogbox1(index);
                            },
                            icon: Icon(Icons.delete),
                            color: Color.fromARGB(255, 2, 37, 66)),
                      ],
                    ),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(images[index])),
                    title: Text(data1.name),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 10,
                    color: Colors.white,
                  );
                },
                itemCount: studentdata.length),
          ),
        ));
  }

  Future<void> Dialogbox1(index) async {
    showDialog(
        context: context,
        builder: (ctx1) {
          return AlertDialog(
            title: Text('DELETE'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: Text('close')),
              TextButton(
                  onPressed: () async {
                    final box = await Hive.box<Student>('studentcolection');

                    if (index >= 0) {
                      await box.deleteAt(index);
                    }
                    setState(() {
                      studentdata.removeAt(index);
                    });

                    Navigator.of(ctx1).pop();
                  },
                  child: Text('delete'))
            ],
          );
        });
  }
}
