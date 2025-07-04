import 'package:mailer/mailer.dart';
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:todoapp2_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;


void run(List<String> args) async {
  
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );
  Future<bool> sendVerificationEmail({
    required Session session,
    required String emailAddress,
    required String verificationCode,
  }) async {
    bool isSent = false;

    // SMTP server details
    final email = session.serverpod.getPassword('gmailEmail');
    final password = session.serverpod.getPassword('gmailPassword');

    final smtpServer = gmail(email!, password!);
    final message = Message()
      ..recipients.add(emailAddress)
      ..from = Address(email, "To-Do ")
      ..subject = "Code de vérification"
      ..text =
          "Bonjour, \n Voici votre code de vérification : $verificationCode.";

    try {
      await send(message, smtpServer);
      isSent = true;
      print('Email envoyé avec succès à $emailAddress');
    } on MailerException catch (e) {
      print('Erreur lors de l\'envoi de l\'email : $e');
      for (var p in e.problems) {
        print('Problème : ${p.code}: ${p.msg}');
      }
    }

    return isSent;
  }

  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        print('email: $email');
        final isSent = await sendVerificationEmail(
            session: session,
            emailAddress: email,
            verificationCode: validationCode);
        return isSent;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        final isSent = await sendVerificationEmail(
            session: session,
            emailAddress: userInfo.email!,
            verificationCode: validationCode);
        return Future.value(isSent);
      },
    ),
  );
  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();
}
