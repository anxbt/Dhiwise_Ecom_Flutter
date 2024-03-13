// // user_state.dart
// class UserState {
//   final bool isLoggedIn;
//
//   UserState({required this.isLoggedIn});
// }
//
// class UserProvider extends ChangeNotifier {
//   UserState _userState = UserState(isLoggedIn: false);
//
//   UserState get userState => _userState;
//
//   void setUserLoggedIn(bool loggedIn) {
//     _userState = UserState(isLoggedIn: loggedIn);
//     notifyListeners(); // Notify listeners of the state change
//   }
// }