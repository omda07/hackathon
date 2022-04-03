import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:marathon/controller/app_provider.dart';
import 'package:marathon/presentation/Widgets/item_builder.dart';
import 'package:provider/provider.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: ConditionalBuilder(
              condition: value.mathematicsModel!.users != null &&
                  value.mathematicsModel != null,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemBuilder: (context, index) =>
                        ItemBuilder(value.mathematicsModel!.users![index],index+1),
                    // itemBuilder(context, value.backendUserModel!.users![index]),

                    itemCount: value.mathematicsModel!.users!.length),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),

    );
  }
}
