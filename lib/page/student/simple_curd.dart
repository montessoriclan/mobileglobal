import 'package:deernier/helper/firebase_helper.dart';
import 'package:deernier/model/student_model.dart';
import 'package:deernier/page/student/add_student.dart';
import 'package:deernier/util/app_constant.dart';
import 'package:deernier/widget/k_text.dart';
import 'package:flutter/material.dart';

class SimpleCrud extends StatefulWidget {
  const SimpleCrud({Key? key}) : super(key: key);

  @override
  State<SimpleCrud> createState() => _SimpleCrudState();
}

class _SimpleCrudState extends State<SimpleCrud> {
  TextEditingController contLastname = TextEditingController();
  TextEditingController contFirstname = TextEditingController();
  TextEditingController contLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
        elevation: 0,
      ),
      body: StreamBuilder<List<StudentModel>>(
        stream: FirebaseHelper.read(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("something happened snapshot.error"),
            );
          } else if (snapshot.hasData) {
            final user = snapshot.data;
            final total = snapshot.data?.length;
            return total == 0
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: KText(
                              text: "No student enrolled  enroll some one",
                              size: AppConstant.leadingText,
                              weight: FontWeight.bold)),
                    ),
                  )
                : ListView(
                    children: user!
                        .map(
                          (e) => ListTile(
                            onTap: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0)),
                                ),
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                        padding: const EdgeInsets.all(16),
                                        child: Wrap(
                                          spacing: 12,
                                          children: <Widget>[
                                            const Center(
                                                child: Text("student details")),
                                            TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: e.firstname)),
                                            TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: e.lastname)),
                                            TextField(
                                                controller:
                                                    TextEditingController(
                                                        text: e.location)),
                                            ElevatedButton(
                                                onPressed: () {
                                                  FirebaseHelper.update(
                                                      StudentModel(
                                                          firstname:
                                                              contFirstname
                                                                  .text,
                                                          lastname:
                                                              contLastname.text,
                                                          id: e.id,
                                                          location: contLocation
                                                              .text));
                                                },
                                                child: const Text("update"))
                                          ],
                                        )),
                                  );
                                },
                              );
                            },
                            onLongPress: () {
                              FirebaseHelper.delete(StudentModel(id: e.id));
                            },
                            title: Text(e.lastname.toString()),
                            subtitle: Text(e.firstname.toString()),
                          ),
                        )
                        .toList(),
                  );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddStudent(),
                ));
          },
          label: const Text("add a student")),
    );
  }
}
