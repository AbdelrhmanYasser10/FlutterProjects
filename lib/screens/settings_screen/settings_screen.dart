import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/screens/edit_profile/edit_profile.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder:(context,state) {
        var userModel = SocialCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 190,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 140.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${userModel!.cover}"),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                            '${userModel.image}'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${userModel.name}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              Text(
                "${userModel.bio}",
                style: Theme
                    .of(context)
                    .textTheme
                    .caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              "10k",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text(
                              "Followers",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              "64",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text(
                              "Following",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              "800",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text(
                              "Photos",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              "100",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            Text(
                              "Posts",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child:OutlinedButton(
                        onPressed: (){},
                        child: Text(
                          'Add Photos'
                        ),
                      )
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  OutlinedButton(
                    onPressed: (){
                      navigateTo(context, EditProfileScreen());
                    },
                    child: Icon(
                      IconBroken.Edit,
                      size: 16.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
