import 'package:flutter/material.dart';

class RouteErrorPage extends StatelessWidget {
  const RouteErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        child: Center(
            child: SelectableText(
          'Error Page',
        )),
      ),
    );
  }
}
