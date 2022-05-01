import 'package:drift/drift.dart' as drift;
import 'package:ai_friend/data/DAOs/member_dao/member_dao.dart';
import 'package:ai_friend/data/drift_database.dart';
import 'package:ai_friend/services/google_sign_in_service.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class SignupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _googleSignInService = locator<GoogleSignInService>();
  final _database = locator<MyDatabase>();

  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  Future init(
      void Function(FormViewModel model) listenToFormUpdated,
      TextEditingController emailController,
      TextEditingController nameController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController) async {
    _emailController = emailController;
    _nameController = nameController;
    _passwordController = passwordController;
    _confirmPasswordController = confirmPasswordController;
  }

  void doSomething() {
    _navigationService.navigateTo(Routes.loginView);
  }

  Future<void> doGoogleSignup() async {
    MembersCompanion membersCompanion =
        await _googleSignInService.signInWithGoogle();
    if (membersCompanion != null) {
      List<Member> members =
          await MembersDao(_database).searchMember(membersCompanion);
      if (members == []) {
        await MembersDao(_database).insertMember(membersCompanion);
      }
      navigateToDashboard();
    }
  }

  void navigateToDashboard() {
    _navigationService.navigateTo(Routes.dashboardView);
  }
  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  onChangedEmail() {
    validateEmail();
    notifyListeners();
  }

  onChangedName() {
    validateName();
    notifyListeners();
  }

  onChangedPassword() {
    validatePassword();
    notifyListeners();
  }

  onChangedConfirmPassword() {
    validateConfirmPassword();
    notifyListeners();
  }

  validateEmail() {
    if (_emailController.text == '')
      return 'Required';
    else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text);
      if (!emailValid) {
        return 'Enter Valid Email';
      }
      return null;
    }
  }

  validateName() {
    if (_nameController.text == '')
      return 'Required';
    else
      return null;
  }

  validatePassword() {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (_passwordController.text.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(_passwordController.text)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  validateConfirmPassword() {
    if (_passwordController.text.isEmpty)
      return 'Required';
    else {
      if (_passwordController.text != _confirmPasswordController.text) {
        return 'Confirm Password not Matching!';
      } else {
        return null;
      }
    }
  }

  onTapSignUpButton() async {

    if (validateEmail() == null &&
        validateName() == null &&
        validatePassword() == null &&
        validateConfirmPassword() == null) {
      MembersCompanion membersCompanion = MembersCompanion(
        name: drift.Value(_nameController.text.trim()),
        emailAddress: drift.Value(_emailController.text.trim()),
        password: drift.Value(_passwordController.text),
      );
      List<Member> members =
          await MembersDao(_database).searchMember(membersCompanion);
      if (members.isEmpty) {
        await MembersDao(_database).insertMember(membersCompanion);
      }else{
        navigateToLogin();
      }
      navigateToDashboard();
    }
  }


}
