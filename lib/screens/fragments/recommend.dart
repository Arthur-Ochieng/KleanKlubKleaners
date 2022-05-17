import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({Key? key}) : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ratings and Recommendations"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rating: $rating",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            buildRating(),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => showRating(),
              child: const Text(
                "Show Dialog",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRating() =>
    RatingBar.builder(
      initialRating: rating,
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      updateOnDrag: true,
      onRatingUpdate: (rating) => setState(() {
        this.rating = rating;
      }),
      minRating: 1,
      itemSize: 35,
      // itemPadding: const EdgeInsets.symmetric(horizontal: 4),
  );

  void showRating() {
    showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          title: const Text("Rate the cleaning experience"),
          content: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Please leave a star rating",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              buildRating(),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK',
                  style: TextStyle(
                    fontSize: 20,
                  ),
              ),
            ),
          ],
        ), 
    );
  }
}
