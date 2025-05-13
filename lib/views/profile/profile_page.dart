import 'package:flutter/material.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/services/medicine_services/user_services.dart';
import 'package:pill_vault/views/login/login_page.dart';
import 'package:pill_vault/views/profile/widgets/edit_show_dialog.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pill_vault/data/user_database.dart';

class ProfilePage extends StatefulWidget {
   const ProfilePage({
    super.key,
    });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _phoneNumberController = TextEditingController();
  UserDatabase? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final loadUser = await UserServices.getLoggedInUser();
    if (loadUser != null) {
        setState(() {
          user = loadUser;
          _nameController.text = loadUser.fullName;
          _emailController.text = loadUser.email;
          _phoneNumberController.text = loadUser.phoneNumber;
        });
      }
    }

  Future<void> signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const LoginPage()),
      (route) => false,
    );
  }

  // Edit Profile
  void showEditDialog(){
    showDialog(context: context,
    builder: (context){
      return EditShowDialog(
        onCancel: (){
          Navigator.pop(context);
        },
        onUpdate: onUpdate,
        nameController: _nameController,
        emailController: _emailController,
        phoneController: _phoneNumberController);
    }
    );
  }

  void onUpdate()async{
    if(user == null) return;
    await UserServices.updateUser(
      user: user!,
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneNumberController.text);

      setState(() {});
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(TextConstants.editProfileMsg)));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          TextConstants.profile,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(ImageConstants.profilePhoto),
                ),
                const SizedBox(height: 16),
                Text(
                  user!.fullName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(user!.email, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('+91 ${user!.phoneNumber}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Edit Profile"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: showEditDialog,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout_rounded),
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(TextConstants.confirmLogOut),
                        content: const Text(TextConstants.confirmLogOutMsg),
                        actions: [
                          Button(
                            title: "Cancel",
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text("Log out", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                    if (confirm ?? false) {
                      await signOut(context);
                    }
                  },
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
