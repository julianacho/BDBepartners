(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["modules-pagesgestorconsulta-module"],{

/***/ "./src/client/app/modules/pagesgestorconsulta-routing.module.ts":
/*!**********************************************************************!*\
  !*** ./src/client/app/modules/pagesgestorconsulta-routing.module.ts ***!
  \**********************************************************************/
/*! exports provided: PagesGestorConsultaRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PagesGestorConsultaRoutingModule", function() { return PagesGestorConsultaRoutingModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");



var routes = [
    { path: '', loadChildren: './gestorconsulta/gestorconsulta.module#GestorConsultaModule' },
];
var PagesGestorConsultaRoutingModule = /** @class */ (function () {
    function PagesGestorConsultaRoutingModule() {
    }
    PagesGestorConsultaRoutingModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
            imports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"].forChild(routes)],
            exports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"]]
        })
    ], PagesGestorConsultaRoutingModule);
    return PagesGestorConsultaRoutingModule;
}());



/***/ }),

/***/ "./src/client/app/modules/pagesgestorconsulta.module.ts":
/*!**************************************************************!*\
  !*** ./src/client/app/modules/pagesgestorconsulta.module.ts ***!
  \**************************************************************/
/*! exports provided: PagesGestorConsultaModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PagesGestorConsultaModule", function() { return PagesGestorConsultaModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/fesm5/common.js");
/* harmony import */ var _gestorconsulta_gestorconsulta_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./gestorconsulta/gestorconsulta.module */ "./src/client/app/modules/gestorconsulta/gestorconsulta.module.ts");
/* harmony import */ var _pagesgestorconsulta_routing_module__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./pagesgestorconsulta-routing.module */ "./src/client/app/modules/pagesgestorconsulta-routing.module.ts");





var PagesGestorConsultaModule = /** @class */ (function () {
    function PagesGestorConsultaModule() {
    }
    PagesGestorConsultaModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
            declarations: [],
            imports: [
                _angular_common__WEBPACK_IMPORTED_MODULE_2__["CommonModule"],
                _gestorconsulta_gestorconsulta_module__WEBPACK_IMPORTED_MODULE_3__["GestorConsultaModule"],
                _pagesgestorconsulta_routing_module__WEBPACK_IMPORTED_MODULE_4__["PagesGestorConsultaRoutingModule"]
            ]
        })
    ], PagesGestorConsultaModule);
    return PagesGestorConsultaModule;
}());



/***/ })

}]);
//# sourceMappingURL=modules-pagesgestorconsulta-module-es5.js.map