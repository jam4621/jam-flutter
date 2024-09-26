import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final FocusNode focusNode;
  final List itemsValue;
  final String label;
  static bool dropDown = false;

  const DropdownWidget({Key key, this.focusNode, this.itemsValue, this.label})
      : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  OverlayEntry _overlayEntry;
  LayerLink _layerLink = LayerLink();
  TextEditingController textDropdownController = new TextEditingController();
  @override
  void initState() {
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height),
                child: Material(
                  elevation: 4.0,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: widget.itemsValue.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(widget.itemsValue[index].toString()),
                          onTap: () {
                            textDropdownController.text =
                                widget.itemsValue[index].toString();
                            widget.focusNode.unfocus();
                            setState(() {
                              DropdownWidget.dropDown = !DropdownWidget.dropDown;
                            });
                          },
                        );
                      }),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.focusNode.hasFocus) {
      DropdownWidget.dropDown =false;
    }
    return CompositedTransformTarget(
      link: this._layerLink,
      child: SizedBox(
        height: 40,
        child: Center(
          child: TextFormField(
            controller: textDropdownController,
            readOnly: true,
            focusNode: widget.focusNode,
            onTap: () {
              if (widget.focusNode.hasFocus) {
                widget.focusNode.unfocus();
              }
              setState(() {
                DropdownWidget.dropDown = !DropdownWidget.dropDown;
              });
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                hintText: widget.label,
                suffixIcon: DropdownWidget.dropDown
                    ? Icon(
                        Icons.keyboard_arrow_up,
                        size: 25,
                      )
                    : Icon(
                        Icons.keyboard_arrow_down,
                        size: 25,
                      ),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
