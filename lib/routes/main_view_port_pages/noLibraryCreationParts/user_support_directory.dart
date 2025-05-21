import 'package:codex/models/library_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSupportDirectory extends StatelessWidget {
  const UserSupportDirectory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Use support directory (Recommended)'),
            Text(
              'This will utilize your devices support directory, hidden away from most disturbances making it less likeyl to be altered unexpectedly',
            ),
            Text(
              'Pressing create will create a folder inside the support directory which will be used for hte library, you can always change this in the settings',
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context.read<LibraryModel>().useSupportDirectory();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Create',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
