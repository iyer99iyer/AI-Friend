import 'package:flutter/src/widgets/editable_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/DAOs/member_dao/member_dao.dart';
import '../../data/drift_database.dart';
import '../../services/google_sign_in_service.dart';

class LoginViewModel extends BaseViewModel{

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final _navigationService = locator<NavigationService>();
  final _googleSignInService = locator<GoogleSignInService>();
  final _database = locator<MyDatabase>();

  Future init(TextEditingController emailController, TextEditingController passwordController) async{
    _emailController = emailController;
    _passwordController = passwordController;
  }

  void doSomething(){
    _navigationService.navigateTo(Routes.signupView);
  }

  Future<void> doGoogleSignIn() async {
    MembersCompanion membersCompanion = await _googleSignInService.signInWithGoogle();
    if (membersCompanion != null){
      List<Member> members = await MembersDao(_database).searchMember(membersCompanion);
      if(members == []){
        await MembersDao(_database).insertMember(membersCompanion);
      }
      navigateToDashboard();
    }
  }

  void navigateToDashboard(){
    _navigationService.navigateTo(Routes.dashboardView);
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

  validatePassword() {
    if (_passwordController.text == '')
      return 'Required';
    else
      return null;
  }

  onChangedPassword() {
    validatePassword();
    notifyListeners();
  }

  onChangedEmail() {
    validateEmail();
    notifyListeners();
  }

  onTapLogin() async {
    if(validateEmail() == null && validatePassword() == null){
      print('in validated!');
      List<Member> members = await MembersDao(_database).getMemberByEmail(_emailController.text);
      print('members: ${members}');
      if(members.isNotEmpty){
        if(_passwordController.text == (members[0].password)){
          navigateToDashboard();
        }else{
          _passwordController.text = '';
          notifyListeners();
          //TODO: show error in password not found!
        }
      }else{
        //TODO: show error email not found!
        _emailController.text = 'email not found! Try signUp';
        notifyListeners();
      }
    }
  }

  getAllMembers() async {
    List<Member> members = await MembersDao(_database).getAllMembers();
    print(members.isEmpty);
    for(Member member in members){
      print(member.emailAddress);
    }
  }

}