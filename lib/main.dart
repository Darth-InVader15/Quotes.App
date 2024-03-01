import 'package:flutter/material.dart';
import 'quote.dart';
void main() {
  runApp(MaterialApp(
    home: quoteList(),
  ));
}

class quoteList extends StatefulWidget {
  const quoteList({super.key});

  @override
  State<quoteList> createState() => _quoteListState();
}

class _quoteListState extends State<quoteList> {
  List<Quote> quotes = [
    Quote(quote: "You are remembered for the rules you break, not those you follow", author: "COD"),
    Quote(quote: "Seize the day boys, make your lives extraordinary", author: "Dead Poet Society"),
    Quote(quote: "Manzil milegi bhatak ke hi sahi, Gumrah toh woh hai jo ghar se nikle hi nahi", author: "Nope"),
  ];

  Widget quoteTemp(Quote quote) {
    return QuoteCard(quote: quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Quotes for you",
          style: TextStyle(color: Colors.amberAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: quotes.map((quote) {
          return quoteTemp(quote);
        }).toList(),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {

  final Quote quote;
  QuoteCard({required this.quote});
  // const quoteCard({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
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
            SizedBox(height: 6.0),
            Text(
              "- ${quote.author}",
              style: const TextStyle(
                color: Colors.amberAccent,
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
