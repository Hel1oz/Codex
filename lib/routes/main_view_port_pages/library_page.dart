//packages
import 'package:codex/models/library_model.dart';
import 'package:codex/routes/main_view_port_pages/noLibraryCreationParts/create_folder.dart';
import 'package:codex/routes/main_view_port_pages/library_view.dart';
import 'package:codex/routes/main_view_port_pages/noLibraryCreationParts/select_folder.dart';
import 'package:codex/routes/main_view_port_pages/noLibraryCreationParts/user_support_directory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: context.watch<LibraryModel>().libraryFolderPath == null ? NoLibraryFound() : LibraryView() 
      ),
    );
  }
}

enum LibraryCreationMode { selectFolder, createFolder, supportFolder }

class NoLibraryFound extends StatefulWidget {
  const NoLibraryFound({super.key});

  @override
  State<NoLibraryFound> createState() => _NoLibraryFoundState();
}

class _NoLibraryFoundState extends State<NoLibraryFound> {
  LibraryCreationMode _currentMode = LibraryCreationMode.selectFolder;

  void changeCurrentMode(LibraryCreationMode libraryCreationMode) {
    setState(() {
      _currentMode = libraryCreationMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Text(
          'Libray folder currently does not exist',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Create a new folder or select an existing folder to use as the library folder',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 40),

        //Row for the 3 buttons
        OverflowBar(
          spacing: 8,
          overflowAlignment: OverflowBarAlignment.center,
          children: [
            CustomButton(
              changeMode: changeCurrentMode,
              libraryCreationMode: LibraryCreationMode.supportFolder,
              name: 'Use Support Directory',
            ),
            CustomButton(
              changeMode: changeCurrentMode,
              libraryCreationMode: LibraryCreationMode.selectFolder,
              name: 'Use Existing Directory',
            ),
            CustomButton(
              changeMode: changeCurrentMode,
              libraryCreationMode: LibraryCreationMode.createFolder,
              name: 'Create New Folder',
            ),
          ],
        ),
        
        switch (_currentMode) {
          LibraryCreationMode.supportFolder => UserSupportDirectory(),
          LibraryCreationMode.selectFolder => SelectFolder(),
          LibraryCreationMode.createFolder =>  CreateFolder()
        }
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final void Function(LibraryCreationMode)
  changeMode; // Updated to match the signature
  final LibraryCreationMode libraryCreationMode;
  final String name;

  const CustomButton({
    super.key,
    required this.changeMode,
    required this.libraryCreationMode,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => changeMode(libraryCreationMode),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
