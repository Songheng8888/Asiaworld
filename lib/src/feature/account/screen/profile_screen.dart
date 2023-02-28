
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:royal_landapp/src/feature/account/screen/my_test_screen.dart';
import 'package:royal_landapp/src/feature/account/screen/profile_menu.dart';
import 'package:royal_landapp/src/feature/account/screen/update_profile_screen.dart';
import 'package:royal_landapp/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:royal_landapp/src/shared/const/color.dart';
import 'package:royal_landapp/src/utils/share/helper.dart';

class AccountProfile extends StatefulWidget {


  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

File? imageFile;
bool _isLoading = false;
String? imageUrl;




class _AccountProfileState extends State<AccountProfile> with TickerProviderStateMixin {
    FilePickupBloc? _filePickupBloc;

  void initState() {
    super.initState();
    _filePickupBloc = FilePickupBloc();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _showImageDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Please choose an option'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Helper.imgFromCamera((image) {
                        _filePickupBloc?.add(image);
                      });
                      Navigator.of(context).pop();// _getFromCamera(); //create get from camera
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.camera,
                            color: Colors.purple,

                          ),
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Helper.imgFromGallery((image) {
                          _filePickupBloc?.add(image);
                        });
                        Navigator.of(context).pop();// _getFromGallery(); //create get from gallery
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.image,
                            color: Colors.purple,
                          ),
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });

      void _getFromCamera() async {
        XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
        // _cropImage(pickedFile!.path);
        Navigator.pop(context);
      }

      void _getFromGallery() async {
        XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
        // _cropImage(pickedFile!.path);
        Navigator.pop(context);
      }

      // void _cropImage(filePath) async {
      //   CroppedFile? croppedImage =
      //       await ImageCropper().cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
      //   if (croppedImage != null) {
      //     setState(() {
      //       imageFile = File(croppedImage.path);
      //     });
      //   }
      // }
    }

    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _showImageDialog();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.24,
                      height: size.width * 0.24,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.cyanAccent,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: imageFile == null
                            ? const Icon(
                                Icons.camera_enhance_sharp,
                                color: Colors.cyan,
                                size: 30,

                              )
                            : Image.file(
                                imageFile!,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Asia World',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'asiaworld@gmai.com',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    // onPressed: () => Get.to(() => UpdateProfileScreen()),
                    onPressed: () {
                      Navigator.push(
                        context,
                        // MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                        MaterialPageRoute(builder: (context) => TestLeng()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        // backgroundColor: Colors.blueAccent,
                        side: BorderSide.none,
                        shape: StadiumBorder()),
                    child: Text('Edit Profile', style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                ProfileWidget(title: 'My Profile', icon: LineAwesomeIcons.user_tie, onPress: () {}),
                ProfileWidget(title: 'My Properties', icon: LineAwesomeIcons.key, onPress: () {}),
                ProfileWidget(title: 'Buy', icon: LineAwesomeIcons.shopping_cart, onPress: () {}),
                ProfileWidget(title: 'Loan', icon: LineAwesomeIcons.money_bill, onPress: () {}),
                ProfileWidget(title: 'Language', icon: LineAwesomeIcons.language, onPress: () {}),
                ProfileWidget(title: 'Favorite', icon: LineAwesomeIcons.heart, onPress: () {}),
                ProfileWidget(
                    title: 'Change Password', icon: LineAwesomeIcons.lock, onPress: () {}),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                ProfileWidget(title: 'information', icon: LineAwesomeIcons.info, onPress: () {}),
                ProfileWidget(
                    title: 'Logout',
                    icon: LineAwesomeIcons.alternate_sign_out,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ProfileWidget extends StatelessWidget {
//   const ProfileWidget({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.onPress,
//     this.endIcon = true,
//     this.textColor,
//   }) : super(key: key);

//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final Color? textColor;

//   @override
//   Widget build(BuildContext context) {
//     // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     // var iconColor = isDark ? Colors.grey.withOpacity(0.1) : Colors.white.withOpacity(0.1);
//     return ListTile(
//       onTap: onPress,
//       leading: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Colors.grey.withOpacity(0.1),
//         ),
//         child: Icon(
//           icon,
//           color: Colors.blueAccent,
//         ),
//       ),
//       title: Text(
//         title,
//         style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
//       ),
//       trailing: endIcon
//           ? Container(
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: Colors.grey.withOpacity(0.1),
//               ),
//               child: Icon(
//                 LineAwesomeIcons.angle_right,
//                 size: 18.0,
//                 color: Colors.grey,
//               ),
//             )
//           : null,
//     );
//   }
// }
