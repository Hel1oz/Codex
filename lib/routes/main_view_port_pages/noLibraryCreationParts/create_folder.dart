//packages

import 'package:codex/models/library_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateFolder extends StatelessWidget {
  final _pathInputController = TextEditingController();
  final _folderNameController = TextEditingController();

  CreateFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PathInput(pathInputController: _pathInputController),

        FolderNameInput(folderNameController: _folderNameController),
        
        CreateButton(pathInputController: _pathInputController, folderNameController: _folderNameController),
      ],
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key,
    required TextEditingController pathInputController,
    required TextEditingController folderNameController,
  }) : _pathInputController = pathInputController, _folderNameController = folderNameController;

  final TextEditingController _pathInputController;
  final TextEditingController _folderNameController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            context.read<LibraryModel>().useNewFolder(path: _pathInputController.text, folderName: _folderNameController.text);
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
    );
  }
}

class FolderNameInput extends StatelessWidget {
  const FolderNameInput({
    super.key,
    required TextEditingController folderNameController,
  }) : _folderNameController = folderNameController;

  final TextEditingController _folderNameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: TextField(
          style: Theme.of(context).textTheme.bodySmall,
          controller: _folderNameController,
          readOnly: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, right: 20),
            hintStyle: Theme.of(context).textTheme.bodySmall,
            hintText: 'Folder Name',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PathInput extends StatelessWidget {
  const PathInput({
    super.key,
    required TextEditingController pathInputController,
  }) : _pathInputController = pathInputController;

  final TextEditingController _pathInputController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              child: TextField(
                style: Theme.of(context).textTheme.bodySmall,
                controller: _pathInputController,
                readOnly: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
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
              String? selectedDirectory =
                  await FilePicker.platform.getDirectoryPath();
              _pathInputController.text = selectedDirectory as String;
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
                  'Select path',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
