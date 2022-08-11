import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/shared/colors/colors.dart';
import 'package:instagram_clone/shared/network/resources/fire_store_method/fire_store_method.dart';
import 'package:instagram_clone/shared/network/resources/image_picker/image_picker.dart';
import 'package:instagram_clone/shared/providers/user_provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../model/user_model/user_model.dart';
import '../../shared/widgets/toast/my_toast.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;
  void _selectImage(BuildContext context)async{
    return showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title:  const Text(
                'Create a post',
            ),
            children: [
              SimpleDialogOption(
                child: const Text(
                  'Take a photo',
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List? file = await pickImage(
                      ImageSource.camera,
                  );
                  setState(() {
                    _file = file!;
                  });
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  'Choose from gallery',
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List? file = await pickImage(
                      ImageSource.gallery,
                  );
                  setState(() {
                    _file = file!;
                  });
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  'Cancel',
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void postImage({
    required String uid,
    required String username,
    required String profImage,
}) async{

    setState(() {
      isLoading = true;
    });
    String res = "error occurred";
    try{
      res = await FireStoreMethods().
      uploadPost(
          description: descriptionController.text,
          file: _file!,
          uid: uid,
          username: username,
          profImage: profImage
      );
    }
    catch(error){
      res = error.toString();
    }
    if(res != "Posted Successfully"){
      await myToast(
        msg: res,
        color: Colors.red,
        txtColor: Colors.white,
      );
    }
    else {
      await myToast(
        msg: res,
        color: Colors.green,
        txtColor: Colors.white,
      );
      clearImage();
    }
    setState(() {
      isLoading = false;
    });
  }

  void clearImage(){
    setState(() {
      _file = null;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null ? Center(
      child: IconButton(
        icon: const Icon(
          Icons.upload_rounded,
          color: primaryColor,
        ),
        onPressed: ()=>_selectImage(context),
      ),
    ):Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: clearImage,
        ),
        title: const Text(
          'Post to'
        ),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: ()=>postImage(
                username: user.username,
                uid: user.uid,
                profImage: user.photoUrl,
              ),
              child: const Text(
                'Post',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
        ],
      ),
      body: Column(
        children: [
          isLoading?const LinearProgressIndicator():const SizedBox(),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user.photoUrl,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.5,
                child: TextField(
                  controller: descriptionController,
                  style:const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'write caption...',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: InputBorder.none
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45.0,
                width: 45.0,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(
                          _file!,
                        ),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
