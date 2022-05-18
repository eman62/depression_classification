import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../view_controllers/02_user_controllers/user_controller.dart';
import '../../../widgets/user_post_item.dart';

class FavouriteScreen extends StatelessWidget {

  const FavouriteScreen ({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<UserController>(builder: (controller) {

      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favourite',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),),
          elevation: 0,
        ),
        body: ConditionalBuilder(
            condition: controller.isLoadingGettingPosts,
            builder: (context) => Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            fallback: (builder) {
              //controller.getPostsFav();
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 10.0,
                      margin: EdgeInsets.all(8.0),
                    ),
                    controller.favouriteByMe.isEmpty
                        ?
                    Center(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.menu,
                          size: 100,
                          color: Colors.grey,
                        ),
                        Text(
                          'No Have Posts ..',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),)
                        : ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.favouriteByMeIndex.length,
                      itemBuilder: (context, index){

                        return UserPostItem(
                            controller: controller,
                            model: controller.posts[controller.favouriteByMeIndex[index]],
                            context: context,
                            postIndex: controller.favouriteByMeIndex[index]
                        );

                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 15),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              );

            }
        ),
      );
    },

    );
    ///////////////////
  }

}
