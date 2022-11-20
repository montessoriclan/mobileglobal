import 'dart:developer';

import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailService {
  Future<void> send({
    required String body,
    required String subject,
    required List<String> recipients,
    required List<String> attachmentPaths,
    bool isHTML = false,
  }) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: recipients,
      attachmentPaths: attachmentPaths,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      log(platformResponse);
    }  catch (error) {
      log(error.toString());
      platformResponse = error.toString();
      log(error.toString());
    }
  }
}
