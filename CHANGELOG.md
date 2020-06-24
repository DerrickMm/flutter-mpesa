## [0.0.1] - 2020-06-24

* This is a package that helps you implement the Safaricom daraja API in your flutter applications.
* Currently only supports STK push. 
* Please pay keen attention to the `password` property of the `Request` object.
* Your `password` is the result of `base64.encode(Shortcode+Passkey+Timestamp)`
