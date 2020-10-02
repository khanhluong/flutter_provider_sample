import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/app_state.dart';
import 'package:provider/provider.dart';

class ReponseDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: appState.isFetching
          ? CircularProgressIndicator()
          : appState.getResponseJson() != null
              ? ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          appState.getResponseJson()[index]['avatar']),
                    ),
                  );
                })
              : Text("Press Button above to fetch data"),
    );
  }
}
