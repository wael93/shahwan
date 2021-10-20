// // Postman Echo is service you can use to test your REST clients and make sample API calls.
// // It provides endpoints for `GET`, `POST`, `PUT`, various auth mechanisms and other utility
// // endpoints.
// //
// // The documentation for the endpoints as well as example responses can be found at
// // [https://postman-echo.com](https://postman-echo.com/?source=echo-collection-app-onboarding)
// // To parse this JSON data, do
// //
// //     final data = dataFromMap(jsonString);
// //     final basicAuth = basicAuthFromMap(jsonString);
// //     final oAuth10VerifySignature = oAuth10VerifySignatureFromMap(jsonString);
// //     final hawkAuth = hawkAuthFromMap(jsonString);
// //     final setCookies = setCookiesFromMap(jsonString);
// //     final getCookies = getCookiesFromMap(jsonString);
// //     final deleteCookies = deleteCookiesFromMap(jsonString);
// //     final requestHeaders = requestHeadersFromMap(jsonString);
// //     final responseHeaders = responseHeadersFromMap(jsonString);
// //     final responseStatusCode = responseStatusCodeFromMap(jsonString);
// //     final delayResponse = delayResponseFromMap(jsonString);
// //     final timestampValidity = timestampValidityFromMap(jsonString);
// //     final transformCollectionFromFormatV1ToV2 = transformCollectionFromFormatV1ToV2FromMap(jsonString);
// //     final transformCollectionFromFormatV2ToV1 = transformCollectionFromFormatV2ToV1FromMap(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// Data dataFromMap(String str) => Data.fromMap(json.decode(str));
//
// String dataToMap(Data data) => json.encode(data.toMap());
//
// BasicAuth basicAuthFromMap(String str) => BasicAuth.fromMap(json.decode(str));
//
// String basicAuthToMap(BasicAuth data) => json.encode(data.toMap());
//
// OAuth10VerifySignature oAuth10VerifySignatureFromMap(String str) => OAuth10VerifySignature.fromMap(json.decode(str));
//
// String oAuth10VerifySignatureToMap(OAuth10VerifySignature data) => json.encode(data.toMap());
//
// HawkAuth hawkAuthFromMap(String str) => HawkAuth.fromMap(json.decode(str));
//
// String hawkAuthToMap(HawkAuth data) => json.encode(data.toMap());
//
// SetCookies setCookiesFromMap(String str) => SetCookies.fromMap(json.decode(str));
//
// String setCookiesToMap(SetCookies data) => json.encode(data.toMap());
//
// GetCookies getCookiesFromMap(String str) => GetCookies.fromMap(json.decode(str));
//
// String getCookiesToMap(GetCookies data) => json.encode(data.toMap());
//
// DeleteCookies deleteCookiesFromMap(String str) => DeleteCookies.fromMap(json.decode(str));
//
// String deleteCookiesToMap(DeleteCookies data) => json.encode(data.toMap());
//
// RequestHeaders requestHeadersFromMap(String str) => RequestHeaders.fromMap(json.decode(str));
//
// String requestHeadersToMap(RequestHeaders data) => json.encode(data.toMap());
//
// ResponseHeaders responseHeadersFromMap(String str) => ResponseHeaders.fromMap(json.decode(str));
//
// String responseHeadersToMap(ResponseHeaders data) => json.encode(data.toMap());
//
// ResponseStatusCode responseStatusCodeFromMap(String str) => ResponseStatusCode.fromMap(json.decode(str));
//
// String responseStatusCodeToMap(ResponseStatusCode data) => json.encode(data.toMap());
//
// DelayResponse delayResponseFromMap(String str) => DelayResponse.fromMap(json.decode(str));
//
// String delayResponseToMap(DelayResponse data) => json.encode(data.toMap());
//
// TimestampValidity timestampValidityFromMap(String str) => TimestampValidity.fromMap(json.decode(str));
//
// String timestampValidityToMap(TimestampValidity data) => json.encode(data.toMap());
//
// TransformCollectionFromFormatV1ToV2 transformCollectionFromFormatV1ToV2FromMap(String str) => TransformCollectionFromFormatV1ToV2.fromMap(json.decode(str));
//
// String transformCollectionFromFormatV1ToV2ToMap(TransformCollectionFromFormatV1ToV2 data) => json.encode(data.toMap());
//
// TransformCollectionFromFormatV2ToV1 transformCollectionFromFormatV2ToV1FromMap(String str) => TransformCollectionFromFormatV2ToV1.fromMap(json.decode(str));
//
// String transformCollectionFromFormatV2ToV1ToMap(TransformCollectionFromFormatV2ToV1 data) => json.encode(data.toMap());
//
// /**
//  * DigestAuth Success
//  *
//  * GET https://postman-echo.com/digest-auth
//  *
//  * This endpoint sends a hashed Digest Authorization header to gain access to a valid `200
//  * Ok` response code. In Postman, it uses the stored [global
//  *
//  * variables](https://www.getpostman.com/docs/environments#gloval-variables?source=echo-collection-app-onboarding),
//  * `echo_digest_realm` and `echo_digest_nonce`, to generate the hashed authorisation
//  * header.
//  *
//  * Within Postman, for this request to successfully authenticate, running the previous
//  * request "DigestAuth Request" stores the relevant information within the global variables.
//  */
// class Data {
//   Data({
//     @required this.data,
//     @required this.message,
//     @required this.result,
//   });
//
//   final List<Datum> data;
//   final String message;
//   final String result;
//
//   Data copyWith({
//     List<Datum> data,
//     String message,
//     String result,
//   }) =>
//       Data(
//         data: data ?? this.data,
//         message: message ?? this.message,
//         result: result ?? this.result,
//       );
//
//   factory Data.fromMap(Map<String, dynamic> json) => Data(
//     data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
//     message: json["message"] == null ? null : json["message"],
//     result: json["result"] == null ? null : json["result"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
//     "message": message == null ? null : message,
//     "result": result == null ? null : result,
//   };
// }
//
// class Datum {
//   Datum({
//     @required this.backPadding,
//     @required this.clothColor,
//     @required this.clothtype,
//     @required this.deliveryPeriod,
//     @required this.ironColor,
//     @required this.materialUsed,
//     @required this.noteProduct,
//     @required this.numberPillows,
//     @required this.numberSeats,
//     @required this.productFeatures,
//     @required this.seatPadding,
//     @required this.woodColor,
//     @required this.woodtype,
//     @required this.countryId,
//     @required this.defaultCode,
//     @required this.id,
//     @required this.numberPieces,
//     @required this.productQty,
//     @required this.productTmplId,
//   });
//
//   final String backPadding;
//   final bool clothColor;
//   final bool clothtype;
//   final int deliveryPeriod;
//   final String ironColor;
//   final bool materialUsed;
//   final bool noteProduct;
//   final int numberPillows;
//   final int numberSeats;
//   final String productFeatures;
//   final String seatPadding;
//   final String woodColor;
//   final String woodtype;
//   final bool countryId;
//   final String defaultCode;
//   final int id;
//   final int numberPieces;
//   final List<ProductQty> productQty;
//   final List<dynamic> productTmplId;
//
//   Datum copyWith({
//     String backPadding,
//     bool clothColor,
//     bool clothtype,
//     int deliveryPeriod,
//     String ironColor,
//     bool materialUsed,
//     bool noteProduct,
//     int numberPillows,
//     int numberSeats,
//     String productFeatures,
//     String seatPadding,
//     String woodColor,
//     String woodtype,
//     bool countryId,
//     String defaultCode,
//     int id,
//     int numberPieces,
//     List<ProductQty> productQty,
//     List<dynamic> productTmplId,
//   }) =>
//       Datum(
//         backPadding: backPadding ?? this.backPadding,
//         clothColor: clothColor ?? this.clothColor,
//         clothtype: clothtype ?? this.clothtype,
//         deliveryPeriod: deliveryPeriod ?? this.deliveryPeriod,
//         ironColor: ironColor ?? this.ironColor,
//         materialUsed: materialUsed ?? this.materialUsed,
//         noteProduct: noteProduct ?? this.noteProduct,
//         numberPillows: numberPillows ?? this.numberPillows,
//         numberSeats: numberSeats ?? this.numberSeats,
//         productFeatures: productFeatures ?? this.productFeatures,
//         seatPadding: seatPadding ?? this.seatPadding,
//         woodColor: woodColor ?? this.woodColor,
//         woodtype: woodtype ?? this.woodtype,
//         countryId: countryId ?? this.countryId,
//         defaultCode: defaultCode ?? this.defaultCode,
//         id: id ?? this.id,
//         numberPieces: numberPieces ?? this.numberPieces,
//         productQty: productQty ?? this.productQty,
//         productTmplId: productTmplId ?? this.productTmplId,
//       );
//
//   factory Datum.fromMap(Map<String, dynamic> json) => Datum(
//     backPadding: json["BackPadding"] == null ? null : json["BackPadding"],
//     clothColor: json["ClothColor"] == null ? null : json["ClothColor"],
//     clothtype: json["Clothtype"] == null ? null : json["Clothtype"],
//     deliveryPeriod: json["DeliveryPeriod"] == null ? null : json["DeliveryPeriod"],
//     ironColor: json["IronColor"] == null ? null : json["IronColor"],
//     materialUsed: json["MaterialUsed"] == null ? null : json["MaterialUsed"],
//     noteProduct: json["NoteProduct"] == null ? null : json["NoteProduct"],
//     numberPillows: json["NumberPillows"] == null ? null : json["NumberPillows"],
//     numberSeats: json["NumberSeats"] == null ? null : json["NumberSeats"],
//     productFeatures: json["ProductFeatures"] == null ? null : json["ProductFeatures"],
//     seatPadding: json["SeatPadding"] == null ? null : json["SeatPadding"],
//     woodColor: json["WoodColor"] == null ? null : json["WoodColor"],
//     woodtype: json["Woodtype"] == null ? null : json["Woodtype"],
//     countryId: json["country_id"] == null ? null : json["country_id"],
//     defaultCode: json["default_code"] == null ? null : json["default_code"],
//     id: json["id"] == null ? null : json["id"],
//     numberPieces: json["number_pieces"] == null ? null : json["number_pieces"],
//     productQty: json["product_qty"] == null ? null : List<ProductQty>.from(json["product_qty"].map((x) => ProductQty.fromMap(x))),
//     productTmplId: json["product_tmpl_id"] == null ? null : List<dynamic>.from(json["product_tmpl_id"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "BackPadding": backPadding == null ? null : backPadding,
//     "ClothColor": clothColor == null ? null : clothColor,
//     "Clothtype": clothtype == null ? null : clothtype,
//     "DeliveryPeriod": deliveryPeriod == null ? null : deliveryPeriod,
//     "IronColor": ironColor == null ? null : ironColor,
//     "MaterialUsed": materialUsed == null ? null : materialUsed,
//     "NoteProduct": noteProduct == null ? null : noteProduct,
//     "NumberPillows": numberPillows == null ? null : numberPillows,
//     "NumberSeats": numberSeats == null ? null : numberSeats,
//     "ProductFeatures": productFeatures == null ? null : productFeatures,
//     "SeatPadding": seatPadding == null ? null : seatPadding,
//     "WoodColor": woodColor == null ? null : woodColor,
//     "Woodtype": woodtype == null ? null : woodtype,
//     "country_id": countryId == null ? null : countryId,
//     "default_code": defaultCode == null ? null : defaultCode,
//     "id": id == null ? null : id,
//     "number_pieces": numberPieces == null ? null : numberPieces,
//     "product_qty": productQty == null ? null : List<dynamic>.from(productQty.map((x) => x.toMap())),
//     "product_tmpl_id": productTmplId == null ? null : List<dynamic>.from(productTmplId.map((x) => x)),
//   };
// }
//
// class ProductQty {
//   ProductQty({
//     @required this.qty,
//     @required this.qtyOnHand,
//     @required this.warehouseId,
//   });
//
//   final int qty;
//   final int qtyOnHand;
//   final String warehouseId;
//
//   ProductQty copyWith({
//     int qty,
//     int qtyOnHand,
//     String warehouseId,
//   }) =>
//       ProductQty(
//         qty: qty ?? this.qty,
//         qtyOnHand: qtyOnHand ?? this.qtyOnHand,
//         warehouseId: warehouseId ?? this.warehouseId,
//       );
//
//   factory ProductQty.fromMap(Map<String, dynamic> json) => ProductQty(
//     qty: json["qty"] == null ? null : json["qty"],
//     qtyOnHand: json["qty_onHand"] == null ? null : json["qty_onHand"],
//     warehouseId: json["warehouse_id"] == null ? null : json["warehouse_id"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "qty": qty == null ? null : qty,
//     "qty_onHand": qtyOnHand == null ? null : qtyOnHand,
//     "warehouse_id": warehouseId == null ? null : warehouseId,
//   };
// }
//
// /**
//  * Basic Auth
//  *
//  * GET https://postman-echo.com/basic-auth
//  *
//  * This endpoint simulates a **basic-auth** protected endpoint.
//  * The endpoint accepts a default username and password and returns a status code of `200
//  * ok` only if the same is provided.
//  * Otherwise it will return a status code `401 unauthorized`.
//  *
//  * > Username: `postman`
//  * >
//  * > Password: `password`
//  *
//  * To use this endpoint, send a request with the header `Authorization: Basic
//  * cG9zdG1hbjpwYXNzd29yZA==`.
//  * The cryptic latter half of the header value is a base64 encoded concatenation of the
//  * default username and password.
//  * Using Postman, to send this request, you can simply fill in the username and password in
//  * the "Authorization" tab and Postman will do the rest for you.
//  *
//  * To know more about basic authentication, refer to the [Basic Access
//  * Authentication](https://en.wikipedia.org/wiki/Basic_access_authentication) wikipedia
//  * article.
//  * The article on [authentication
//  *
//  * helpers](https://www.getpostman.com/docs/helpers#basic-auth?source=echo-collection-app-onboarding)
//  * elaborates how to use the same within the Postman app.
//  */
// class BasicAuth {
//   BasicAuth({
//     @required this.authenticated,
//   });
//
//   final bool authenticated;
//
//   BasicAuth copyWith({
//     bool authenticated,
//   }) =>
//       BasicAuth(
//         authenticated: authenticated ?? this.authenticated,
//       );
//
//   factory BasicAuth.fromMap(Map<String, dynamic> json) => BasicAuth(
//     authenticated: json["authenticated"] == null ? null : json["authenticated"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "authenticated": authenticated == null ? null : authenticated,
//   };
// }
//
// /**
//  * OAuth1.0 Verify Signature
//  *
//  * GET https://postman-echo.com/oauth1
//  *
//  * OAuth1.0a is a specification that defines a protocol that can be used by one
//  * service to access "protected" resources (endpoints) on another service. A
//  * major part of OAuth1.0 is HTTP Request Signing. This endpoint allows you to
//  * check whether the request calculation works properly in the client.
//  *
//  * The endpoint supports the HTTP ``Authorization`` header. In case the signature
//  * verification fails, the endpoint provides the four debug values,
//  *
//  * * ``base_uri``
//  * * ``normalized_param_string``
//  * * ``base_string``
//  * * ``signing_key``
//  *
//  * For more details about these parameters, check the [OAuth1.0a
//  * Specification](http://oauth.net/core/1.0a/)
//  *
//  * In order to use this endpoint, you can set the following values:
//  *
//  * > Consumer Key: ``RKCGzna7bv9YD57c``
//  * >
//  * > Consumer Secret: ``D+EdQ-gs$-%@2Nu7``
//  *
//  * If you are using Postman, also check the "Add params to header" and
//  * "Auto add parameters" boxes.
//  */
// class OAuth10VerifySignature {
//   OAuth10VerifySignature({
//     @required this.status,
//     @required this.message,
//     @required this.baseUri,
//     @required this.normalizedParamString,
//     @required this.baseString,
//     @required this.signingKey,
//   });
//
//   final String status;
//   final String message;
//   final String baseUri;
//   final String normalizedParamString;
//   final String baseString;
//   final String signingKey;
//
//   OAuth10VerifySignature copyWith({
//     String status,
//     String message,
//     String baseUri,
//     String normalizedParamString,
//     String baseString,
//     String signingKey,
//   }) =>
//       OAuth10VerifySignature(
//         status: status ?? this.status,
//         message: message ?? this.message,
//         baseUri: baseUri ?? this.baseUri,
//         normalizedParamString: normalizedParamString ?? this.normalizedParamString,
//         baseString: baseString ?? this.baseString,
//         signingKey: signingKey ?? this.signingKey,
//       );
//
//   factory OAuth10VerifySignature.fromMap(Map<String, dynamic> json) => OAuth10VerifySignature(
//     status: json["status"] == null ? null : json["status"],
//     message: json["message"] == null ? null : json["message"],
//     baseUri: json["base_uri"] == null ? null : json["base_uri"],
//     normalizedParamString: json["normalized_param_string"] == null ? null : json["normalized_param_string"],
//     baseString: json["base_string"] == null ? null : json["base_string"],
//     signingKey: json["signing_key"] == null ? null : json["signing_key"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "status": status == null ? null : status,
//     "message": message == null ? null : message,
//     "base_uri": baseUri == null ? null : baseUri,
//     "normalized_param_string": normalizedParamString == null ? null : normalizedParamString,
//     "base_string": baseString == null ? null : baseString,
//     "signing_key": signingKey == null ? null : signingKey,
//   };
// }
//
// /**
//  * Hawk Auth
//  *
//  * GET https://postman-echo.com/auth/hawk
//  *
//  * This endpoint is a Hawk Authentication protected endpoint. [Hawk
//  * authentication](https://github.com/hueniverse/hawk) is a widely used protocol for
//  * protecting API endpoints. One of Hawk's main goals is to enable HTTP authentication for
//  * services that do not use TLS (although it can be used in conjunction with TLS as well).
//  *
//  * In order to use this endpoint, select the "Hawk Auth" helper inside Postman, and set the
//  * following values:
//  *
//  * Hawk Auth ID: `dh37fgj492je`
//  *
//  * Hawk Auth Key: `werxhqb98rpaxn39848xrunpaw3489ruxnpa98w4rxn`
//  *
//  * Algorithm: `sha256`
//  *
//  * The rest of the values are optional, and can be left blank. Hitting send should give you
//  * a response with a status code of 200 OK.
//  */
// class HawkAuth {
//   HawkAuth({
//     @required this.status,
//     @required this.message,
//   });
//
//   final String status;
//   final String message;
//
//   HawkAuth copyWith({
//     String status,
//     String message,
//   }) =>
//       HawkAuth(
//         status: status ?? this.status,
//         message: message ?? this.message,
//       );
//
//   factory HawkAuth.fromMap(Map<String, dynamic> json) => HawkAuth(
//     status: json["status"] == null ? null : json["status"],
//     message: json["message"] == null ? null : json["message"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "status": status == null ? null : status,
//     "message": message == null ? null : message,
//   };
// }
//
// /**
//  * Set Cookies
//  *
//  * GET https://postman-echo.com/cookies/set?foo1=bar1&foo2=bar2
//  *
//  * The cookie setter endpoint accepts a list of cookies and their values as part of URL
//  * parameters of a `GET` request. These cookies are saved and can be subsequently retrieved
//  * or deleted. The response of this request returns a JSON with all cookies listed.
//  *
//  * To set your own set of cookies, simply replace the URL parameters "foo1=bar1&foo2=bar2"
//  * with your own set of key-value pairs.
//  */
// class SetCookies {
//   SetCookies({
//     @required this.cookies,
//   });
//
//   final SetCookiesCookies cookies;
//
//   SetCookies copyWith({
//     SetCookiesCookies cookies,
//   }) =>
//       SetCookies(
//         cookies: cookies ?? this.cookies,
//       );
//
//   factory SetCookies.fromMap(Map<String, dynamic> json) => SetCookies(
//     cookies: json["cookies"] == null ? null : SetCookiesCookies.fromMap(json["cookies"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "cookies": cookies == null ? null : cookies.toMap(),
//   };
// }
//
// class SetCookiesCookies {
//   SetCookiesCookies({
//     @required this.foo1,
//     @required this.foo2,
//   });
//
//   final String foo1;
//   final String foo2;
//
//   SetCookiesCookies copyWith({
//     String foo1,
//     String foo2,
//   }) =>
//       SetCookiesCookies(
//         foo1: foo1 ?? this.foo1,
//         foo2: foo2 ?? this.foo2,
//       );
//
//   factory SetCookiesCookies.fromMap(Map<String, dynamic> json) => SetCookiesCookies(
//     foo1: json["foo1"] == null ? null : json["foo1"],
//     foo2: json["foo2"] == null ? null : json["foo2"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "foo1": foo1 == null ? null : foo1,
//     "foo2": foo2 == null ? null : foo2,
//   };
// }
//
// /**
//  * Get Cookies
//  *
//  * GET https://postman-echo.com/cookies
//  *
//  * Use this endpoint to get a list of all cookies that are stored with respect to this
//  * domain. Whatever key-value pairs that has been previously set by calling the "Set
//  * Cookies" endpoint, will be returned as response JSON.
//  */
// class GetCookies {
//   GetCookies({
//     @required this.cookies,
//   });
//
//   final GetCookiesCookies cookies;
//
//   GetCookies copyWith({
//     GetCookiesCookies cookies,
//   }) =>
//       GetCookies(
//         cookies: cookies ?? this.cookies,
//       );
//
//   factory GetCookies.fromMap(Map<String, dynamic> json) => GetCookies(
//     cookies: json["cookies"] == null ? null : GetCookiesCookies.fromMap(json["cookies"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "cookies": cookies == null ? null : cookies.toMap(),
//   };
// }
//
// class GetCookiesCookies {
//   GetCookiesCookies({
//     @required this.foo2,
//   });
//
//   final String foo2;
//
//   GetCookiesCookies copyWith({
//     String foo2,
//   }) =>
//       GetCookiesCookies(
//         foo2: foo2 ?? this.foo2,
//       );
//
//   factory GetCookiesCookies.fromMap(Map<String, dynamic> json) => GetCookiesCookies(
//     foo2: json["foo2"] == null ? null : json["foo2"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "foo2": foo2 == null ? null : foo2,
//   };
// }
//
// /**
//  * Delete Cookies
//  *
//  * GET https://postman-echo.com/cookies/delete?foo1&foo2
//  *
//  * One or more cookies that has been set for this domain can be deleted by providing the
//  * cookie names as part of the URL parameter. The response of this request is a JSON
//  * containing the list of currently set cookies.
//  */
// class DeleteCookies {
//   DeleteCookies({
//     @required this.cookies,
//   });
//
//   final GetCookiesCookies cookies;
//
//   DeleteCookies copyWith({
//     GetCookiesCookies cookies,
//   }) =>
//       DeleteCookies(
//         cookies: cookies ?? this.cookies,
//       );
//
//   factory DeleteCookies.fromMap(Map<String, dynamic> json) => DeleteCookies(
//     cookies: json["cookies"] == null ? null : GetCookiesCookies.fromMap(json["cookies"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "cookies": cookies == null ? null : cookies.toMap(),
//   };
// }
//
// /**
//  * Request Headers
//  *
//  * GET https://postman-echo.com/headers
//  *
//  * A `GET` request to this endpoint returns the list of all request headers as part of the
//  * response JSON.
//  * In Postman, sending your own set of headers through the [Headers
//  *
//  * tab](https://www.getpostman.com/docs/requests#headers?source=echo-collection-app-onboarding)
//  * will reveal the headers as part of the response.
//  */
// class RequestHeaders {
//   RequestHeaders({
//     @required this.headers,
//   });
//
//   final Headers headers;
//
//   RequestHeaders copyWith({
//     Headers headers,
//   }) =>
//       RequestHeaders(
//         headers: headers ?? this.headers,
//       );
//
//   factory RequestHeaders.fromMap(Map<String, dynamic> json) => RequestHeaders(
//     headers: json["headers"] == null ? null : Headers.fromMap(json["headers"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "headers": headers == null ? null : headers.toMap(),
//   };
// }
//
// class Headers {
//   Headers({
//     @required this.host,
//     @required this.accept,
//     @required this.acceptEncoding,
//     @required this.acceptLanguage,
//     @required this.cacheControl,
//     @required this.mySampleHeader,
//     @required this.postmanToken,
//     @required this.userAgent,
//     @required this.xForwardedPort,
//     @required this.xForwardedProto,
//   });
//
//   final String host;
//   final String accept;
//   final String acceptEncoding;
//   final String acceptLanguage;
//   final String cacheControl;
//   final String mySampleHeader;
//   final String postmanToken;
//   final String userAgent;
//   final String xForwardedPort;
//   final String xForwardedProto;
//
//   Headers copyWith({
//     String host,
//     String accept,
//     String acceptEncoding,
//     String acceptLanguage,
//     String cacheControl,
//     String mySampleHeader,
//     String postmanToken,
//     String userAgent,
//     String xForwardedPort,
//     String xForwardedProto,
//   }) =>
//       Headers(
//         host: host ?? this.host,
//         accept: accept ?? this.accept,
//         acceptEncoding: acceptEncoding ?? this.acceptEncoding,
//         acceptLanguage: acceptLanguage ?? this.acceptLanguage,
//         cacheControl: cacheControl ?? this.cacheControl,
//         mySampleHeader: mySampleHeader ?? this.mySampleHeader,
//         postmanToken: postmanToken ?? this.postmanToken,
//         userAgent: userAgent ?? this.userAgent,
//         xForwardedPort: xForwardedPort ?? this.xForwardedPort,
//         xForwardedProto: xForwardedProto ?? this.xForwardedProto,
//       );
//
//   factory Headers.fromMap(Map<String, dynamic> json) => Headers(
//     host: json["host"] == null ? null : json["host"],
//     accept: json["accept"] == null ? null : json["accept"],
//     acceptEncoding: json["accept-encoding"] == null ? null : json["accept-encoding"],
//     acceptLanguage: json["accept-language"] == null ? null : json["accept-language"],
//     cacheControl: json["cache-control"] == null ? null : json["cache-control"],
//     mySampleHeader: json["my-sample-header"] == null ? null : json["my-sample-header"],
//     postmanToken: json["postman-token"] == null ? null : json["postman-token"],
//     userAgent: json["user-agent"] == null ? null : json["user-agent"],
//     xForwardedPort: json["x-forwarded-port"] == null ? null : json["x-forwarded-port"],
//     xForwardedProto: json["x-forwarded-proto"] == null ? null : json["x-forwarded-proto"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "host": host == null ? null : host,
//     "accept": accept == null ? null : accept,
//     "accept-encoding": acceptEncoding == null ? null : acceptEncoding,
//     "accept-language": acceptLanguage == null ? null : acceptLanguage,
//     "cache-control": cacheControl == null ? null : cacheControl,
//     "my-sample-header": mySampleHeader == null ? null : mySampleHeader,
//     "postman-token": postmanToken == null ? null : postmanToken,
//     "user-agent": userAgent == null ? null : userAgent,
//     "x-forwarded-port": xForwardedPort == null ? null : xForwardedPort,
//     "x-forwarded-proto": xForwardedProto == null ? null : xForwardedProto,
//   };
// }
//
// /**
//  * Response Headers
//  *
//  * GET
//  * https://postman-echo.com/response-headers?Content-Type=text/html&test=response_headers
//  *
//  * This endpoint causes the server to send custom set of response headers. Providing header
//  * values as part of the URL parameters of a `GET` request to this endpoint returns the same
//  * as part of response header.
//  *
//  * To send your own set of headers, simply add or replace the the URL parameters with your
//  * own set.
//  */
// class ResponseHeaders {
//   ResponseHeaders({
//     @required this.contentType,
//     @required this.test,
//   });
//
//   final String contentType;
//   final String test;
//
//   ResponseHeaders copyWith({
//     String contentType,
//     String test,
//   }) =>
//       ResponseHeaders(
//         contentType: contentType ?? this.contentType,
//         test: test ?? this.test,
//       );
//
//   factory ResponseHeaders.fromMap(Map<String, dynamic> json) => ResponseHeaders(
//     contentType: json["Content-Type"] == null ? null : json["Content-Type"],
//     test: json["test"] == null ? null : json["test"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "Content-Type": contentType == null ? null : contentType,
//     "test": test == null ? null : test,
//   };
// }
//
// /**
//  * Response Status Code
//  *
//  * GET https://postman-echo.com/status/200
//  *
//  * This endpoint allows one to instruct the server which status code to respond with.
//  *
//  * Every response is accompanied by a status code. The status code provides a summary of the
//  * nature of response sent by the server. For example, a status code of `200` means
//  * everything is okay with the response and a code of `404` implies that the requested URL
//  * does not exist on server.
//  * A list of all valid HTTP status code can be found at the [List of Status
//  * Codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes) wikipedia article. When
//  * using Postman, the response status code is described for easy reference.
//  *
//  * Note that if an invalid status code is requested to be sent, the server returns a status
//  * code of `400 Bad Request`.
//  */
// class ResponseStatusCode {
//   ResponseStatusCode({
//     @required this.status,
//   });
//
//   final int status;
//
//   ResponseStatusCode copyWith({
//     int status,
//   }) =>
//       ResponseStatusCode(
//         status: status ?? this.status,
//       );
//
//   factory ResponseStatusCode.fromMap(Map<String, dynamic> json) => ResponseStatusCode(
//     status: json["status"] == null ? null : json["status"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "status": status == null ? null : status,
//   };
// }
//
// /**
//  * Delay Response
//  *
//  * GET https://postman-echo.com/delay/3
//  *
//  * Using this endpoint one can configure how long it takes for the server to come back with
//  * a response. Appending a number to the URL defines the time (in seconds) the server will
//  * wait before responding.
//  *
//  * Note that a maximum delay of 10 seconds is accepted by the server.
//  */
// class DelayResponse {
//   DelayResponse({
//     @required this.delay,
//   });
//
//   final String delay;
//
//   DelayResponse copyWith({
//     String delay,
//   }) =>
//       DelayResponse(
//         delay: delay ?? this.delay,
//       );
//
//   factory DelayResponse.fromMap(Map<String, dynamic> json) => DelayResponse(
//     delay: json["delay"] == null ? null : json["delay"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "delay": delay == null ? null : delay,
//   };
// }
//
// /**
//  * Timestamp validity
//  *
//  * GET https://postman-echo.com/time/valid?timestamp=2016-10-10
//  *
//  * A simple `GET` request to `/time/valid` to determine the validity of the timestamp,
//  * (current by default).
//  * This endpoint accepts `timestamp`, `locale`, `format`, and `strict` query parameters to
//  * construct the date time instance to check against.
//  *
//  * Responses are provided in JSON format, with a valid key to indicate the result. The
//  * response code is `200`.
//  *
//  * ```
//  * {
//  * valid: true/false
//  * }
//  * ```
//  */
// class TimestampValidity {
//   TimestampValidity({
//     @required this.valid,
//   });
//
//   final bool valid;
//
//   TimestampValidity copyWith({
//     bool valid,
//   }) =>
//       TimestampValidity(
//         valid: valid ?? this.valid,
//       );
//
//   factory TimestampValidity.fromMap(Map<String, dynamic> json) => TimestampValidity(
//     valid: json["valid"] == null ? null : json["valid"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "valid": valid == null ? null : valid,
//   };
// }
//
// /**
//  * Transform collection from format v1 to v2
//  *
//  * POST https://postman-echo.com/transform/collection?from=1&to=2
//  */
// class TransformCollectionFromFormatV1ToV2 {
//   TransformCollectionFromFormatV1ToV2({
//     @required this.variables,
//     @required this.info,
//     @required this.item,
//   });
//
//   final List<dynamic> variables;
//   final Info info;
//   final List<Item> item;
//
//   TransformCollectionFromFormatV1ToV2 copyWith({
//     List<dynamic> variables,
//     Info info,
//     List<Item> item,
//   }) =>
//       TransformCollectionFromFormatV1ToV2(
//         variables: variables ?? this.variables,
//         info: info ?? this.info,
//         item: item ?? this.item,
//       );
//
//   factory TransformCollectionFromFormatV1ToV2.fromMap(Map<String, dynamic> json) => TransformCollectionFromFormatV1ToV2(
//     variables: json["variables"] == null ? null : List<dynamic>.from(json["variables"].map((x) => x)),
//     info: json["info"] == null ? null : Info.fromMap(json["info"]),
//     item: json["item"] == null ? null : List<Item>.from(json["item"].map((x) => Item.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "variables": variables == null ? null : List<dynamic>.from(variables.map((x) => x)),
//     "info": info == null ? null : info.toMap(),
//     "item": item == null ? null : List<dynamic>.from(item.map((x) => x.toMap())),
//   };
// }
//
// class Info {
//   Info({
//     @required this.name,
//     @required this.postmanId,
//     @required this.description,
//     @required this.schema,
//   });
//
//   final String name;
//   final String postmanId;
//   final String description;
//   final String schema;
//
//   Info copyWith({
//     String name,
//     String postmanId,
//     String description,
//     String schema,
//   }) =>
//       Info(
//         name: name ?? this.name,
//         postmanId: postmanId ?? this.postmanId,
//         description: description ?? this.description,
//         schema: schema ?? this.schema,
//       );
//
//   factory Info.fromMap(Map<String, dynamic> json) => Info(
//     name: json["name"] == null ? null : json["name"],
//     postmanId: json["_postman_id"] == null ? null : json["_postman_id"],
//     description: json["description"] == null ? null : json["description"],
//     schema: json["schema"] == null ? null : json["schema"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "name": name == null ? null : name,
//     "_postman_id": postmanId == null ? null : postmanId,
//     "description": description == null ? null : description,
//     "schema": schema == null ? null : schema,
//   };
// }
//
// class Item {
//   Item({
//     @required this.name,
//     @required this.event,
//     @required this.request,
//     @required this.response,
//   });
//
//   final String name;
//   final List<Event> event;
//   final ItemRequest request;
//   final List<dynamic> response;
//
//   Item copyWith({
//     String name,
//     List<Event> event,
//     ItemRequest request,
//     List<dynamic> response,
//   }) =>
//       Item(
//         name: name ?? this.name,
//         event: event ?? this.event,
//         request: request ?? this.request,
//         response: response ?? this.response,
//       );
//
//   factory Item.fromMap(Map<String, dynamic> json) => Item(
//     name: json["name"] == null ? null : json["name"],
//     event: json["event"] == null ? null : List<Event>.from(json["event"].map((x) => Event.fromMap(x))),
//     request: json["request"] == null ? null : ItemRequest.fromMap(json["request"]),
//     response: json["response"] == null ? null : List<dynamic>.from(json["response"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "name": name == null ? null : name,
//     "event": event == null ? null : List<dynamic>.from(event.map((x) => x.toMap())),
//     "request": request == null ? null : request.toMap(),
//     "response": response == null ? null : List<dynamic>.from(response.map((x) => x)),
//   };
// }
//
// class Event {
//   Event({
//     @required this.listen,
//     @required this.script,
//   });
//
//   final String listen;
//   final Script script;
//
//   Event copyWith({
//     String listen,
//     Script script,
//   }) =>
//       Event(
//         listen: listen ?? this.listen,
//         script: script ?? this.script,
//       );
//
//   factory Event.fromMap(Map<String, dynamic> json) => Event(
//     listen: json["listen"] == null ? null : json["listen"],
//     script: json["script"] == null ? null : Script.fromMap(json["script"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "listen": listen == null ? null : listen,
//     "script": script == null ? null : script.toMap(),
//   };
// }
//
// class Script {
//   Script({
//     @required this.type,
//     @required this.exec,
//   });
//
//   final String type;
//   final List<String> exec;
//
//   Script copyWith({
//     String type,
//     List<String> exec,
//   }) =>
//       Script(
//         type: type ?? this.type,
//         exec: exec ?? this.exec,
//       );
//
//   factory Script.fromMap(Map<String, dynamic> json) => Script(
//     type: json["type"] == null ? null : json["type"],
//     exec: json["exec"] == null ? null : List<String>.from(json["exec"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "type": type == null ? null : type,
//     "exec": exec == null ? null : List<dynamic>.from(exec.map((x) => x)),
//   };
// }
//
// class ItemRequest {
//   ItemRequest({
//     @required this.url,
//     @required this.method,
//     @required this.header,
//     @required this.body,
//   });
//
//   final String url;
//   final String method;
//   final List<Header> header;
//   final Body body;
//
//   ItemRequest copyWith({
//     String url,
//     String method,
//     List<Header> header,
//     Body body,
//   }) =>
//       ItemRequest(
//         url: url ?? this.url,
//         method: method ?? this.method,
//         header: header ?? this.header,
//         body: body ?? this.body,
//       );
//
//   factory ItemRequest.fromMap(Map<String, dynamic> json) => ItemRequest(
//     url: json["url"] == null ? null : json["url"],
//     method: json["method"] == null ? null : json["method"],
//     header: json["header"] == null ? null : List<Header>.from(json["header"].map((x) => Header.fromMap(x))),
//     body: json["body"] == null ? null : Body.fromMap(json["body"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "url": url == null ? null : url,
//     "method": method == null ? null : method,
//     "header": header == null ? null : List<dynamic>.from(header.map((x) => x.toMap())),
//     "body": body == null ? null : body.toMap(),
//   };
// }
//
// class Body {
//   Body({
//     @required this.mode,
//     @required this.raw,
//   });
//
//   final String mode;
//   final String raw;
//
//   Body copyWith({
//     String mode,
//     String raw,
//   }) =>
//       Body(
//         mode: mode ?? this.mode,
//         raw: raw ?? this.raw,
//       );
//
//   factory Body.fromMap(Map<String, dynamic> json) => Body(
//     mode: json["mode"] == null ? null : json["mode"],
//     raw: json["raw"] == null ? null : json["raw"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "mode": mode == null ? null : mode,
//     "raw": raw == null ? null : raw,
//   };
// }
//
// class Header {
//   Header({
//     @required this.key,
//     @required this.value,
//     @required this.description,
//   });
//
//   final String key;
//   final String value;
//   final String description;
//
//   Header copyWith({
//     String key,
//     String value,
//     String description,
//   }) =>
//       Header(
//         key: key ?? this.key,
//         value: value ?? this.value,
//         description: description ?? this.description,
//       );
//
//   factory Header.fromMap(Map<String, dynamic> json) => Header(
//     key: json["key"] == null ? null : json["key"],
//     value: json["value"] == null ? null : json["value"],
//     description: json["description"] == null ? null : json["description"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "key": key == null ? null : key,
//     "value": value == null ? null : value,
//     "description": description == null ? null : description,
//   };
// }
//
// /**
//  * Transform collection from format v2 to v1
//  *
//  * POST https://postman-echo.com/transform/collection?from=2&to=1
//  */
// class TransformCollectionFromFormatV2ToV1 {
//   TransformCollectionFromFormatV2ToV1({
//     @required this.id,
//     @required this.name,
//     @required this.description,
//     @required this.order,
//     @required this.folders,
//     @required this.requests,
//   });
//
//   final String id;
//   final String name;
//   final String description;
//   final List<String> order;
//   final List<dynamic> folders;
//   final List<RequestElement> requests;
//
//   TransformCollectionFromFormatV2ToV1 copyWith({
//     String id,
//     String name,
//     String description,
//     List<String> order,
//     List<dynamic> folders,
//     List<RequestElement> requests,
//   }) =>
//       TransformCollectionFromFormatV2ToV1(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         description: description ?? this.description,
//         order: order ?? this.order,
//         folders: folders ?? this.folders,
//         requests: requests ?? this.requests,
//       );
//
//   factory TransformCollectionFromFormatV2ToV1.fromMap(Map<String, dynamic> json) => TransformCollectionFromFormatV2ToV1(
//     id: json["id"] == null ? null : json["id"],
//     name: json["name"] == null ? null : json["name"],
//     description: json["description"] == null ? null : json["description"],
//     order: json["order"] == null ? null : List<String>.from(json["order"].map((x) => x)),
//     folders: json["folders"] == null ? null : List<dynamic>.from(json["folders"].map((x) => x)),
//     requests: json["requests"] == null ? null : List<RequestElement>.from(json["requests"].map((x) => RequestElement.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id == null ? null : id,
//     "name": name == null ? null : name,
//     "description": description == null ? null : description,
//     "order": order == null ? null : List<dynamic>.from(order.map((x) => x)),
//     "folders": folders == null ? null : List<dynamic>.from(folders.map((x) => x)),
//     "requests": requests == null ? null : List<dynamic>.from(requests.map((x) => x.toMap())),
//   };
// }
//
// class RequestElement {
//   RequestElement({
//     @required this.id,
//     @required this.name,
//     @required this.collectionId,
//     @required this.method,
//     @required this.headers,
//     @required this.data,
//     @required this.rawModeData,
//     @required this.tests,
//     @required this.preRequestScript,
//     @required this.url,
//     @required this.dataMode,
//   });
//
//   final String id;
//   final String name;
//   final String collectionId;
//   final String method;
//   final String headers;
//   final List<dynamic> data;
//   final String rawModeData;
//   final String tests;
//   final String preRequestScript;
//   final String url;
//   final String dataMode;
//
//   RequestElement copyWith({
//     String id,
//     String name,
//     String collectionId,
//     String method,
//     String headers,
//     List<dynamic> data,
//     String rawModeData,
//     String tests,
//     String preRequestScript,
//     String url,
//     String dataMode,
//   }) =>
//       RequestElement(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         collectionId: collectionId ?? this.collectionId,
//         method: method ?? this.method,
//         headers: headers ?? this.headers,
//         data: data ?? this.data,
//         rawModeData: rawModeData ?? this.rawModeData,
//         tests: tests ?? this.tests,
//         preRequestScript: preRequestScript ?? this.preRequestScript,
//         url: url ?? this.url,
//         dataMode: dataMode ?? this.dataMode,
//       );
//
//   factory RequestElement.fromMap(Map<String, dynamic> json) => RequestElement(
//     id: json["id"] == null ? null : json["id"],
//     name: json["name"] == null ? null : json["name"],
//     collectionId: json["collectionId"] == null ? null : json["collectionId"],
//     method: json["method"] == null ? null : json["method"],
//     headers: json["headers"] == null ? null : json["headers"],
//     data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
//     rawModeData: json["rawModeData"] == null ? null : json["rawModeData"],
//     tests: json["tests"] == null ? null : json["tests"],
//     preRequestScript: json["preRequestScript"] == null ? null : json["preRequestScript"],
//     url: json["url"] == null ? null : json["url"],
//     dataMode: json["dataMode"] == null ? null : json["dataMode"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id == null ? null : id,
//     "name": name == null ? null : name,
//     "collectionId": collectionId == null ? null : collectionId,
//     "method": method == null ? null : method,
//     "headers": headers == null ? null : headers,
//     "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
//     "rawModeData": rawModeData == null ? null : rawModeData,
//     "tests": tests == null ? null : tests,
//     "preRequestScript": preRequestScript == null ? null : preRequestScript,
//     "url": url == null ? null : url,
//     "dataMode": dataMode == null ? null : dataMode,
//   };
// }
