import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/assets/app_svg.dart';
import 'package:spotifyclone/core/common/common_button.dart';
import 'package:spotifyclone/core/common/textform_field.dart';
import 'package:spotifyclone/core/config/loader/loader.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';
import 'package:spotifyclone/core/helper/is_dark_mode.dart';
import 'package:spotifyclone/core/helper/text_controller.dart';
import 'package:spotifyclone/core/router/app_route.gr.dart';
import 'package:spotifyclone/features/authentication/presentation/bloc/auth_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllers = TextEditingControllers();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSucess) {
            print("Auth Sucess");
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          return Stack(
            children: [
              IgnorePointer(
                ignoring: isLoading,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28).r,
                  child: Column(
                    children: [
                      SizedBox(height: 36.h),
                      SvgPicture.asset(AppVector.spotifyLogo, height: 33.h),
                      SizedBox(height: 80.h),
                      Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color:
                              context.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      InkWell(
                        onTap: () {},
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'If you need any support ',

                            style: TextStyle(
                              fontSize: 12.sp,
                              color:
                                  context.isDarkMode
                                      ? Colors.grey
                                      : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'click here',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 38.h),
                      CommonTextField(
                        hintText: 'enter username or email',
                        obscureText: false,
                        controller: controllers.emailController,
                      ),
                      SizedBox(height: 16.h),
                      CommonTextField(
                        hintText: 'Password',
                        obscureText: true,
                        controller: controllers.passwordController,
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Recovery password',

                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color:
                                context.isDarkMode ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      CustomButton(
                        title: 'Sign In',
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            AuthLogin(
                              email: controllers.emailController.text.trim(),
                              password:
                                  controllers.passwordController.text.trim(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 31.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff5B5B5B),
                                    Color(0xff252525),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '  or  ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffAEAEAE),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff252525),
                                    Color(0xff5B5B5B),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<AuthBloc>().add(AuthGoogleLogin());
                            },
                            child: Image.asset(AppPng.googleIcon),
                          ),
                          SizedBox(width: 55.w),
                          Image.asset(AppPng.appleIcon),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      InkWell(
                        onTap: () {
                          context.router.push(SignupRoute());
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Not a Member ? ',

                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'click here',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading) const LoadingOverlay(),
            ],
          );
        },
      ),
    );
  }
}
