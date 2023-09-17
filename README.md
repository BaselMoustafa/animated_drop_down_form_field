## Animated_Drop_Down_Form_Field
This package provides awesome drop down buttons with built-in and customizable animation and many attributes to create professional user interface. 

>I have already made a video to explain all details of this package on [Youtube](https://youtu.be/YE_FYQ8Up8s)
## Usage
This package provides many attributes to give  you the ability to create fully customized DropDownFormField.
So to cover all of them let's break them down into __*5 Categories :*__ 
___
####1- Requierd Attributes:
There is only one requierd attribute which called items, And these items are list of widgets will be displayed to the user.
```Dart
    AnimatedDropDownFormFormField(
        items:[
            Text("Item 1"),
            Text("Item 2"),
            Text("Item 3"),
            Text("Item 4"),
        ],
    );
```
___
####2- Button  Attributes:
These attributes give you the ability to control the button widget and they are __*5 attributes :*__
* ##### buttonDecoration: 
    It's a BoxDecoration object to fully control the button decoration.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        buttonDecoration:BoxDecoration(color:Colors.blueAccent,),
    );
    ```
* ##### buttonPadding:
    To provide some padding from edges to the content of button.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        buttonPadding: EdgeInsets.all(20),
    );
    ```
* ##### placeHolder:
    It's a widget displayed in the button if the user didn't select any item yet.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        placeHolder: Text("No Data"),
    );
    ```
* ##### actionWidget:
    This is the icon (widget) which displayed on the end of the dropDownButton.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        actionWidget: Icon(Icons.arrow_drop_down),
    );
    ```
* ##### onTapButton:
    It's a void call back and will be executed when the user tap the button.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        onTapButton:(){

            //Will be excuted when the user tap the button 
        },
    );
    ```

___
####3- Drop Down List Attributes:
These attributes designed to control the drop down list, They are __*9 attributes*__, So let's figure out each one of them...
* ##### listHeight: 
    To control the height of the dropDownList.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        listHeight: 150,
    );
    ```
* ##### listBackgroundDecoration:
    This is a BoxDecoration object to control the list decoration.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        listBackgroundDecoration: BoxDecoration(color:Colors.blueAccent,),
    );
    ```
* ##### listPadding:
    Apply padding to list content.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        listPadding: EdgeInsets.all(20),
    );
    ```
* ##### listScrollPhysics:
    Control the type of scrolling physics at drop down list
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        listScrollPhysics: BouncingScrollPhysics(),
    );
    ```
* ##### separatorWigdet:
    It's a widget appears between the items inside the list.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        separatorWigdet:SizedBox(height: 15),
    );
    ```
* ##### selectedItemIcon: 
    It's the icon (widget)  which appears next to the selected item at the list. 
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        selectedItemIcon:Icon(Icons.done_rounded),
    );
    ```
* ##### onChangeSelectedIndex:
    It's a function gives you the currently selected item index at items list and will be executed when the user changes the selected item
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        onChangeSelectedIndex: (int index){
            print(" Item At Index ${index} Is Currently Selected");
        },
    );
    ```
* ##### onChangeListState:
    This is also a function gives you the current state of the list (Closed / Opened) and will be executed when the list state changes
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        onChangeListState: (bool listIsOpened){
            print("The Drop Down List Is Currently ${listIsOpened?"Opened":"Closed"}");
        },
    );
    ```
* ##### dropDownAnimationParameters:
    This attribute gives you the abillity to control the opening and closing animation of the drop down list can take an object from one out of two classes:
    * SizingDropDownAnimationParameters.
    * ScalingDropDownAnimationParameters.
    
    At both of them you can control:
     * Duration (Duration of list opening)
     * Curve (Animation curve of list opening)
     * Reverse duration (Duration of list closure)
     * ReverseCurve (Animation curve of list closure)
  
    But the difference between them is that:
    * At scaling you can control the __*centerOfScaling*__ attribute which is AlignmentGeometry object to control from which point the scaling will start and stop.
        ```Dart
        AnimatedDropDownFormFormField(
            items:_items,
            dropDownAnimationParameters: ScalingDropDownAnimationParameters(
                centerOfScaling:Alignment.topCenter,
                reverseDuration:Duration(seconds:2),
                reverseCurve:Curves.linear,
            ),
        );
        ```
    * On the other hand at sizing you can control the __*axis*__ of sizing (can be horizontal or vertical)
        ```Dart
        AnimatedDropDownFormFormField(
            items:_items,
            dropDownAnimationParameters:SizingDropDownAnimationParameters(
                axis:Axis.vertical,
                duration:Duration(seconds:2),
                curve:Curves.linear,
            ),
        );
        ```
___

####4- General  Attributes:
we have __*3 Attributes*__ at this category.
* ##### defultTextStyle : 
    This TextStyle object will be applied on any Text doesn't has style
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        defultTextStyle: TextStyle(color:Colors.grey),
    );
    ```
* ##### distanceBetweenListAndButton: 
    Here you can specify  the distance between the button and the dropDown list
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        distanceBetweenListAndButton: 10,
    );
    ```
* ##### controller:
    This requires object from type AnimatedDropDownFormFieldController.
    ```Dart
    AnimatedDropDownFormFieldController _controller= AnimatedDropDownFormFieldController();
    AnimatedDropDownFormFormField(
        items:_items,
        controller: _controller,
    );
    ```
    This controller provides 3 control functions on the AnimatedDropDownFormField widget:
    1. Open list programmatically
        ```Dart
        ElevatedButton(
            onPressed: (){
                _controller.openList();
            }, 
            child: const Text("Open The List"),
        );
        ```
    2. Close list programmatically
        ```Dart
        ElevatedButton(
            onPressed: (){
                _controller.closeList();
            }, 
            child: const Text("Close The List"),
        );
        ```
    3. Validate the user input
        ```Dart
        ElevatedButton(
            onPressed: (){
                _controller.validate();
            }, 
            child: const Text("Validate Input"),
        );
        ```
___
####5- Error  Attributes:
This category also contains __*3 Attributes*__ and they are responsible for handling the not valid input state from user and we have:
* #### errorWidget : 
    It's a widget displayed below the button if the validation failed
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        errorWidget: Text("Not Valid Input"),
    );
    ```
* #### errorTextStyle: 
    Any text inside the errorWidget has no TextStyle will take this textStyle
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        errorTextStyle: TextStyle(color:Colors.red),
    );
    ```
* #### errorBorder: 
    It's a Border object and will rounded the button if the validate method called and the input was not valid.
    ```Dart
    AnimatedDropDownFormFormField(
        items:_items,
        errorBorder: Border.all(color:Colors.red),
    );
    ```
___

