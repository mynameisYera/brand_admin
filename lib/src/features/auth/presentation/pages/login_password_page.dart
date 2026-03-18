import 'package:flutter/material.dart';
import 'package:brand_admin/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:brand_admin/src/core/router/router.dart';
import 'package:brand_admin/src/core/service/injectable/injectable_service.dart';
import 'package:brand_admin/src/core/widgets/custom_button.dart';
import 'package:brand_admin/src/core/widgets/custom_input_field.dart';
import 'package:brand_admin/src/features/auth/presentation/bloc/auth_bloc.dart';

class LoginPasswordPage extends StatefulWidget {
  const LoginPasswordPage({super.key});

  @override
  State<LoginPasswordPage> createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {
  final _pass = TextEditingController();
  final _login = TextEditingController();
  bool obscureText = true;
  final bloc = getIt<AuthBloc>();
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBlocWidget<AuthBloc, AuthEvent, AuthState>(
        bloc: bloc,
        builder: (context, state, bloc) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Brand Admin',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(32),
                    
                    CustomInputField(
                      controller: _login,
                      hint: 'Введите логин',
                      title: 'Логин',
                      keyboardType: TextInputType.text,
                      obscure: false,
                      isPass: false,
                      onSuccess: () {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите логин';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    
                    CustomInputField(
                      controller: _pass,
                      hint: 'Введите пароль',
                      title: 'Пароль',
                      keyboardType: TextInputType.text,
                      obscure: obscureText,
                      isPass: true,
                      onSuccess: () {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите пароль';
                        }
                        return null;
                      },
                    ),
                    const Gap(32),
                    
                    CustomButton(
                      title: 'Войти',
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          bloc.add(AuthEvent.loginEvent(
                            password: _pass.text, 
                            username: _login.text,
                            onSuccess: () {
                              _pass.clear();
                              _login.clear();
                              context.go(RoutePaths.subjectPage);
                            }
                          ));
                        }
                      },
                      isLoading: state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      isDisabled: state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      width: double.infinity,
                      height: 50,
                    ),
                    const Gap(16),
                    
                    state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const SizedBox.shrink(),
                      success: (message) => const SizedBox.shrink(),
                      loadingError: (error) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      error,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.red[600],
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              margin: const EdgeInsets.all(16),
                              duration: const Duration(seconds: 4),
                            ),
                          );
                        });
                        
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.red[50]!,
                                Colors.red[100]!,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.red[300]!,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red[200]!.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.error_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Логин сәтсіз аяқталды!',
                                      style: TextStyle(
                                        color: Colors.red[800],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      error,
                                      style: TextStyle(
                                        color: Colors.red[700],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
