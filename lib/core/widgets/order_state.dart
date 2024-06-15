class OrderState {
  static String currentState = 'Preparing';

  static void updateState(String newState) {
    currentState = newState;
  }
}
