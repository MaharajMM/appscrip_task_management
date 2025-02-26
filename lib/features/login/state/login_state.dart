sealed class LoginState {
  const LoginState();
}

class InitialLoginState implements LoginState {
  const InitialLoginState();
}

class VerifyingLoginState implements LoginState {
  const VerifyingLoginState();
}

class VerifiedState implements LoginState {
  const VerifiedState();
}

class NotVerifiedState implements LoginState {
  const NotVerifiedState();
}

class LoginErrorState implements LoginState {
  final String message;

  const LoginErrorState(this.message);

  @override
  bool operator ==(covariant LoginErrorState other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
