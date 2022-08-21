import 'package:equatable/equatable.dart';

import '../../common/common_message.dart';

abstract class Failure extends Equatable {
  final String message;
  final String status;

  const Failure(this.message, [this.status = '']);
  @override
  List<Object> get props => [message, status];
}

class FailureMessage extends Failure {
  const FailureMessage(String message,
      [String status = CommonMessage.defaultStatusFailureMessage])
      : super(message, status);
}
