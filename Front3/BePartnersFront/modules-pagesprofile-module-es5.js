(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["modules-pagesprofile-module"],{

/***/ "./src/client/app/modules/pagesprofile-routing.module.ts":
/*!***************************************************************!*\
  !*** ./src/client/app/modules/pagesprofile-routing.module.ts ***!
  \***************************************************************/
/*! exports provided: PagesProfileRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PagesProfileRoutingModule", function() { return PagesProfileRoutingModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");



var routes = [
    { path: '', loadChildren: './profile/profilehome.module#ProfileHomeModule' },
];
var PagesProfileRoutingModule = /** @class */ (function () {
    function PagesProfileRoutingModule() {
    }
    PagesProfileRoutingModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
            imports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"].forChild(routes)],
            exports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"]]
        })
    ], PagesProfileRoutingModule);
    return PagesProfileRoutingModule;
}());



/***/ }),

/***/ "./src/client/app/modules/pagesprofile.module.ts":
/*!*******************************************************!*\
  !*** ./src/client/app/modules/pagesprofile.module.ts ***!
  \*******************************************************/
/*! exports provided: PagesProfileModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PagesProfileModule", function() { return PagesProfileModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/fesm5/common.js");
/* harmony import */ var _pagesprofile_routing_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./pagesprofile-routing.module */ "./src/client/app/modules/pagesprofile-routing.module.ts");
/* harmony import */ var _profile_profilehome_module__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./profile/profilehome.module */ "./src/client/app/modules/profile/profilehome.module.ts");





var PagesProfileModule = /** @class */ (function () {
    function PagesProfileModule() {
    }
    PagesProfileModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
            declarations: [],
            imports: [
                _angular_common__WEBPACK_IMPORTED_MODULE_2__["CommonModule"],
                _profile_profilehome_module__WEBPACK_IMPORTED_MODULE_4__["ProfileHomeModule"],
                _pagesprofile_routing_module__WEBPACK_IMPORTED_MODULE_3__["PagesProfileRoutingModule"]
            ]
        })
    ], PagesProfileModule);
    return PagesProfileModule;
}());



/***/ })

}]);
//# sourceMappingURL=modules-pagesprofile-module-es5.js.map