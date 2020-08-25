import 'package:comprasdoseuze/app/utils/routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black26,
                  )
                ],
                color: Theme.of(context).backgroundColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 4,
                    color: Colors.black26,
                  )
                ],
                border: Border(
                  top: BorderSide(
                    color: Colors.black26,
                    width: 1,
                  ),
                ),
                color: Color(0xFFC9DAE2).withOpacity(0.9),
              ),
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(Routes.HOME_SCREEN),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Compras",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 4,
                    color: Colors.black26,
                  )
                ],
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Colors.black26,
                    width: 1,
                  ),
                ),
                color: Color(0xFFC9DAE2).withOpacity(0.9),
              ),
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(Routes.BUY_SCREEN),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lista de Compras",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
