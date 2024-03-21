// ignore_for_file: public_member_api_docs, sort_constructors_first

class Doctors {
  String name;
  String description;
  String ratings;
  String imagePath;

  Doctors(
      {required this.name,
      required this.description,
      required this.ratings,
      required this.imagePath});
  String get _name => name;
  String get _description => description;
  String get _imagePath => imagePath;
  String get _ratings => ratings;
}
