import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/user_notifier.dart';
import 'package:test_app/utils/services/api/api_response_state.dart';

import 'api_repository.dart';

final homeApiRepositoryProvider = Provider<ApiRepository>(
  (ref) => ApiRepository(),
);

final userNotifierProvider = StateNotifierProvider<UserNotifier, ResponseState>(
    (ref) => UserNotifier(ref.watch(homeApiRepositoryProvider)));
