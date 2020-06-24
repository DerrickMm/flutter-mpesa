# flutter mpesa

Flutter package for mpesa



* This is a package that helps you implement the daraja API by Safaricom into your flutter applications.
* Currently only supports STK push. 
* Please pay keen attention to the `password` property of the `Request` object.
* Your `password` is the result of `base64.encode(Shortcode+Passkey+Timestamp)`


## Getting Started

* **Depend on it**

Add this to your package's pubspec.yaml file:


```
dependencies:
  fluttermpesa: ^0.0.1 
  ```
* **Install it**

You can install packages from the command line:

with pub:


`$ pub get`

with Flutter:


`$ flutter pub get`

Alternatively, your editor might support pub get or flutter pub get. Check the docs for your editor to learn more.

* **Import it**

Now in your Dart code, you can use:


```
import 'package:fluttermpesa/fluttermpesa.dart';
  
```