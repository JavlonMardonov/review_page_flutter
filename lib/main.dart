// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dars_10/database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Reviews> database = data();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dars 10',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFFECF0F4))),
          ),
          title: const Text(
            "Reviews",
            style: TextStyle(fontSize: 17),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              for (var data in database) ...[
                Review(
                    reviewer: Image.network(
                      data.image!,
                      width: 43,
                      height: 43,
                    ),
                    time: data.dateTime!,
                    title: data.title!,
                    stars: data.stars!,
                    comment: data.comment!),
                const SizedBox(
                  height: 20,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Review extends StatelessWidget {
  Image reviewer;
  DateTime time;
  String title;
  int stars;
  String comment;

  Review({
    super.key,
    required this.reviewer,
    required this.time,
    required this.title,
    required this.stars,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: reviewer,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
            width: MediaQuery.of(context).size.width - 105,
            decoration: ShapeDecoration(
              color: const Color(0xFFF6F8FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${time.day}/${time.month}/${time.year}",
                  style: const TextStyle(
                    color: Color(0xFF9B9BA5),
                    fontSize: 12,
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF32343E),
                    fontSize: 14,
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(children: [
                  for (int i = 0; i < 5; i++) ...[
                    Icon(
                      i < stars ? Icons.star : Icons.star_outline,
                      color: const Color(0xFFFB6D3A),
                      size: 13,
                    ),
                  ],
                ]),
                const SizedBox(height: 15),
                Text(
                  comment,
                  style: const TextStyle(
                    color: Color(0xFF737782),
                    fontSize: 12,
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 22),
              ],
            ))
      ],
    );
  }
}
