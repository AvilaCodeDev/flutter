import 'package:flutter/material.dart';

class MessageFielddBox extends StatelessWidget {
  const MessageFielddBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();
    
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide( color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );
  
  final inputDecoration = InputDecoration(
        hintText: "End your message with a ??",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text;
            print('button $textValue');
            // textController.clear();
          },
        )
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        print('Submited');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}