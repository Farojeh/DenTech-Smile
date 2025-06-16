import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/form_validators.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final int maxline;
  final void Function(String?)? onsaved;
  final void Function(String)? onChanged;
  final InputBorder? inputborder;
  final Widget? sufixicon;
  final Widget? prefixIcon;
  final Color? backgroundcolor;
  final Color? hintcolor;
  final double? hintsize;
  final bool? obscureText;
  //final String? Function(String?)? validator;
  final bool? isname ;
  final bool? isemail ;
  final bool? ispass ;
  final bool? iscoupon ;
  final bool? isnumber ;
  final double? height ;
  final bool isEnglish ;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxline = 1,
      this.onsaved,
      this.onChanged,
      this.inputborder,
      this.sufixicon,
      this.prefixIcon,
      this.backgroundcolor,
      this.hintcolor,
      this.hintsize,
      this.obscureText, this.isname, this.isemail, this.ispass, this.iscoupon, this.height, this.isnumber, required this.isEnglish});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool pv = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
        height:widget.height??null,
        width: MediaQuery.of(context).size.width*0.865,
        child: TextFormField(
          obscureText: widget.obscureText != null ? pv : false,
          onChanged: widget.onChanged,
          onSaved: widget.onsaved,
          validator:(data){
            if(widget.isname!= null && widget.isname == true){
              return FormValidators().userNameValidator(data);
            }else if(widget.isemail!= null && widget.isemail == true){
               return FormValidators().emailValidator(data);
            }else if(widget.ispass!= null && widget.ispass == true){
              return FormValidators().strongPasswordValidator(data);
            }else if(widget.iscoupon!= null && widget.iscoupon == true){
              return validat(data);
            }else if(widget.isnumber!= null && widget.isnumber == true){
              return FormValidators().phoneNumberValidator(data);
            }
            else {
              return null ;
            }
          },
          maxLines: widget.maxline,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 5),
              helperText: " ",
              helperStyle: TextStyle(fontSize: 5),
              filled: true,
              fillColor: widget.backgroundcolor,
              hintText: widget.hint,
              hintStyle: textstyle(),
              border: widget.inputborder ?? buildborder(Colors.black26, 15),
              focusedBorder:
                  widget.inputborder ?? buildborder(Colors.black26, 15),
              enabledBorder:
                  widget.inputborder ?? buildborder(Colors.black26, 15),
              suffixIcon: widget.obscureText != null
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          pv = !pv;
                        });
                      },
                      icon: Padding(
                        padding:widget.isEnglish?const EdgeInsets.only(right: 8) :const EdgeInsets.only(left: 8),
                        child: Icon(pv ? Icons.visibility_off : Icons.visibility , color: Colors.black87,),
                      ))
                  : widget.sufixicon,
              prefixIcon: widget.prefixIcon != null
                  ? SizedBox(
                      width: 50,
                      child: Padding(
                        padding:widget.isEnglish?const EdgeInsets.only( left: 15) :const EdgeInsets.only( right: 15),
                        child:  widget.prefixIcon!
                      ),
                    )
                  : null),
        ),
      ),
    );
  }

  String? validat(value) {
    if (value?.isEmpty ?? true) {
      return "Field is required";
    }
    return null;
  }

  TextStyle textstyle() {
    return TextStyle(
        color: widget.hintcolor ?? const Color.fromARGB(255, 170, 152, 61),
        fontSize: widget.hintsize ?? 21,
        wordSpacing: 2.5,
        letterSpacing: 0.5,
        fontFamily: Static.afacadfont,
        fontWeight: FontWeight.w400
        );
  }

  OutlineInputBorder buildborder(Color color, double red) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(red),
        borderSide: BorderSide(color: color, width: 0.4));
  }
}
