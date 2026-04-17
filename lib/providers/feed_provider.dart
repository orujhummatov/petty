import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';

final storiesProvider = Provider((_) => MockData.stories);
final postsProvider = Provider((_) => MockData.posts);
