import 'dart:ui';

abstract class MyColors {
  static const Color bottomNavigationBar = Color.fromARGB(255, 250, 250, 250);
  static const Color textfieldFillColor = Color(0xffEAEAEB);
  static const Color selectedTextFieldColor = Color.fromARGB(255, 0, 0, 0);
  static const Color textPrimaryColor = Color.fromRGBO(38, 38, 38, 1);
  static const Color primaryColorUi = Color.fromRGBO(255, 255, 255, 1);
  static const Color secondaryColorUi = Color.fromRGBO(250, 250, 250, 1);

  //* Posts Widget Colors
  static const Color postsCounter = Color.fromRGBO(18, 18, 18, .7);
  static const Color postsCounterText = Color.fromRGBO(249, 249, 249, 1);
  static const Color disablePostPointer = Color.fromRGBO(0, 0, 0, 0.15);
  static const Color selectedPostPointer = Color.fromRGBO(56, 151, 240, 1);

  // ******** addImage screen colors ********
  static const Color nextTextButtonColor = Color.fromRGBO(56, 151, 240, 1);
  static const Color customAppBarBackgroundColor =
      Color.fromRGBO(250, 250, 250, 1);
  static const Color customTabBarBackgroundColor =
      Color.fromRGBO(250, 250, 250, 1);
  static const Color dividerColor = Color.fromRGBO(60, 60, 67, 0.138);

  // User Profile Screen = UPS
  static const Color clickableTextColorUPS = Color.fromRGBO(5, 56, 107, 1);
  static const Color borderStoryUPS = Color.fromRGBO(199, 199, 204, 1);
  static const Color indicatorColorUPS = Color.fromRGBO(38, 38, 38, 1);
  static const Color borderBottomEditProfileColorUPS = Color.fromRGBO(255, 191, 191, 193);
}