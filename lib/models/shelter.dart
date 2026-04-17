class Shelter {
  const Shelter({
    required this.id,
    required this.name,
    required this.location,
    required this.animalCount,
    required this.rating,
    required this.coverPhoto,
    required this.gallery,
    required this.contact,
    required this.breakdown,
  });

  final String id;
  final String name;
  final String location;
  final int animalCount;
  final double rating;
  final String coverPhoto;
  final List<String> gallery;
  final String contact;
  final Map<String, int> breakdown;
}
