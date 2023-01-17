// "https://media.timeout.com/images/101527289/image.jpg"
import 'package:flutter/material.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart';
import 'package:equatable/equatable.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServerException({
    required this.errorMessageModel,
  });
}



class ErrorMessageModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;
  const ErrorMessageModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
  @override
  List<Object?> get props => [
        success,
        statusCode,
        statusMessage,
      ];
}
