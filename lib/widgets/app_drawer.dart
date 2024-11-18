import 'package:flutter/material.dart';
import 'package:qachecklist_login/services/user_data_types.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedFunction});
  final void Function(appFunctions functionIdentifier) onSelectedFunction;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: const Row(
                children: [
                  Icon(Icons.stacked_bar_chart),
                  SizedBox(
                    width: 18,
                  ),
                  Text('QA Checklist MobApp')
                ],
              )),
          ListTile(
            onTap: () {
              onSelectedFunction(appFunctions.checklistReport);
            },
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text('Check Report',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24)),
          ),
          ListTile(
            onTap: () {
              onSelectedFunction(appFunctions.reviewActionPlan);
            },
            leading: Icon(
              Icons.reviews,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text('Review ActionPlan',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24)),
          ),
          ListTile(
            onTap: () {
              onSelectedFunction(appFunctions.reviewResult);
            },
            leading: Icon(
              Icons.image,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text('Result review',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24)),
          ),
          ListTile(
              onTap: () {
                onSelectedFunction(appFunctions.reports);
              },
              leading: Icon(
                Icons.report,
                size: 26,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text('Report',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 24))),
          ListTile(
              onTap: () {
              onSelectedFunction(appFunctions.settings);},
              leading: Icon(
                Icons.settings,
                size: 26,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text('Setting',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 24))),
        ],
      ),
    );
  }
}
