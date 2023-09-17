import 'package:animated_drop_down_form_field/animated_drop_down_form_field.dart';
import 'package:example/Example/dummy_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<AnimatedDropDownFormFieldController>_controllers=[];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 2; i++) {
      _controllers.add(AnimatedDropDownFormFieldController());
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < _controllers.length; i++) {
      _controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle:const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.blueAccent,title:const Text("Package Example"),
      ),
      body: ListView.separated(
        padding:const EdgeInsets.all(10),
        itemBuilder: _itemBuilder, 
        separatorBuilder: (context,index)=>const SizedBox(height: 20,), 
        itemCount: 10,
        ),
    );
  }

  Widget? _itemBuilder(context,index){
    if(index==1){
      return _validationButton();
    }else if(index==2){
      return Row(
        children: [
          for(int i=0;i<2;i++)
          _getDropButtonButton(i)
        ],
      );
    }else{
      return const DummyListItemWidget();
    }
  }


  Widget _validationButton() {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          for (var i = 0; i < _controllers.length; i++) {
            _controllers[i].validate();
          }
        }, 
        child: const Text("Validate Input"),
      ),
    );
  }

  Widget _getDropButtonButton(int index) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedDropDownFormField(
            items:_getItems,
            listHeight: 200,
            listScrollPhysics: const BouncingScrollPhysics(),
            controller: _controllers[index],
            placeHolder: index==0?const Row(children: [Icon(Icons.warning,color: Colors.white,),Text("No Data",style: TextStyle(color: Colors.white))]):const Text("Empty",style: TextStyle(color: Colors.white)),
            buttonPadding:const EdgeInsets.all(10),
            actionWidget: index==0?const Icon(Icons.arrow_downward_rounded,color: Colors.white,):const Icon(Icons.arrow_drop_down_circle_sharp,color: Colors.white,),
            buttonDecoration: _buttonDecoration(index),
            defultTextStyle:const TextStyle(fontSize: 16,color: Colors.white),
            listPadding:const EdgeInsets.all(10),
            selectedItemIcon: Icon(index==0?Icons.check_circle:Icons.done_rounded,color: Colors.white,),
            listBackgroundDecoration: _listDecoration(index),
            dropDownAnimationParameters: index==0?const ScalingDropDownAnimationParameters(centerOfScaling: Alignment.bottomCenter,curve: Curves.ease,reverseCurve: Curves.easeOut):const SizingDropDownAnimationParameters(axis: Axis.vertical,curve: Curves.ease,reverseCurve: Curves.ease),
            onTapButton: () {
              if(index==0){
                _controllers[1].closeList();
              }else{
                _controllers[0].closeList();
              }
            }
          ),
        ),
      ),
    );
  }

  BoxDecoration _listDecoration(int index) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: index==1? Colors.black:null,
      gradient:index==0? _getLinearGradient():null,
      boxShadow: [BoxShadow(
        color:index==0?Colors.blueAccent:Colors.blueGrey,blurRadius: 20)]
    );
  }

  BoxDecoration _buttonDecoration(int index) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: index==1? Colors.black:null,
        gradient:index==0? _getLinearGradient():null,
      );
  }

  LinearGradient _getLinearGradient() {
    return const LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
      colors: [Colors.blueAccent,Colors.deepPurpleAccent]
    );
  }

  List<Widget> get _getItems {
    List<Widget>toReturn=[];
    for (var i = 0; i < 20; i++) {
      toReturn.add( Padding(padding:const EdgeInsets.symmetric(vertical: 2.5),child:Text("Item ${i+1}",)));
    }
    return toReturn;
  }

}