import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/constants/routes_path.dart';
import 'package:test_app/modules/widgets/display_name.dart';
import 'package:test_app/utils/services/api/api_providers.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ProfileInfoState createState() => ProfileInfoState();
}

class ProfileInfoState extends ConsumerState<UsersPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(userNotifierProvider.notifier).getUsers();
    });
    super.initState();
  }

  onButtonPressed(user) {
    Navigator.pushNamed(context, profileInfoScreen, arguments: user);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userNotifierProvider);
    return Scaffold(
      body: state.isLoading!
          ? const Center(child: Text("Loading..."))
          : state.isError!
              ? Center(child: Text(state.errorMessage.toString()))
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var user in state.response.users)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                onButtonPressed(user);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.5),
                                          width: 2.0),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      maxRadius: 28,
                                      child: ClipOval(
                                        child: Image.network(
                                          user.avatar,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DisplayName(
                                        firstName: user.firstName,
                                        secondName: user.lastName,
                                        prefix: '',
                                        suffix: '',
                                      ),
                                      Text(
                                        user.email,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.withOpacity(.8),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )

                        // DisplayName(
                        //     firstName: user.toString(),
                        //     secondName: "secondName",
                        //     prefix: "prefix",
                        //     suffix: "suffix")
                      ],
                    ),
                  ),
                ),
    );
  }
}
