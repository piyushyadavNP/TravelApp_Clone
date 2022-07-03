import 'package:flutter/material.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_buttom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detailState = state as DetailState;
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/${detailState.place.img}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 280,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detailState.place.name!,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: "\$${detailState.place.price}",
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: AppColors.mainColor),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: detailState.place.location!,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detailState.place.stars!
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(5.0)",
                              color: AppColors.textColor2,
                            ),
                          ]),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                              text: "Number of People in your group",
                              color: AppColors.mainColor),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => InkWell(
                                onTap: (() => setState(() {
                                      selectedIndex = index;
                                    })),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButton(
                                    colorChosen: Colors.white,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black87
                                        : Colors.grey.withOpacity(0.4),
                                    borderColor: Colors.white,
                                    size: 50,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(text: detailState.place.description!)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButton(
                          colorChosen: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          size: 60,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        ResponsiveButton(
                          isResponsive: true,
                          text: "Book Now",
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
