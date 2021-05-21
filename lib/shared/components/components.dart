import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(BuildContext context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish({context, widget}) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);


Widget defaultToast({String text, ToastColor color}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: setToastColor(color),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastColor { SUCCESS, ERROR, WARNING }

Color setToastColor(ToastColor color) {
  Color s;
  if (color == ToastColor.ERROR) {
    s = Colors.red;
  } else if (color == ToastColor.SUCCESS) {
    s = Colors.green;
  } else if (color == ToastColor.WARNING) {
    s = Colors.amber;
  }
  return s;
}


Widget drfaultButtom(
    {@required String text,
      @required function,
      double fontSize,
      Color color = Colors.white,
      Color btncolor ,
      double width=double.infinity,

      icon}) =>
    Container(
        width: width,
        child: ElevatedButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: color),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btncolor)),
        ));

Widget defaultForm(
    {@required String hintText, @required icon, controller, validator,bool obs=false,txtType,onChanged}) =>
    TextFormField(
      onChanged: onChanged,
      keyboardType:txtType,
      obscureText: obs,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        isDense: true, // important line
        contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(

        ),
        hintText: hintText,
      ),
    );
Widget defaultEditForm(
    {@required String hintText, @required icon, controller, validator,bool obs=false,txtType}) =>
    TextFormField(
      keyboardType:txtType,
      obscureText: obs,
      controller: controller,
      validator: validator,
      decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: hintText),
    );

Widget defaultListItem(article,context){
  return  Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(fit: BoxFit.fill,
                  image: NetworkImage('${article['urlToImage']}',)
              )
          ),

        ),
      ),
      Expanded(
        child: Container(
          width: 120,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Text('${article['title']}',style: Theme.of(context).textTheme.bodyText1,maxLines: 2,overflow: TextOverflow.ellipsis,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('${article['publishedAt']}',style: Theme.of(context).textTheme.bodyText2,)),
                  Expanded(child: Text('${article['author']}' ??'dd',style: Theme.of(context).textTheme.bodyText2,)),
                ],
              )

            ],
          ),
        ),
      )
    ],
  );
}
Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => defaultListItem(list[index], context),
        separatorBuilder: (context, index) =>Container(),
        itemCount: 10,),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

