import 'package:deernier/service/local_notification_service.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  late final LocalNotificationService _notiService;

  @override
  void initState() {
    _notiService = LocalNotificationService();
    _notiService.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Accueil"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _notiService.showNotification(
                    id: 0, title: "le titre", body: "la description"),
                child: const Text("Direct notification"),
              ),
              ElevatedButton(
                onPressed: () => _notiService.showScheduledNotification(
                    id: 0,
                    title: "le titre",
                    body: "la description",
                    second: 30),
                child: const Text("scheduled"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
