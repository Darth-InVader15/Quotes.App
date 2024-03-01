import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function(Quote) delete;

  const QuoteCard({
    required this.quote,
    required this.delete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15.0),
      color: Colors.grey[900], // Background color of the card
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              quote.quote,
              style: const TextStyle(
                color: Colors.amberAccent,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              "- ${quote.author}",
              style: const TextStyle(
                color: Colors.amberAccent,
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 6.0),
            TextButton.icon(
              onPressed: () => delete(quote), // Invoke delete function on tap
              icon: const Icon(Icons.delete),
              label: const Text("Don't wanna see this"),
            )
          ],
        ),
      ),
    );
  }
}
