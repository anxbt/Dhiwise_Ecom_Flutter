class LoginState {
  bool isLoggedIn = false;

  void setIsLoggedIn(bool value) {
    isLoggedIn = value;
    notifyListeners(); // Notify listeners when state changes
  }
}