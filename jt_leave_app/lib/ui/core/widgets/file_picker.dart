
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_app_file/open_app_file.dart';





class FileSelector extends StatefulWidget {
  const FileSelector({super.key});

  @override
  State<FileSelector> createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  PlatformFile? selectedFile;
  // Imported file_picker package to allow picking a file using a native explorer - flutter doesn't have a native option.


  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        ElevatedButton(onPressed: () async {
        
          FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg','pdf','png','doc'],
            );
        
            if (resultFile != null){
              selectedFile = resultFile.files.first;
              // selectedFile == null ? false : OpenAppFile.open(selectedFile!.path.toString());
            } else {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Upload cancelled. Please try again.')));
            }
        }, child: const Text('Browse')
        ),
        if (selectedFile != null)
        TextButton(
          onPressed: () => OpenAppFile.open(selectedFile!.path.toString()),
          child: Text("${selectedFile!.name} successfully uploaded.", textAlign: TextAlign.center,))
      ],
    );
    
  }
}