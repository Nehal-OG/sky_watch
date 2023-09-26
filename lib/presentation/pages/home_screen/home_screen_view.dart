import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_watch/presentation/pages/home_screen/home_screen_view_model.dart';
import 'package:sky_watch/presentation/resources/assets_manager.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/font_manager.dart';
import 'package:sky_watch/presentation/resources/route_manager.dart';
import 'package:sky_watch/presentation/resources/strings_manager.dart';
import 'package:sky_watch/presentation/resources/styles_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_button.dart';
import 'package:sky_watch/presentation/widgets/custom_text_field.dart';

import '../../widgets/custom_scaffold.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Get.find<WeatherViewModel>();

    return CustomScaffold(context,
        scaffoldPadding: AppPaddings.p0,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                ImageAssets.homeBackground,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () async {
                          var updated = await Get.toNamed(Routes.settingsRoute);
                          if (updated != null && updated) {
                            if (weatherViewModel.currentLoction.isTrue) {
                              weatherViewModel.getCurrentPosition();
                            } else {
                              weatherViewModel.getCityWeather(
                                  weatherViewModel.cityController.text);
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    textFontSize: FontSizeManager.s20,
                    controller: weatherViewModel.cityController,
                    hintText: AppStrings.city,
                    suffixIconName: Icons.location_city,
                    bottomPadding: AppPaddings.p16,
                    onSuffixIconPressed: () {
                      if (weatherViewModel.cityController.text.isNotEmpty) {
                        weatherViewModel.getCityWeather(
                            weatherViewModel.cityController.text);
                      } else {
                        const SnackBar(
                          content: Text('Please Enter A City'),
                          duration: Duration(seconds: 5),
                        );
                      }
                    },
                    isLastTextField: true,
                    onSubmitted: (value) =>
                        weatherViewModel.cityController.text.isNotEmpty
                            ? weatherViewModel.getCityWeather(
                                weatherViewModel.cityController.text)
                            : const SnackBar(
                                content: Text('Please Enter A City'),
                                duration: Duration(seconds: 5),
                              ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                    ),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${weatherViewModel.temp.obs}°',
                              style: kTempTextStyle()),
                          Text(
                            '${weatherViewModel.weatherIcon.obs}',
                            style: kConditionTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.width / 5,
                      ),
                      child: Text(
                        '${weatherViewModel.desc.obs}',
                        style: kTempTextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(1.0),
          child: CustomButton(
            "Your Location",
            onPressed: () {
              weatherViewModel.getCurrentPosition();
              weatherViewModel.cityController.text = '';
            },
            greyBackground: true,
          ),
        ));
  }
}
