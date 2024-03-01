import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'quote.dart';
import 'dart:async'; // Import for Timer class
import 'quote_cart.dart';
// import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [];

  Future<void> fetchQuotes() async {
    const url = "https://api.quotable.io/random";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        quotes = [Quote(quote: data['content'], author: data['author'])];
      });
    } else {
      // Handle error
      print("Failed to fetch quotes: ${response.statusCode}");
    }
  }

  void deleteQuote(Quote quote) {
    setState(() {
      quotes.remove(quote);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchQuotes();
    // Schedule periodic fetching of quotes
    Timer.periodic(const Duration(seconds: 3), (_) => fetchQuotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "Quotes",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold
              )),
               Text(
                " For You",
                style: TextStyle(color: Colors.cyan,)
                    // fontVariations: FontVariation.italic(0.2));

            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: deleteQuote,
        )).toList(),
      ),
      bottomNavigationBar: Container(
        height: 40.0, // Adjust the height as needed
        // color: Colors.,
        child: Center(
          child: Text(
            "New Quotes every 3 seconds",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
