import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('contactUs').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        return SingleChildScrollView(
          scrollDirection: Axis.vertical, // Vertical scrolling for rows
          child: SingleChildScrollView(
            scrollDirection:
                Axis.horizontal, // Horizontal scrolling for columns
            child: DataTable(
              columnSpacing: 20, // Spacing between columns
              columns: [
                DataColumn(
                  label: Text(
                    'First Name',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: hexToColor("#002366")),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Last Name',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: hexToColor("#002366")),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: hexToColor("#002366")),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Contact Number',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: hexToColor("#002366")),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Alt Contact Number',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: hexToColor("#002366")),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Message',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: hexToColor("#002366")),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Created Date',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: hexToColor("#002366")),
                  ),
                ),
              ],
              rows: documents.map((doc) {
                return DataRow(cells: [
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['first_name'] ?? '',
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12, // Reduced font size
                        ),
                        overflow: TextOverflow.ellipsis, // If text is too long
                      ),
                    ),
                  ),
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['last_name'] ?? '',
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['email'] ?? '',
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.visible, // Wrap text
                        softWrap: true, // Enable wrapping
                      ),
                    ),
                  ),
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['contact_number'].toString(),
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['alt_contact_number'].toString(),
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    Flexible(
                      child: Text(
                        doc['message'] ?? '',
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
                        doc['created_date'].toDate().toString(),
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
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
