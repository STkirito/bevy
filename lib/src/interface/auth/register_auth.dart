import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/auth/register_auth_controller.dart';
import 'package:bevy/src/interface/shared/background_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterAuth extends GetView {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'loginform');
  RegisterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return GetBuilder<RegisterAuthController>(
        init: Get.put(RegisterAuthController()),
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
                      const _Ingresar(),
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
        child: Text('Bevy',
            style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 40)),
      ),
    );
  }
}

class _Form extends GetView<RegisterAuthController> {
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
              controller: controller.name,
              validator: (value) => controller.validateIsName(value ?? ''),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle,
                    color: Colors.white.withOpacity(.5)),
                hintText: 'Ingrese su nombre'.tr,
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
              controller: controller.email,
              validator: (value) => controller.validateIsEmail(value),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined,
                    color: Colors.white.withOpacity(.5)),
                hintText: 'Ingrese su correo electrónico'.tr,
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
              validator: (value) => controller.validateIsPassword(value),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.lock, color: Colors.white.withOpacity(.5)),
                hintText: 'Ingresa una contraseña'.tr,
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
            const _ContractButton(),
          ],
        ),
      ),
    );
  }
}

class _ContractButton extends GetView<RegisterAuthController> {
  const _ContractButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AwsTcButton(
        value: controller.contract.value,
        text: Text('Terminos y condiciones'.tr),
        onPressed: () => controller.validateContract(),
      ),
    );
  }
}

class _ButtonToHome extends GetView<RegisterAuthController> {
  final GlobalKey<FormState>? _formKey;
  const _ButtonToHome(GlobalKey<FormState>? formKey) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: AwsAnimationButton(
        initLabel: Text('Registrarse'.tr),
        actionsLabel: Text('Registrandose'.tr),
        actionsIcon: Image.asset('assets/cargando.gif'),
        okLabel: Text('Registrado'.tr),
        sizeY: 45,
        actions: () async => await controller.registrationProcess(_formKey),
        ok: () => controller.navigationToHome(),
        error: () => controller.errorRegistration(),
      ),
    );
  }
}

class _Ingresar extends GetView {
  const _Ingresar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AwsScreenSize.height(11),
      alignment: Alignment.bottomCenter,
      child: AwsTextRowButton(
        title: 'Tienes una cuenta'.tr,
        label: 'inicia ya'.tr,
        styleLabel: const TextStyle(color: Colors.green),
        onPressed: () => Get.back(),
      ),
    );
  }
}
