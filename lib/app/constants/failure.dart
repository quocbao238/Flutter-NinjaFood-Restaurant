part of contains;

class Failure {
  final String message;
  final StackTrace stackTrace;

  const Failure.custom(this.message) : stackTrace = StackTrace.empty;

  const Failure(this.message, this.stackTrace);
}

handleFailure(String _logName, Failure failure,
    {bool showDialog = false}) async {
  final consoleService = ConsoleService.instance;
  consoleService.showError(_logName, failure.message);
  if (showDialog) {
    final dialogController = Get.find<DialogController>();
    dialogController.showError(message: failure.message);
  }
}
