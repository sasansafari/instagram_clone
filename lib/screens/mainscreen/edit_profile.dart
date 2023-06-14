import 'package:flutter/material.dart';
import 'package:tec/widgets/edit_profile_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData useTheme = Theme.of(context);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController usernameController =
        TextEditingController(text: 'jonas');
    final TextEditingController websiteController = TextEditingController();
    final TextEditingController bioController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController =
        TextEditingController(text: '09121234567');
    final TextEditingController genderController =
        TextEditingController(text: 'Male');

    return Theme(
      data: useTheme.copyWith(
        scaffoldBackgroundColor: const Color(0XFFFFFFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFFFAFAFA),
          foregroundColor: Color(0XFF262626),
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0XFF262626),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0XFF3897F0),
            textStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 66.0,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          title: const Text('Edit Profile'),
          centerTitle: true,
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Done'),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Center(
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile-picture.png'),
                    maxRadius: 45.0,
                  ),
                ),
                const SizedBox(height: 4),
                TextButton(
                  onPressed: () {},
                  child: const Text('Change Profile Photo'),
                ),
                const Divider(),
                EditProfileField(
                  title: 'Name',
                  controller: nameController,
                ),
                const SizedBox(height: 8),
                EditProfileField(
                  title: 'Username',
                  controller: usernameController,
                ),
                const SizedBox(height: 8),
                EditProfileField(
                  title: 'Website',
                  controller: websiteController,
                ),
                const SizedBox(height: 8),
                EditProfileField(
                  title: 'Bio',
                  isBio: true,
                  controller: bioController,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      child: const Text(
                        'Switch to Professional Account',
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Private Information',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                EditProfileField(
                  title: 'Email',
                  keboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(height: 8),
                EditProfileField(
                  title: 'Phone',
                  keboardType: TextInputType.phone,
                  controller: phoneController,
                ),
                const SizedBox(height: 8),
                EditProfileField(
                  title: 'Gender',
                  controller: genderController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
