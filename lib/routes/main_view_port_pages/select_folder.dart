//packages

import 'package:codex/models/library_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectFolder extends StatelessWidget {

  final TextEditingController _pathInputController= TextEditingController(); 

  SelectFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(
                          color:
                              Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      child: TextField(
                        style: Theme.of(context).textTheme.bodySmall,
                        controller: _pathInputController,
                        readOnly: false,
                        decoration: InputDecoration(                            
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          hintText: 'Folder Path',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
                      if (selectedDirectory != null) {
                        _pathInputController.text = selectedDirectory;
                      };
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Theme.of(context).colorScheme.secondary)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Select path',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
             Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  context.read<LibraryModel>().useExistingFolder(path: _pathInputController.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).colorScheme.secondary)
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
    );
        //Button for creating
       
  }

} 