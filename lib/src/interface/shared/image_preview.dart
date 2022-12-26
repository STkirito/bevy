import 'dart:io';
import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/interface/shared/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AwsTypePreviewImageView { perfil, image, chatPreviewWallpaper }

class AwsPreviewImageView extends StatelessWidget {
  final AwsArguments _arguments;
  const AwsPreviewImageView(
    this._arguments, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (_arguments.result) {
      case AwsTypePreviewImageView.image:
        return SizedBox(
          height: AwsScreenSize.height(100),
          width: AwsScreenSize.width(100),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _Title(),
                  _PreviewImg(_arguments.file!),
                  _MenuButtom(() {
                    _arguments.object;
                  }),
                ],
              ),
            ),
          ),
        );

      case AwsTypePreviewImageView.perfil:
        return SizedBox(
          height: AwsScreenSize.height(100),
          width: AwsScreenSize.width(100),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _Title(),
                  _PreviewImgPerfil(image: _arguments.file!),
                  _MenuButtomPerfil(() {
                    _arguments.object;
                  }),
                ],
              ),
            ),
          ),
        );
      case AwsTypePreviewImageView.chatPreviewWallpaper:
        return SizedBox(
          height: AwsScreenSize.height(100),
          width: AwsScreenSize.width(100),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_ChatPreviewWallpaper(image: _arguments.file!)],
              ),
            ),
          ),
        );

      default:
        return SizedBox(
          height: AwsScreenSize.height(100),
          width: AwsScreenSize.width(100),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _Title(),
                  _PreviewImg(_arguments.file!),
                  _MenuButtom(() {
                    _arguments.object;
                  }),
                ],
              ),
            ),
          ),
        );
    }
  }
}

class _MenuButtom extends StatelessWidget {
  final void Function()? upLoad;

  const _MenuButtom(this.upLoad);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          child: Row(
            children: [
              const Icon(Icons.dangerous, color: Colors.red),
              SizedBox(width: AwsScreenSize.width(2)),
              const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
          onPressed: () => Get.back(),
        ),
        CupertinoButton(
          onPressed: upLoad,
          child: Row(
            children: [
              const Icon(
                Icons.upload_rounded,
              ),
              SizedBox(width: AwsScreenSize.width(2)),
              const Text(
                'Subir',
              )
            ],
          ),
        )
      ],
    );
  }
}

class _PreviewImg extends StatelessWidget {
  final File image;

  const _PreviewImg(this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 10),
      width: AwsScreenSize.width(70),
      height: AwsScreenSize.height(60),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Image.file(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Previsualizar'.tr,
        style: GoogleFonts.dancingScript(
            fontWeight: FontWeight.w700,
            color: Colors.amber[900],
            fontSize: 25));
  }
}

class _MenuButtomPerfil extends StatelessWidget {
  final void Function()? upLoad;

  const _MenuButtomPerfil(this.upLoad);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          child: Row(
            children: [
              const Icon(Icons.dangerous, color: Colors.red),
              SizedBox(width: AwsScreenSize.width(2)),
              const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
          onPressed: () => Get.back(),
        ),
        CupertinoButton(
          onPressed: upLoad,
          child: Row(
            children: [
              const Icon(
                Icons.upload_outlined,
              ),
              SizedBox(width: AwsScreenSize.width(2)),
              const Text(
                'Subir',
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _PreviewImgPerfil extends StatelessWidget {
  final File image;

  const _PreviewImgPerfil({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 10),
      height: AwsScreenSize.height(16),
      padding: const EdgeInsets.all(5),
      width: 123,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xfffbc8c8),
            Color(0xff259fff),
          ],
          stops: [
            0,
            1,
          ],
        ),
        backgroundBlendMode: BlendMode.luminosity,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Center(
        child: Container(
          height: AwsScreenSize.height(15),
          width: AwsScreenSize.width(32),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            border: Border.all(
              width: 2,
              color: Colors.amberAccent,
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

//

class _ChatPreviewWallpaper extends StatefulWidget {
  final File image;
  final void Function()? onPressed;
  /* final int index; */
  const _ChatPreviewWallpaper({
    Key? key,
    required this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  _ChatPreviewWallpaperState createState() => _ChatPreviewWallpaperState();
}

class _ChatPreviewWallpaperState extends State<_ChatPreviewWallpaper>
    with TickerProviderStateMixin {
  /* final SettingsController _settings = Get.find<SettingsController>();
  final DriverController _driver = Get.find<DriverController>(); */
  /* final ScreenArguments _arguments = Get.arguments as ScreenArguments; */
  late List<ChatMessage> _messages;
  @override
  void initState() {
    super.initState();
    _messages = [
      ChatMessage(
        id: '1',
        message: 'Hola Soy Rampana Drive, ¿Como esta tu día?.',
        animationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 200),
        ),
        date: DateTime.now(),
        idUser: '0',
      ),
      ChatMessage(
        id: '1',
        message: 'Gracias me encuentro bien.',
        animationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 200),
        ),
        date: DateTime.now(),
        idUser: '0',
      ),
      ChatMessage(
        id: '1',
        message: 'Este fondo se ve lindo.',
        animationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 200),
        ),
        date: DateTime.now(),
        idUser: '0',
      ),
    ];
    _messages[0].animationController.forward();
    _messages[1].animationController.forward();
    _messages[2].animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AwsScreenSize.height(92),
        width: AwsScreenSize.width(100),
        /* decoration: BoxDecoration(
          image: DecorationImage(
            image: Imagef,
            fit: BoxFit.cover,
          ),
        ), */
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              child: Image.file(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CupertinoButton(
                            child: Icon(Icons.arrow_back_ios_new),
                            onPressed: () => Get.back()),
                        Spacer(),
                      ],
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (_, i) => _messages[i],
                      reverse: false,
                    ),
                  ),
                  Divider(height: 1),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: _inputChat(),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  width: AwsScreenSize.width(100),
                  height: AwsScreenSize.height(10),
                  child: Center(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.5),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      autofocus: true,
                      onPressed: () {
                        widget.onPressed;
                        Get.back();
                        Get.showSnackbar(GetSnackBar(
                          title: 'Bevy',
                          message: 'Ya puedes ver tu nuevo fondo de pantalla.',
                          duration: Duration(milliseconds: 3500),
                        ));
                      },
                      child: Text(
                        'ESTABLECER FONDO DE PANTALLA',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Flexible(
              child: TextField(
            enabled: false,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: 'Enviar mensaje',
              hintStyle: TextStyle(color: Colors.black45),
            ),
          )),

          // Botón de enviar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconTheme(
                data: IconThemeData(color: Colors.blue[400]),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.send, color: Colors.black45),
                  onPressed: null,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
