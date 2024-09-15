import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:speeder_website/Utills/utils.dart';

class EmailList extends StatefulWidget {
  const EmailList({super.key});

  @override
  State<StatefulWidget> createState() {
    return EmailListState();
  }
}

class EmailListState extends State<EmailList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('email_list').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20, // Spacing between columns
              columns: [
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: hexToColor("#002366"),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Created Date',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: hexToColor("#002366"),
                    ),
                  ),
                ),
              ],
              rows: documents.map((doc) {
                return DataRow(cells: [
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['email'] ?? '',
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['created_date'] != null
                            ? doc['created_date'].toDate().toString()
                            : '',
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
