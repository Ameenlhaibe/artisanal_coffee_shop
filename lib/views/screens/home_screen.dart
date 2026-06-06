import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../main.dart';
import '../widgets/custom_drawer.dart';
import 'list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = globalController.categories;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bean & Roast Co.', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            icon: Icon(globalController.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              (context.findAncestorStateOfType<MainAppState>())?.updateTheme();
            },
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.brown.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Freshly Roasted', style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.brown)),
                  const SizedBox(height: 8),
                  const Text('Explore premium single-origin beans selected and ethically sourced globally.', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Browse Catalog Categories', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Text(cat.icon, style: const TextStyle(fontSize: 24)),
                    title: Text(cat.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ListScreen(categoryId: cat.id, categoryName: cat.name)),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}