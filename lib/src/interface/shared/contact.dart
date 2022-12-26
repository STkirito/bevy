import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final bool popupMenu;
  final String avatar;
  final String name;
  final String? menssage;
  final bool status;
  final void Function(int)? popupOnSelected;
  final void Function()? onTap;

  const Contact(
      {this.popupMenu = false,
      required this.avatar,
      required this.name,
      this.menssage,
      required this.status,
      this.popupOnSelected,
      super.key,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: popupMenu
          ? PopupMenuButton(
              offset: const Offset(1, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: const Color.fromRGBO(114, 162, 240, 94).withRed(1),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Compartir',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Eliminar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) => popupOnSelected?.call(value),
              child: _leading(),
            )
          : _leading(),
      title: Text(name),
      subtitle: menssage != null ? Text(menssage!) : null,
      trailing: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: status ? Colors.green : Colors.red,
        ),
      ),
      onTap: onTap,
      //onLongPress: () {},
    );
  }

  CircleAvatar _leading() {
    return CircleAvatar(
      //child: Image.network(src),
      backgroundImage: NetworkImage(avatar),
    );
  }
}
