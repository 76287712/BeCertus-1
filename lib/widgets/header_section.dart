import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/screens/login_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String email_input = '';
    String password_input = '';
    NotasProvider notasProvider = Provider.of<NotasProvider>(context);
    String name = notasProvider.name ?? '';
    return Container(
      padding: EdgeInsets.fromLTRB(22, 0, 10, 0),
      margin: EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(notasProvider.photoUrl ?? ''),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 44, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              'Buenos Dias,',
                              style: TextStyle(
                                fontFamily: 'Mitr',
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                height: 1,
                                color: Color(0xff313131),
                              ),
                            ),
                          ),
                          AutoSizeText(
                            name,
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              color: Color(0xff313131),
                            ),
                            maxLines:
                                1, // Establece el número máximo de líneas que el texto puede ocupar
                            overflow: TextOverflow
                                .ellipsis, // Manejo de desbordamiento
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // Distribuir elementos en el espacio disponible
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: greyLight, // Color de fondo rojo
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        child: badges.Badge(
                          badgeContent: Text('4'),
                          child: Center(
                            child: Icon(
                              Icons.email,
                              color: greyDark, // Color del icono blanco
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15), // Espacio entre los iconos
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: greyLight, // Color de fondo rojo
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        child: badges.Badge(
                          badgeContent: Text('3'),
                          child: Center(
                            child: Icon(
                              Icons.notifications,
                              color: greyDark, // Color del icono blanco
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}
