import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:speeder_website/Utills/utils.dart';

class ServiceContactList extends StatefulWidget {
  const ServiceContactList({super.key});

  @override
  State<StatefulWidget> createState() {
    return ServiceContactListState();
  }
}

class ServiceContactListState extends State<ServiceContactList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('service_contactUs')
          .snapshots(),
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
                    'First Name',
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
                    'Last Name',
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
                    'Contact Number',
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
                    'Service',
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
                    'Message',
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Text(
                        doc['first_name'] ?? '',
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Text(
                        doc['last_name'] ?? '',
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 200),
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Text(
                        doc['contact_number'].toString(),
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Text(
                        doc['service'] ?? '',
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 250),
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150),
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
