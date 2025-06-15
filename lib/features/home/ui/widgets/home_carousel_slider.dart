import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/features/common/controllers/Home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSliderController>(
      builder: (SliderController) {
        return Visibility(
          visible: SliderController.getSlidersInProgress == false,
          replacement: SizedBox(
            height: 200,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.themeColor,
                  ),
                ),
              ),
            ),
          ),
          child: Visibility(
            visible: SliderController.sliders.isNotEmpty,
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.9,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      _selectedSlider = index;
                      setState(() {});
                    },
                  ),
                  items:
                      SliderController.sliders.map((slider) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(slider.photoUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  slider.description,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < SliderController.sliders.length; i++)
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey),
                          color:
                              _selectedSlider == i
                                  ? AppColors.themeColor
                                  : Colors.white,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
