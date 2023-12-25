import 'package:flutter/material.dart';
import '../../model/etudiant.dart';
import '../../presentation/student/display.dart';

class EdutiantTile extends StatelessWidget {
  final Etudiant etudiant;

  const EdutiantTile({Key? key, required this.etudiant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StudentDetailPage(studentId: etudiant.id)),
        );
      },
      child: ListTile(
        leading: const Icon(Icons.school),
        title: Text("${etudiant.nom} ${etudiant.prenom}"),
      ),
    );
  }
}
