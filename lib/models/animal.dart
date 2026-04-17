enum AnimalType { dog, cat, other }

class Animal {
  const Animal({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.location,
    required this.healthStatus,
    required this.story,
    required this.images,
    required this.type,
    this.shelterId,
    this.guardianName,
    this.monthlyFee,
    this.guardianshipStatus,
  });

  final String id;
  final String name;
  final String breed;
  final String age;
  final String gender;
  final String location;
  final String healthStatus;
  final String story;
  final List<String> images;
  final AnimalType type;
  final String? shelterId;
  final String? guardianName;
  final double? monthlyFee;
  final String? guardianshipStatus;
}
