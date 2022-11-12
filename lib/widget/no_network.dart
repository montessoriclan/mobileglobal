import 'package:deernier/service/network_service.dart';
import 'package:deernier/widget/k_height.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoNetwork extends StatelessWidget {
  final Widget child;

  const NoNetwork({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var networkStatus = Provider.of<NetworkStatus>(context);

    return Scaffold(
        body: networkStatus == NetworkStatus.online
            ? child
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.wifi_off_sharp),
                      KHeight(height: 30),
                      Text("please check your connection")
                    ]),
              ));
  }
}
