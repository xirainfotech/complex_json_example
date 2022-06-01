import 'package:complex_json_example/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<EventProvider>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: '  Type Date',
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<EventProvider>(context, listen: false)
                    .getEvents(date: _controller.text);
              },
              child: const Text('Search'),
            ),
            Consumer<EventProvider>(
              builder: ((context, provider, child) {
                if (provider.eventsList.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: provider.eventsList
                        .where((element) => element.status != '')
                        .length,
                    itemBuilder: ((context, index) {
                      final String status = provider.eventsList
                          .where((element) => element.status != '')
                          .elementAt(index)
                          .status;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: status.statusColor,
                        ),
                        title: Text(
                          status,
                        ),
                      );
                    }),
                  );
                }
                return const Center();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
