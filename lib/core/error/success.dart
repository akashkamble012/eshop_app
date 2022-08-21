import 'package:equatable/equatable.dart';

import '../../common/common_message.dart';



abstract class Success extends Equatable {
  final String message;
  final String status;

  const Success(this.message, [this.status = '']);
  @override
  List<Object> get props => [message, status];
}

class SuccessMessage extends Success {
  const SuccessMessage(String message,
      [String status = CommonMessage.defaultStatusSuccessMessage])
      : super(message, status);
}
