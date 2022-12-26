import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/auth/login_auth_controller.dart';
import 'package:bevy/src/interface/shared/background_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAuth extends GetView {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'loginform');
  LoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);

    return GetBuilder<LoginAuthController>(
        init: Get.put(LoginAuthController()),
        builder: (controller) {
          return Scaffold(
            body: BackGroundAuth(
              child: SizedBox(
                height: AwsScreenSize.height(100),
                width: AwsScreenSize.width(100),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _Title(),
                      _Form(_formKey),
                      _ButtonToHome(_formKey),
                      const _Recover(),
                      const _Register(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _Title extends GetView {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AwsScreenSize.height(20),
      child: Center(
        child: Text(
          'Bevy',
          style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w700, color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}

class _Form extends GetView<LoginAuthController> {
  final GlobalKey<FormState>? _formKey;
  const _Form(GlobalKey<FormState>? formKey) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => controller.validationIsEmail(value),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.email, color: Colors.white.withOpacity(.5)),
                hintText: 'Correo electrónico'.tr,
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                filled: true,
                fillColor: Colors.black.withOpacity(.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(.2))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(.2))),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: controller.password,
              validator: (value) => controller.validationIsPassword(value),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.lock, color: Colors.white.withOpacity(.5)),
                hintText: 'Contraseña'.tr,
                hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                filled: true,
                fillColor: Colors.black.withOpacity(.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(.2))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(.2))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonToHome extends GetView<LoginAuthController> {
  final GlobalKey<FormState>? _formKey;
  const _ButtonToHome(GlobalKey<FormState>? formKey) : _formKey = formKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: AwsAnimationButton(
        initLabel: Text('Ingresar'.tr),
        actionsLabel: Text('Verificando'.tr),
        actionsIcon: Image.asset('assets/cargando.gif'),
        okLabel: Text('Verificado'.tr),
        sizeY: 45,
        actions: () async => await controller.loginProcess(_formKey),
        ok: () => controller.navigationToHome(),
        error: () => controller.errorLogin(),
      ),
    );
  }
}

class _Recover extends GetView<LoginAuthController> {
  const _Recover();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AwsScreenSize.height(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Olvidaste tu contraseña'.tr,
            style: const TextStyle(color: Colors.white),
          ),
          CupertinoButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white.withOpacity(.7),
                    builder: (context) {
                      return KeyboardVisibilityBuilder(
                          builder: (context, isKeyboardVisible) {
                        controller.isKeyboardVisible(isKeyboardVisible);
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Obx(
                            () => Column(
                              mainAxisSize: controller.mainAxisSize.value,
                              children: [
                                Text('Recuperar cuenta'.tr),
                                TextField(
                                  controller: controller.emailRecover,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Ingrese aqui su correo electrónico'.tr,
                                    border: InputBorder.none,
                                  ),
                                ),
                                AwsAnimationButton(
                                  initLabel: Text('Enviar'.tr),
                                  initIcon: const Icon(Icons.email),
                                  actionsLabel: Text('Verificando'.tr),
                                  okLabel: Text('Enviado'.tr),
                                  angle: 0.2,
                                  sizeY: 45,
                                  actions: () async =>
                                      await controller.recoverAccount(),
                                  ok: () => Get.back(),
                                  error: () => controller.errorRecoverAccount(),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    });
              },
              child: Text(
                'Recuperala Aqui'.tr,
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              )),
        ],
      ),
    );
  }
}

class _Register extends GetView<LoginAuthController> {
  const _Register();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AwsScreenSize.height(10),
      alignment: Alignment.bottomCenter,
      child: AwsTextRowButton(
        title: 'Aun no tienes cuenta'.tr,
        label: 'crea una'.tr,
        styleLabel: const TextStyle(color: Colors.green),
        onPressed: () => controller.navigationToRegister(),
      ),
    );
  }
}
