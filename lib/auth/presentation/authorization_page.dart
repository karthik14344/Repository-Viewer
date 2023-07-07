import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//authorizationpage is a redirectory page also called as webview Page
//to enter credentials of certain users
//this AuthorizationPage is to return Url which contain the access
// token in exchange of AuthorizationCodegrant. and to return that url.
@RoutePage()
class AuthorizationPage extends StatefulWidget {
  final Uri authorizationUrl;
  final void Function(Uri redirectUrl) onAuthorizationCodeRedirectAttempt;
  //when we call the onAuthorization0CodeRedirectAttempt it will be containing the
  // redirecturl which indeed authorizationCodeParameter

  const AuthorizationPage(
      {super.key,
      required this.authorizationUrl,
      required this.onAuthorizationCodeRedirectAttempt});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.authorizationUrl.toString(),
        ),
      ),
    );
  }
}
