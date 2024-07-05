import 'package:common/common_bodies_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/common/utils/constants/app_assets.dart';
import 'package:mod_reserve/src/features/edit_contact_page/cubit/edit_contact_cubit.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({super.key});

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  bool isCheckboxActive = false;

  late final TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();

    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<EditContactCubit>(
      child: BlocBuilder<EditContactCubit, EditContactState>(
        builder: (context, state) {
          return BasePage(
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onTap: () {},
            ),
            body: EditContactBody(
              phoneNumberController: phoneNumberController,
              value: isCheckboxActive,
              valueChanged: (value) {
                setState(() {
                  isCheckboxActive = value!;
                });
              },
              onSendNotificationTap: () {},
            ),
          );
        },
      ),
    );
  }
}
