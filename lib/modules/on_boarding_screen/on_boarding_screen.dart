import 'package:flutter/material.dart';
import 'package:shop_appli/models/boarding_model/boarding_model.dart';
import 'package:shop_appli/modules/log_in_screen/login_screen.dart';
import 'package:shop_appli/shared/colors/colors.dart';
import 'package:shop_appli/shared/components/components.dart';
import 'package:shop_appli/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<BoardingModel> boarding =[
    BoardingModel(
        image:"assets/images/on_boarding1.png",
        title: "Screen 1",
        body:"Screen 1 body"),
    BoardingModel(
        image:"assets/images/on_boarding2.png",
        title: "Screen 2",
        body:"Screen 2 body"),
    BoardingModel(
        image:"assets/images/on_boarding3.png",
        title: "Screen 3",
        body:"Screen 3 body"),
  ];

  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Salla',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 56.0),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                    itemBuilder: (context,index)=> buildBoardingItem(
                      context:context,
                      boardingModel: boarding[index],
                    ),
                  physics: BouncingScrollPhysics(),
                  itemCount: boarding.length,
                  controller: boardController,
                  onPageChanged: (int index){
                      if(index == boarding.length - 1){
                        setState(() {
                          isLast = true;
                        });
                      }
                      else{
                        setState(() {
                          isLast = false;
                        });
                      }
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                    SmoothPageIndicator(
                        controller:boardController ,
                        count: boarding.length,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          expansionFactor: 4,
                          activeDotColor: defaultColor,
                        ),
                    ),
                  Spacer(),
                  FloatingActionButton(onPressed: (){
                   if(isLast){
                     CacheHelper.saveData(
                         key: 'onBoarding',
                         value: true
                     );
                     Navigator.pushAndRemoveUntil(
                       context,
                       MaterialPageRoute(builder: (context)=>LogInScreen()),
                         (route){
                         return false;
                        }
                     );
                   }
                   else{
                     boardController.nextPage(
                         duration: Duration(
                           milliseconds: 750,
                         ),
                         curve: Curves.fastLinearToSlowEaseIn
                     );
                   }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),)
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}
