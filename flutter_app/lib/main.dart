import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'General Web App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'Dashboard',
    'Reports',
    'Users',
    'Settings',
    'Analytics',
    'Messages',
  ];

  String selected = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Web'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: items.indexOf(selected),
            onDestinationSelected: (index) {
              setState(() {
                selected = items[index];
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: items
                .map(
                  (item) => NavigationRailDestination(
                    icon: const Icon(Icons.apps_outlined),
                    selectedIcon: const Icon(Icons.apps),
                    label: Text(item),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selected,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'This is a general web application layout built with Flutter. It is responsive and suitable for dashboard-style screens.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _statCard('Total Users', '12.4K', Colors.blue),
                      _statCard('Revenue', '\$84.2K', Colors.green),
                      _statCard('Orders', '1,248', Colors.orange),
                      _statCard('Performance', '94%', Colors.purple),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Recent Activity',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 18),
                        ListTile(
                          leading: Icon(Icons.check_circle, color: Colors.green),
                          title: Text('New order received from client A'),
                          subtitle: Text('2 hours ago'),
                        ),
                        ListTile(
                          leading: Icon(Icons.notifications, color: Colors.orange),
                          title: Text('Weekly report is ready to review'),
                          subtitle: Text('4 hours ago'),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, color: Colors.blue),
                          title: Text('User profile updated successfully'),
                          subtitle: Text('Today'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value, Color color) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: color),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
