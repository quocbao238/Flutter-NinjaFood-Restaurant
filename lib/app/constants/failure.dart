part of contains;

class Failure {
  final String message;
  final StackTrace stackTrace;
  const Failure(this.message, this.stackTrace);
}

handleFailure(String _logName,Failure failure, {bool showDialog = false}) {
  console.showError(_logName, failure.message);
  if (showDialog) {
    Get.defaultDialog(
      title: 'Error',
      middleText: failure.message,
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
    );
  }
}