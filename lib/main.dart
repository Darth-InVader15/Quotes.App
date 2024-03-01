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
        children: quotes.map((quote){
          return Text(
            "${quote.quote} -- ${quote.author} \n",
            style: const TextStyle(
              color: Colors.amberAccent,
            ),
          );
        }).toList(),
      )

    );
  }
}

