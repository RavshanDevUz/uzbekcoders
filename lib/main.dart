import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

 class MyHomePage extends StatefulWidget {
   @override
   _MyHomePageState createState() => _MyHomePageState();
 }
 
 class _MyHomePageState extends State<MyHomePage> {

  WebViewController _controller;

  _goBack()async{
    if(await _controller.canGoBack())
      {
        await _controller.goBack();
      }
  }

  _goForward()async{
    if(await _controller.canGoForward())
    {
      await _controller.goForward();
    }
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(

       appBar: AppBar(
         title: Text('Web View flutter'),
         actions: [
           IconButton(icon: Icon(Icons.arrow_back),onPressed: _goBack,),
           IconButton(icon: Icon(Icons.arrow_forward),onPressed: _goForward,),
         ],
       ),
       body: SafeArea(
         child: WebView(
           initialUrl: 'https://uzbekcoders.uz',
           javascriptMode: JavascriptMode.unrestricted,
           onWebViewCreated: (WebViewController webviewcontroller){
             _controller =webviewcontroller;
           },
         )
       ),
     );
   }
 }
 





















