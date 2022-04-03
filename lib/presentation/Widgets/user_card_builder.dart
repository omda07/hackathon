import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:marathon/model/user_model.dart';
import 'package:marathon/presentation/resources/color_manager.dart';
import 'package:marathon/presentation/resources/values_manager.dart';

class UserCard extends StatelessWidget {
  final UserModel list;

  const UserCard(
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m16),
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: NetworkImage('${list.profile!.imageUrl}'),
        height: 92.0,
        width: 92.0,
      ),
    );

    final playerCard = Container(
      margin: const EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text('${list.profile!.userName}',
              style: Theme.of(context).textTheme.displayLarge),
          Container(height: 10.0),
          Text('Score: ${list.profile!.score}',
              style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );

    final planetCard = Container(
      child: playerCard,
      height: 124.0,
      margin: const EdgeInsets.only(left: AppMargin.m35),
      decoration: BoxDecoration(
        color: ColorManager.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return ConditionalBuilder(
      condition: list != null,
      builder: (context) => Container(
          height: 120.0,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          color: ColorManager.primary,
          child: Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          )),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
