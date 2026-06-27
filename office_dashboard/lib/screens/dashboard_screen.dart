import 'package:flutter/material.dart';
import '../constants.dart';
import '../responsive/responsive_layout.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';
import '../widgets/stat_card.dart';
import '../widgets/recent_activity.dart';
import '../widgets/performance_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 2, // takes 2/12 = 1/6 of screen
                child: Sidebar(),
              ),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const TopBar(),
                    const SizedBox(height: defaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              const StatCardsRow(),
                              const SizedBox(height: defaultPadding),
                              const PerformanceChart(),
                              if (Responsive.isMobile(context))
                                const SizedBox(height: defaultPadding),
                              if (Responsive.isMobile(context))
                                const RecentActivity(),
                            ],
                          ),
                        ),
                        if (!Responsive.isMobile(context))
                          const SizedBox(width: defaultPadding),
                        if (!Responsive.isMobile(context))
                          const Expanded(
                            flex: 2,
                            child: RecentActivity(),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCardsRow extends StatelessWidget {
  const StatCardsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Responsive(
      mobile: FileInfoCardGridView(
        crossAxisCount: _size.width < 650 ? 2 : 4,
        childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
      ),
      tablet: const FileInfoCardGridView(),
      desktop: FileInfoCardGridView(
        childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
      ),
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => StatCard(
        title: ["Total Employees", "Active Projects", "Revenue", "Attendance"][index],
        value: ["1,245", "45", "\$124,500", "98%"][index],
        icon: [Icons.people, Icons.work, Icons.attach_money, Icons.check_circle][index],
        color: [Colors.blue, Colors.orange, Colors.green, Colors.purple][index],
      ),
    );
  }
}
