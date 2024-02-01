
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class updateButton extends StatefulWidget{
  _updateState  createState() => _updateState();
}
class _updateState extends State<updateButton>{



  List<Asset> selectedImages = [];

  Future<void> loadAssets() async {
    // Request gallery permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
    ].request();

    if (statuses[Permission.photos]?.isGranted == true) {
      List<Asset> resultList = [];
      try {
        resultList = await MultiImagePicker.pickImages(
          maxImages: 10, // Maximum number of images to pick
          enableCamera: true, // Allow using the device's camera
        );
      } on Exception catch (e) {
        // Handle any errors.
      }

      setState(() {
        selectedImages = resultList;
      });
    } else {
      // Handle permission denied
    }
  }





  @override
  Widget build(BuildContext context) {

    return Column(
      children: [


        ElevatedButton(
          onPressed: loadAssets,
          child: Icon(Icons.upload),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: selectedImages.length,
            itemBuilder: (context, index) {
              Asset asset = selectedImages[index];
              return AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              );
            },
          ),
        ),
      ],
    );


    // TODO: implement build
    throw UnimplementedError();
  }


}




