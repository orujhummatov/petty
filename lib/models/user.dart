class AppUser {
  const AppUser({
    required this.name,
    required this.avatar,
    required this.memberSince,
    required this.totalDonated,
    required this.animalsHelped,
    required this.xp,
    required this.level,
    required this.subscription,
  });

  final String name;
  final String avatar;
  final DateTime memberSince;
  final double totalDonated;
  final int animalsHelped;
  final int xp;
  final int level;
  final double subscription;
}
