abstract class UiEvent {}

class ShowSuccess extends UiEvent {
  final String message;

  ShowSuccess(this.message);
}

class ShowError extends UiEvent {
  final String message;

  ShowError(this.message);
}

class ShowLoading extends UiEvent {
  final String message;

  ShowLoading(this.message);
}