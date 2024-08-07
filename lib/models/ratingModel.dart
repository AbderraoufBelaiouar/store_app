class Ratingmodel {
  final double rate;
  final int count;
  Ratingmodel({required this.rate, required this.count});
  factory Ratingmodel.fromJson(jsonData) {
    return Ratingmodel(
        rate: jsonData['rate'] is int
            ? (jsonData['rate'] as int).toDouble()
            : jsonData['rate'],
        count: jsonData['count']);
  }
}
