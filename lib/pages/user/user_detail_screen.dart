import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salty_flutter_test/model/user_model.dart';
import 'package:salty_flutter_test/styles/base_color.dart';
import 'package:sizer/sizer.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel userModel;

  const UserDetailScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
        backgroundColor: BaseColor.Primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            // height: 80.sp,
            child: Center(
              child: ClipOval(child: Image.network(userModel.avatar)),
            ),
          ),
          LabelInfoWidget(label: "First Name", value: userModel.firstName),
          LabelInfoWidget(label: "Last Name", value: userModel.firstName),
          LabelInfoWidget(label: "Email", value: userModel.firstName),
        ]),
      ),
    );
  }
}

class LabelInfoWidget extends StatelessWidget {
  const LabelInfoWidget({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.sp),
      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
      decoration: BoxDecoration(
          border: Border.all(color: BaseColor.Border),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          )),
      // height: 40.sp,
      width: 90.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 8.sp,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
