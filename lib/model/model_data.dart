// "https://media.timeout.com/images/101527289/image.jpg"
import 'package:flutter/material.dart';
import 'package:note/component/moves_widgets/moves_widgets.dart';
import 'package:equatable/equatable.dart';

class images{
 const images({this.image});
 final String? image;
 

}

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

List<images>moves=const[
  images(image: "https://media.timeout.com/images/101527289/image.jpg"),
  images(image: "https://media.timeout.com/images/101527289/image.jpg"),
  images(image: "https://media.timeout.com/images/101527289/image.jpg"),
  images(image: "https://media.timeout.com/images/101527289/image.jpg"),
  images(image: "https://media.timeout.com/images/101527289/image.jpg"),

];

List<images>upcoming=const[
  images(image: "https://media.timeout.com/images/101527289/image.jpg"),
  images(image: "https://media0001.elcinema.com/uploads/_320x_aa9eb3e1515046b74a0070cd434424807848742da77e6ce454b8ecde9cc28802.jpg"),
  images(image: "https://media0001.elcinema.com/uploads/_320x_aa9eb3e1515046b74a0070cd434424807848742da77e6ce454b8ecde9cc28802.jpg"),
  images(image: "https://media0001.elcinema.com/uploads/_320x_aa9eb3e1515046b74a0070cd434424807848742da77e6ce454b8ecde9cc28802.jpg"),
  images(image: "https://media0001.elcinema.com/uploads/_320x_aa9eb3e1515046b74a0070cd434424807848742da77e6ce454b8ecde9cc28802.jpg"),

 

];
