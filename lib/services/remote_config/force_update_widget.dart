import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

class ForceUpdateWidget extends StatelessWidget {
  const ForceUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withAlpha(100),
        child: AlertDialog(
          content: const Text(
            "There's an update available!",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () => StoreRedirect.redirect(
                androidAppId: 'packageName',
                iOSAppId: 'appStoreId',
              ),
              child: const Text("OK"),
            ),
          ],
        ));
  }
}
