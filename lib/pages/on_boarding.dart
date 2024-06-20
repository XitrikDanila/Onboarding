import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding/data/data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'clever_person_screen.dart';
import 'onboarding_cubit.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: contentList[state.currentIndex].backgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: contentList.length,
                      onPageChanged: (int index) {
                        context
                            .read<OnboardingCubit>()
                            .updateIndex(index, contentList.length);
                      },
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: state.currentIndex == 0 ||
                                    state.currentIndex == 3
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      contentList[index].title,
                                      style: const TextStyle(
                                        fontFamily: "SF-Pro",
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28.0,
                                        letterSpacing: 0.24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      contentList[index].discription,
                                      style: const TextStyle(
                                        fontFamily: "SF-Pro",
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(contentList[index].image),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: List.generate(
                                  contentList.length,
                                  (index) =>
                                      buildDot(index, state.currentIndex),
                                ),
                              ),
                              const SizedBox(height: 10),
                              CupertinoButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CleverPersonScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              )
                            ],
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (state.currentIndex ==
                                  contentList.length - 1) {}
                              _controller!.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 55,
                                  width: 55,
                                  child: CircularProgressIndicator(
                                    value: state.percentage,
                                    backgroundColor: Colors.white38,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: contentList[state.currentIndex]
                                        .backgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AnimatedContainer buildDot(int index, int currentIndex) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 8,
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Colors.white38,
      ),
    );
  }
}
