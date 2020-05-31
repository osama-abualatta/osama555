(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[64],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/app/form/masks.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/app/form/masks.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
/* harmony default export */ __webpack_exports__["default"] = ({
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "Form Masks"
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/app/form/masks.vue?vue&type=template&id=3eee5f2e&":
/*!************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/app/form/masks.vue?vue&type=template&id=3eee5f2e& ***!
  \************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "div",
    { staticClass: "main-content" },
    [
      _c("breadcumb", { attrs: { page: "Masks", folder: "Forms" } }),
      _vm._v(" "),
      _c(
        "b-row",
        [
          _c(
            "b-col",
            { attrs: { md: "12" } },
            [
              _c(
                "b-card",
                { attrs: { title: "Input Masks" } },
                [
                  _c(
                    "b-row",
                    [
                      _c(
                        "b-col",
                        { staticClass: "mb-3", attrs: { md: "6" } },
                        [
                          _c("p", { staticClass: "font-weight-400 mb-2" }, [
                            _vm._v("CPF")
                          ]),
                          _vm._v(" "),
                          _c("the-mask", {
                            staticClass: "form-control",
                            attrs: {
                              mask: ["###.###.###-##"],
                              placeholder: "999.999.999-99"
                            }
                          })
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c(
                        "b-col",
                        { staticClass: "mb-3", attrs: { md: "6" } },
                        [
                          _c("p", { staticClass: "font-weight-400 mb-2" }, [
                            _vm._v("Zip Code")
                          ]),
                          _vm._v(" "),
                          _c("the-mask", {
                            staticClass: "form-control",
                            attrs: {
                              mask: ["#####-###"],
                              placeholder: "99999-999"
                            }
                          })
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c(
                        "b-col",
                        { staticClass: "mb-3", attrs: { md: "6" } },
                        [
                          _c("p", { staticClass: "font-weight-400 mb-2" }, [
                            _vm._v("Phone")
                          ]),
                          _vm._v(" "),
                          _c("the-mask", {
                            staticClass: "form-control",
                            attrs: {
                              mask: ["+# (###) ###-####"],
                              placeholder: "+9 (999) 999-9999"
                            }
                          })
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c(
                        "b-col",
                        { staticClass: "mb-3", attrs: { md: "6" } },
                        [
                          _c("p", { staticClass: "font-weight-400 mb-2" }, [
                            _vm._v("Master Card")
                          ]),
                          _vm._v(" "),
                          _c("the-mask", {
                            staticClass: "form-control",
                            attrs: {
                              mask: ["#### #### #### ####"],
                              placeholder: "9999 9999 9999 9999"
                            }
                          })
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c(
                        "b-col",
                        { staticClass: "mb-3", attrs: { md: "6" } },
                        [
                          _c("p", { staticClass: "font-weight-400 mb-2" }, [
                            _vm._v("Date")
                          ]),
                          _vm._v(" "),
                          _c("the-mask", {
                            staticClass: "form-control",
                            attrs: {
                              mask: ["##/##/####"],
                              placeholder: "mm/dd/yy"
                            }
                          })
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c(
                        "b-col",
                        { staticClass: "mb-3", attrs: { md: "6" } },
                        [
                          _c("p", { staticClass: "font-weight-400 mb-2" }, [
                            _vm._v("CPF/CNPJ")
                          ]),
                          _vm._v(" "),
                          _c("the-mask", {
                            staticClass: "form-control",
                            attrs: {
                              mask: ["###.###.###-##", "##.###.###/####-##"],
                              placeholder: "99.999.999/9999-99"
                            }
                          })
                        ],
                        1
                      )
                    ],
                    1
                  ),
                  _vm._v(" "),
                  _c("b-button", { attrs: { variant: "primary" } }, [
                    _vm._v("Submit")
                  ])
                ],
                1
              )
            ],
            1
          )
        ],
        1
      )
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/views/app/form/masks.vue":
/*!***********************************************!*\
  !*** ./resources/js/views/app/form/masks.vue ***!
  \***********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _masks_vue_vue_type_template_id_3eee5f2e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./masks.vue?vue&type=template&id=3eee5f2e& */ "./resources/js/views/app/form/masks.vue?vue&type=template&id=3eee5f2e&");
/* harmony import */ var _masks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./masks.vue?vue&type=script&lang=js& */ "./resources/js/views/app/form/masks.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _masks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _masks_vue_vue_type_template_id_3eee5f2e___WEBPACK_IMPORTED_MODULE_0__["render"],
  _masks_vue_vue_type_template_id_3eee5f2e___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/app/form/masks.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/app/form/masks.vue?vue&type=script&lang=js&":
/*!************************************************************************!*\
  !*** ./resources/js/views/app/form/masks.vue?vue&type=script&lang=js& ***!
  \************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_masks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./masks.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/app/form/masks.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_masks_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/app/form/masks.vue?vue&type=template&id=3eee5f2e&":
/*!******************************************************************************!*\
  !*** ./resources/js/views/app/form/masks.vue?vue&type=template&id=3eee5f2e& ***!
  \******************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_masks_vue_vue_type_template_id_3eee5f2e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./masks.vue?vue&type=template&id=3eee5f2e& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/app/form/masks.vue?vue&type=template&id=3eee5f2e&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_masks_vue_vue_type_template_id_3eee5f2e___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_masks_vue_vue_type_template_id_3eee5f2e___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);