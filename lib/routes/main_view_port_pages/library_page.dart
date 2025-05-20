//packages
import 'package:codex/models/library_model.dart';
import 'package:codex/routes/main_view_port_pages/create_folder.dart';
import 'package:codex/routes/main_view_port_pages/library_view.dart';
import 'package:codex/routes/main_view_port_pages/select_folder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});



@override
  Widget build(BuildContext context) {
    

    return SizedBox.expand(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: FutureBuilder(future: context.watch<LibraryModel>().checkDirectory(), builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            
            if(snapShot.data as bool == true && context.read<LibraryModel>().libraryFolderPath != null) {
              return LibraryView();
            } else {
              return NoLibraryFound(); 
            }
            
          }

          return Center(child: CircularProgressIndicator());
        })
      ),
    );
  }
}

 enum libraryCreationMode {
    selectFolder,
    createFolder,
  }

class NoLibraryFound extends StatefulWidget {
  
  NoLibraryFound({super.key});

  

  @override
  State<NoLibraryFound> createState() => _NoLibraryFoundState();
}

class _NoLibraryFoundState extends State<NoLibraryFound> {

 libraryCreationMode _currentMode = libraryCreationMode.selectFolder;

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

        //Row for the 2 buttons 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () { setState(() {
                  _currentMode = libraryCreationMode.selectFolder;
                });},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).colorScheme.secondary)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Select folder',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {setState(() {
                  _currentMode = libraryCreationMode.createFolder;
                });},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).colorScheme.secondary)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Create folder',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        
        (_currentMode == libraryCreationMode.selectFolder) ? 
        SelectFolder() : CreateFolder()  
        //Text Field
      ],
    );
  }
}
