import 'package:flutter/material.dart';
import 'package:marathon/presentation/resources/color_manager.dart';
import 'package:marathon/presentation/resources/font_manager.dart';
import 'package:marathon/presentation/resources/values_manager.dart';


class ItemBuilder extends StatelessWidget {
   dynamic list;
  int index;
    ItemBuilder(
       this.list,this.index ,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m16),
      alignment: FractionalOffset.centerLeft,
      child: Stack(
        children: [
          Container(

            margin: const EdgeInsets.symmetric(
              //vertical: 1.0,
              horizontal: 8.0,
            ),

              width: 70.0,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(150),
              //border: Border.all(color: ColorManager.white,width: 2),
            ),
          ),
          Image(
            image: NetworkImage('${list.imageUrl}'),
            height: 92.0,
            width: 92.0,
          ),
        ],
      ),
    );

    final playerCard = Container(
      margin: const EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 8.0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text('${list.userName}',
              style: Theme.of(context).textTheme.displayLarge),
          Container(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Score: ${list.score}',
                  style: Theme.of(context).textTheme.titleMedium),
              Text(' $index',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: ColorManager.white,fontSize: FontSize.s22)),
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: playerCard,
      height: 90.0,
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

    return Container(
        height: 95.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[

            planetCard,
            planetThumbnail,
          ],
        ));
  }
}
