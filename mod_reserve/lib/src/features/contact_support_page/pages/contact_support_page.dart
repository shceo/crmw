import 'package:common/common_bodies_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_reserve/src/common/cubit_scope/cubit_scope.dart';
import 'package:mod_reserve/src/features/contact_support_page/cubit/contact_support_cubit.dart';

class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({super.key});

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  late final TextEditingController phoneNumberController;
  late final TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    phoneNumberController.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ContactSupportCubit>(
      child: BlocBuilder<ContactSupportCubit, ContactSupportState>(
        builder: (context, state) {
          return BasePage(
            body: ContactSupportBody(
              phoneNumberController: phoneNumberController,
              commentController: commentController,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
