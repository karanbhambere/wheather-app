import 'package:flutter/material.dart';

class Citywheatherpage extends StatelessWidget {
  const Citywheatherpage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'City Wheather',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SearchBar(
            controller: controller,
            hintText: 'City name',
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.of(context).pop(controller.text);
                }
              },
              child: const Text('Get Weather'),
            ),
          ),
        ],
      ),
    );
  }
}
