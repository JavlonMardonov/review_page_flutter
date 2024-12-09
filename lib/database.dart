import 'dart:convert';

const String reviewsData = """[
    {
      "Image": "https://randomuser.me/api/portraits/men/1.jpg",
      "DateTime": "2024-12-01T12:30:00",
      "title": "Great Product",
      "stars": 4,
      "comment": "I absolutely love this product! It works just as expected and is very reliable."
    },
    {
      "Image": "https://randomuser.me/api/portraits/women/2.jpg",
      "DateTime": "2024-12-02T14:20:00",
      "title": "Good Quality",
      "stars": 4,
      "comment": "The quality is good, but I expected more features for the price."
    },
    {
      "Image": "https://randomuser.me/api/portraits/men/3.jpg",
      "DateTime": "2024-12-03T09:15:00",
      "title": "Not satisfied",
      "stars": 2,
      "comment": "The product didn't meet my expectations, and the support team was not helpful."
    },
    {
      "Image": "https://randomuser.me/api/portraits/men/4.jpg",
      "DateTime": "2024-12-04T18:50:00",
      "title": "Excellent Experience",
      "stars": 5,
      "comment": "Everything was perfect. Delivery was fast, and the product quality is top-notch."
    },
    {
      "Image": "https://randomuser.me/api/portraits/women/5.jpg",
      "DateTime": "2024-12-05T16:00:00",
      "title": "Pretty good",
      "stars": 3,
      "comment": "The product is decent for the price, but there's room for improvement."
    },
    {
      "Image": "https://randomuser.me/api/portraits/men/6.jpg",
      "DateTime": "2024-12-06T11:45:00",
      "title": "Just as described",
      "stars": 4,
      "comment": "Exactly as described in the description. I’m happy with the purchase."
    },
    {
      "Image": "https://randomuser.me/api/portraits/men/7.jpg",
      "DateTime": "2024-12-07T10:30:00",
      "title": "Good value",
      "stars": 4,
      "comment": "Great value for money, though it could be improved in some areas."
    },
    {
      "Image": "https://randomuser.me/api/portraits/women/8.jpg",
      "DateTime": "2024-12-08T13:00:00",
      "title": "Terrible quality",
      "stars": 1,
      "comment": "The product broke within a week of use. I’m very disappointed."
    },
    {
      "Image": "https://randomuser.me/api/portraits/men/9.jpg",
      "DateTime": "2024-12-09T17:10:00",
      "title": "Amazing product",
      "stars": 5,
      "comment": "It’s amazing! Exceeded my expectations in every way."
    },
    {
      "Image": "https://randomuser.me/api/portraits/women/10.jpg",
      "DateTime": "2024-12-10T20:30:00",
      "title": "Could be better",
      "stars": 3,
      "comment": "It’s okay, but I expected better performance for the price."
    }
  ]
  """;

class Reviews {
  String? image;
  DateTime? dateTime;
  String? title;
  int? stars;
  String? comment;

  Reviews({this.image, this.dateTime, this.title, this.stars, this.comment});

  Reviews.fromJson(Map<String, dynamic> json) {
    image = json['Image'];
    dateTime = DateTime.parse(json['DateTime']);
    title = json['title'];
    stars = json['stars'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Image': image,
      'DateTime': dateTime,
      'title': title,
      'stars': stars,
      'comment': comment,
    };
  }
}

List<Reviews> data() {
  List<dynamic> decodedData = jsonDecode(reviewsData);
  List<Reviews> reviewsList =
      decodedData.map((reviewJson) => Reviews.fromJson(reviewJson)).toList();
  return reviewsList;
}
