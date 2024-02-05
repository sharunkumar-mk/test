import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/modules/widgets/display_name.dart';

class ProfileInfoPage extends ConsumerStatefulWidget {
  final User user;
  const ProfileInfoPage({super.key, required this.user});

  @override
  ProfileInfoPageState createState() => ProfileInfoPageState();
}

class ProfileInfoPageState extends ConsumerState<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.grey.withOpacity(.5), width: 2.0),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 60,
                  child: ClipOval(
                    child: Image.network(
                      widget.user.avatar!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          DisplayName(
            firstName: widget.user.firstName,
            secondName: widget.user.lastName,
            prefix: '',
            suffix: '',
          ),
        ],
      ),
    ));
  }
}
