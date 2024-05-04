import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matrix/custom_widgets/clickable_widget.dart';
import 'package:matrix/custom_widgets/tabs.dart';

import '../resources/resources.dart';
import '../theme/theme.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  const CustomExpansionTile({super.key, required this.title, required this.children});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  final double tab_height = 72;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        trailing: Stack(
          children: [
            Icon(Icons.more_horiz, size: 32, color: AppStyle.lightBlue,),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        enableDrag: true,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                          ),
                        ),
                        backgroundColor: AppStyle.darkGrey,
                        context: context,
                        builder: (context){
                          return Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    width: 32,
                                    height: 4,

                                  ),
                                ),
                              ),
                              ListTile(
                                  leading: Icon(Icons.edit, color: AppStyle.lightBlue,),
                                  title: Text("Check section title", style: Theme.of(context).primaryTextTheme.bodyMedium,)
                              ),
                              ListTile(
                                  leading: Icon(Icons.add_circle_outlined, color: AppStyle.lightBlue,),
                                  title: Text("Add new section", style: Theme.of(context).primaryTextTheme.bodyMedium,)
                              ),
                              ListTile(
                                  leading: Icon(Icons.cancel, color: AppStyle.lightBlue,),
                                  title: Text("Delete section", style: Theme.of(context).primaryTextTheme.bodyMedium,)
                              )
                            ],
                          );
                        }
                    );
                  },
                ),
              ),
            )
          ],
        ),
        tilePadding: EdgeInsets.only(left: 8, right: 16),
        // collapsedShape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20)
        // ),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20)
        // ),
        backgroundColor: AppStyle.darkGrey,
        collapsedBackgroundColor: AppStyle.darkGrey,
        controlAffinity: ListTileControlAffinity.platform,
        leading: Icon(Icons.arrow_drop_down_rounded, size: 48, color: Colors.white,),
        title: Text(
          this.widget.title,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
        children: this.widget.children
      ),
    );
  }
}