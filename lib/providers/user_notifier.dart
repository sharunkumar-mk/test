import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/utils/services/api/api_repository.dart';
import 'package:test_app/utils/services/api/api_response_state.dart';

class UserNotifier extends StateNotifier<ResponseState> {
  UserNotifier(this.apiRepository)
      : super(ResponseState(isLoading: true, isError: false));
  final ApiRepository apiRepository;

  Future<void> getUsers({bool init = true}) async {
    try {
      if (init) {
        state = state.copyWith(isLoading: true, isError: false);

        final result = await apiRepository.fetchUsers();
        state =
            state.copyWith(isLoading: false, isError: false, response: result);
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }
}
