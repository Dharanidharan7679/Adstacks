import 'package:flutter/material.dart';
import '../constants.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Activity",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: defaultPadding,
                horizontalMargin: 0,
                columns: const [
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Status")),
                ],
                rows: List.generate(
                  recentActivities.length,
                  (index) => recentActivityDataRow(recentActivities[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentActivityDataRow(ActivityInfo activity) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, color: primaryColor),
            const SizedBox(width: defaultPadding),
            Text(activity.name),
          ],
        ),
      ),
      DataCell(Text(activity.date)),
      DataCell(Text(activity.status)),
    ],
  );
}

class ActivityInfo {
  final String name, date, status;
  ActivityInfo({required this.name, required this.date, required this.status});
}

List<ActivityInfo> recentActivities = [
  ActivityInfo(name: "John Doe", date: "01-03-2023", status: "Present"),
  ActivityInfo(name: "Jane Smith", date: "01-03-2023", status: "Absent"),
  ActivityInfo(name: "Mike Johnson", date: "01-03-2023", status: "Present"),
  ActivityInfo(name: "Emily Davis", date: "01-03-2023", status: "On Leave"),
];
