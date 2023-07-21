import 'package:flutter/material.dart';
import 'package:realview_book_app/features/authors/presentation/screens/author_search_screen.dart';

void main() {
  runApp(const RealViewBookApp());
}

class RealViewBookApp extends StatelessWidget {
  const RealViewBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Map<String, bool> features = {
    'Author Finder': true,
    'Covers': false,
    'Search': false,
    'Subject': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RealView Books'),
        // backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: features.length,
          itemBuilder: (context, index) {
            final feature = features.entries.elementAt(index);
            return SizedBox(
              height: 120,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getFeature(
                        feature.key,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          feature.key,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 16,
            );
          },
        ),
      ),
    );
  }

  Widget getFeature(String featureName) {
    switch (featureName) {
      case 'Author Finder':
        return const AuthorSearchScreen();
      default:
        return const FeatureNotAvailable(featureName: 'Feature not available');
    }
  }
}

class FeatureNotAvailable extends StatelessWidget {
  const FeatureNotAvailable({required this.featureName, super.key});

  final String featureName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(featureName),
        // backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'Feature not available',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
