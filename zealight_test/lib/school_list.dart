import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zealight_test/provider.dart';

class SchoolListScreen extends StatelessWidget {
  const SchoolListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SchoolsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Schools in the United States'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            child: SizedBox(
              child: TextField(
                onChanged: (query) {
                  provider.updateSearchQuery(query);
                },
                decoration: InputDecoration(
                  hintText: 'Search for a school',
                  hintStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  contentPadding: const EdgeInsets.all(10.0),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : provider.filteredSchools.isEmpty
                      ? const Center(child: Text('No Schools Found'))
                      : ListView.builder(
                          itemCount: provider.filteredSchools.length,
                          itemBuilder: (context, index) {
                            final school = provider.filteredSchools[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.all(10.0),
                              tileColor: index % 2 == 0 ? Colors.white : Colors.grey[200],
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                school.name ?? 'N/A',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                school.webPages != null && school.webPages!.isNotEmpty
                                    ? school.webPages![0]
                                    : 'No website available',
                                style: const TextStyle(fontSize: 14),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
