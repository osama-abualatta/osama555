/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "../src/assets/js/pages/custom/contacts/list-datatable.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "../src/assets/js/pages/custom/contacts/list-datatable.js":
/*!****************************************************************!*\
  !*** ../src/assets/js/pages/custom/contacts/list-datatable.js ***!
  \****************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\r\n// Class definition\r\n\r\nvar KTUserListDatatable = function () {\r\n\r\n    // variables\r\n    var datatable;\r\n\r\n    // init\r\n    var init = function () {\r\n        // init the datatables. Learn more: https://keenthemes.com/metronic/?page=docs&section=datatable\r\n        datatable = $('#kt_apps_user_list_datatable').KTDatatable({\r\n            // datasource definition\r\n            data: {\r\n                type: 'remote',\r\n                source: {\r\n                    read: {\r\n                        url: 'https://keenthemes.com/metronic/tools/preview/api/datatables/demos/client.php',\r\n                    },\r\n                },\r\n                pageSize: 10, // display 20 records per page\r\n                serverPaging: true,\r\n                serverFiltering: true,\r\n                serverSorting: true,\r\n            },\r\n\r\n            // layout definition\r\n            layout: {\r\n                scroll: false, // enable/disable datatable scroll both horizontal and vertical when needed.\r\n                footer: false, // display/hide footer\r\n            },\r\n\r\n            // column sorting\r\n            sortable: true,\r\n\r\n            pagination: true,\r\n\r\n            search: {\r\n                input: $('#generalSearch'),\r\n                delay: 400,\r\n            },\r\n\r\n            // columns definition\r\n            columns: [\r\n                {\r\n                    field: 'ID',\r\n                    title: '#',\r\n                    sortable: false,\r\n                    width: 20,\r\n                    selector: {\r\n                        class: 'kt-checkbox--solid'\r\n                    },\r\n                    textAlign: 'center',\r\n                },\r\n                {\r\n                    field: \"Name\",\r\n                    title: \"Name\",\r\n                    width: 200,\r\n                    // callback function support for column rendering\r\n                    template: function (data, i) {\r\n                        var number = 4 + i;\r\n                        while (number > 12) {\r\n                            number = number - 3;\r\n                        }\r\n                        var user_img = '100_' + number + '.jpg';\r\n\r\n                        var pos = KTUtil.getRandomInt(0, 5);\r\n                        var position = [\r\n                            'Developer',\r\n                            'Designer',\r\n                            'CEO',\r\n                            'Manager',\r\n                            'Architect',\r\n                            'Sales'\r\n                        ];\r\n\r\n                        var output = '';\r\n                        if (number > 5) {\r\n                            output = '' +\r\n                                '<div class=\"kt-user-card-v2\">' +\r\n                                '<div class=\"kt-user-card-v2__pic\">' +\r\n                                '<img src=\"assets/media/users/' + user_img + '\" alt=\"photo\">' +\r\n                                '</div>' +\r\n                                '<div class=\"kt-user-card-v2__details\">' +\r\n                                '<a href=\"#\" class=\"kt-user-card-v2__name\">' + data.Name + '</a>' +\r\n                                '<span class=\"kt-user-card-v2__desc\">' + position[pos] + '</span>' +\r\n                                '</div>' +\r\n                                '</div>';\r\n                        } else {\r\n                            var stateNo = KTUtil.getRandomInt(0, 6);\r\n                            var states = [\r\n                                'success',\r\n                                'brand',\r\n                                'danger',\r\n                                'success',\r\n                                'warning',\r\n                                'primary',\r\n                                'info'\r\n                            ];\r\n                            var state = states[stateNo];\r\n\r\n                            output = '' +\r\n                                '<div class=\"kt-user-card-v2\">' +\r\n                                '<div class=\"kt-user-card-v2__pic\">' +\r\n                                '<div class=\"kt-badge kt-badge--xl kt-badge--' + state + '\">' + data.Name.substring(0, 1) + '</div>' +\r\n                                '</div>' +\r\n                                '<div class=\"kt-user-card-v2__details\">' +\r\n                                '<a href=\"#\" class=\"kt-user-card-v2__name\">' + data.Name + '</a>' +\r\n                                '<span class=\"kt-user-card-v2__desc\">' + position[pos] + '</span>' +\r\n                                '</div>' +\r\n                                '</div>';\r\n                        }\r\n\r\n                        return output;\r\n                    }\r\n                },\r\n                {\r\n                    field: 'City',\r\n                    title: 'City',\r\n                },\r\n                {\r\n                    field: \"Company\",\r\n                    title: \"Company\",\r\n                    autoHide: false,\r\n                    // callback function support for column rendering\r\n                    template: function (data, i) {\r\n                        var number = i + 1;\r\n                        while (number > 5) {\r\n                            number = number - 3;\r\n                        }\r\n                        var img = number + '.png';\r\n\r\n                        var skills = [\r\n                            'Angular, React',\r\n                            'Vue, Kendo',\r\n                            '.NET, Oracle, MySQL',\r\n                            'Node, SASS, Webpack',\r\n                            'MangoDB, Java',\r\n                            'HTML5, jQuery, CSS3'\r\n                        ];\r\n\r\n                        var output = '' +\r\n                            '<div class=\"kt-user-card-v2\">' +\r\n                            '<div class=\"kt-user-card-v2__pic\">' +\r\n                            '<img src=\"assets/media/client-logos/logo' + img + '\" alt=\"photo\">' +\r\n                            '</div>' +\r\n                            '<div class=\"kt-user-card-v2__details\">' +\r\n                            '<a href=\"#\" class=\"kt-user-card-v2__name\">' + data.Company + '</a>' +\r\n                            '<span class=\"kt-user-card-v2__email\">' + skills[number - 1] + '</span>' +\r\n                            '</div>' +\r\n                            '</div>';\r\n\r\n                        return output;\r\n                    }\r\n                },\r\n                {\r\n                    field: 'Address',\r\n                    title: 'Address',\r\n                    width: 150,\r\n                    template: function (row) {\r\n                        return row.Address1 + ' ' + row.Address2;\r\n                    }\r\n                },\r\n                {\r\n                    field: 'Country',\r\n                    title: 'Country',\r\n                },\r\n                {\r\n                    field: 'DateCreated',\r\n                    title: 'Date Created',\r\n                    type: 'date',\r\n                    format: 'MM/DD/YYYY',\r\n                },\r\n                {\r\n                    field: 'DateModified',\r\n                    title: 'Date Modified',\r\n                    type: 'date',\r\n                    format: 'MM/DD/YYYY',\r\n                },\r\n                {\r\n                    field: \"Type\",\r\n                    title: \"Type\",\r\n                    autoHide: false,\r\n                    // callback function support for column rendering\r\n                    template: function (row) {\r\n                        var status = {\r\n                            1: {\r\n                                'title': 'Customer',\r\n                                'class': ' btn-label-brand'\r\n                            },\r\n                            2: {\r\n                                'title': 'Partner',\r\n                                'class': ' btn-label-danger'\r\n                            },\r\n                            3: {\r\n                                'title': 'Supplier',\r\n                                'class': ' btn-label-warning'\r\n                            },\r\n                            4: {\r\n                                'title': 'Staff',\r\n                                'class': ' btn-label-success'\r\n                            },\r\n                            5: {\r\n                                'title': 'Hot Lead',\r\n                                'class': ' btn-label-primary'\r\n                            },\r\n                            6: {\r\n                                'title': 'Cold Lead',\r\n                                'class': ' btn-label-info'\r\n                            },\r\n                        };\r\n                        return '<span class=\"btn btn-bold btn-sm btn-font-sm ' + status[row.Type].class + '\">' + status[row.Type].title + '</span>';\r\n                    }\r\n                },\r\n                {\r\n                    width: 110,\r\n                    field: 'Status',\r\n                    title: 'Status',\r\n                    autoHide: false,\r\n                    // callback function support for column rendering\r\n                    template: function (row) {\r\n                        var status = {\r\n                            1: {'title': 'Active', 'state': 'success'},\r\n                            2: {'title': 'Pending', 'state': 'primary'},\r\n                            3: {'title': 'Suspended', 'state': 'danger'},\r\n                        };\r\n                        return '<span class=\"kt-badge kt-badge--' + status[row.Status].state + ' kt-badge--dot\"></span>&nbsp;<span class=\"kt-font-bold kt-font-' + status[row.Status].state + '\">' + status[row.Status].title + '</span>';\r\n                    },\r\n                },\r\n                {\r\n                    field: \"Actions\",\r\n                    width: 80,\r\n                    title: \"Actions\",\r\n                    sortable: false,\r\n                    autoHide: false,\r\n                    overflow: 'visible',\r\n                    template: function () {\r\n                        return '' +\r\n                            '<div class=\"dropdown\">' +\r\n                            '<a href=\"javascript:;\" class=\"btn btn-sm btn-clean btn-icon btn-icon-md\" data-toggle=\"dropdown\">' +\r\n                            '<i class=\"flaticon-more-1\"></i>' +\r\n                            '</a>' +\r\n                            '<div class=\"dropdown-menu dropdown-menu-right\">' +\r\n                            '<ul class=\"kt-nav\">' +\r\n                            '<li class=\"kt-nav__item\">' +\r\n                            '<a href=\"#\" class=\"kt-nav__link\">' +\r\n                            '<i class=\"kt-nav__link-icon flaticon2-expand\"></i>' +\r\n                            '<span class=\"kt-nav__link-text\">View</span>' +\r\n                            '</a>' +\r\n                            '</li>' +\r\n                            '<li class=\"kt-nav__item\">' +\r\n                            '<a href=\"#\" class=\"kt-nav__link\">' +\r\n                            '<i class=\"kt-nav__link-icon flaticon2-contract\"></i>' +\r\n                            '<span class=\"kt-nav__link-text\">Edit</span>' +\r\n                            '</a>' +\r\n                            '</li>' +\r\n                            '<li class=\"kt-nav__item\">' +\r\n                            '<a href=\"#\" class=\"kt-nav__link\">' +\r\n                            '<i class=\"kt-nav__link-icon flaticon2-trash\"></i>' +\r\n                            '<span class=\"kt-nav__link-text\">Delete</span>' +\r\n                            '</a>' +\r\n                            '</li>' +\r\n                            '<li class=\"kt-nav__item\">' +\r\n                            '<a href=\"#\" class=\"kt-nav__link\">' +\r\n                            '<i class=\"kt-nav__link-icon flaticon2-mail-1\"></i>' +\r\n                            '<span class=\"kt-nav__link-text\">Export</span>' +\r\n                            '</a>' +\r\n                            '</li>' +\r\n                            '</ul>' +\r\n                            '</div>' +\r\n                            '</div>';\r\n                    },\r\n                }]\r\n        });\r\n    };\r\n\r\n    // search\r\n    var search = function () {\r\n        $('#kt_form_status').on('change', function () {\r\n            datatable.search($(this).val().toLowerCase(), 'Status');\r\n        });\r\n    };\r\n\r\n    // selection\r\n    var selection = function () {\r\n        // init form controls\r\n        //$('#kt_form_status, #kt_form_type').selectpicker();\r\n\r\n        // event handler on check and uncheck on records\r\n        datatable.on('kt-datatable--on-check kt-datatable--on-uncheck kt-datatable--on-layout-updated', function (e) {\r\n            var checkedNodes = datatable.rows('.kt-datatable__row--active').nodes(); // get selected records\r\n            var count = checkedNodes.length; // selected records count\r\n\r\n            $('#kt_subheader_group_selected_rows').html(count);\r\n\r\n            if (count > 0) {\r\n                $('#kt_subheader_search').addClass('kt-hidden');\r\n                $('#kt_subheader_group_actions').removeClass('kt-hidden');\r\n            } else {\r\n                $('#kt_subheader_search').removeClass('kt-hidden');\r\n                $('#kt_subheader_group_actions').addClass('kt-hidden');\r\n            }\r\n        });\r\n    }\r\n\r\n    // fetch selected records\r\n    var selectedFetch = function () {\r\n        // event handler on selected records fetch modal launch\r\n        $('#kt_datatable_records_fetch_modal').on('show.bs.modal', function (e) {\r\n            // show loading dialog\r\n            var loading = new KTDialog({'type': 'loader', 'placement': 'top center', 'message': 'Loading ...'});\r\n            loading.show();\r\n\r\n            setTimeout(function () {\r\n                loading.hide();\r\n            }, 1000);\r\n\r\n            // fetch selected IDs\r\n            var ids = datatable.rows('.kt-datatable__row--active').nodes().find('.kt-checkbox--single > [type=\"checkbox\"]').map(function (i, chk) {\r\n                return $(chk).val();\r\n            });\r\n\r\n            // populate selected IDs\r\n            var c = document.createDocumentFragment();\r\n\r\n            for (var i = 0; i < ids.length; i++) {\r\n                var li = document.createElement('li');\r\n                li.setAttribute('data-id', ids[i]);\r\n                li.innerHTML = 'Selected record ID: ' + ids[i];\r\n                c.appendChild(li);\r\n            }\r\n\r\n            $(e.target).find('#kt_apps_user_fetch_records_selected').append(c);\r\n        }).on('hide.bs.modal', function (e) {\r\n            $(e.target).find('#kt_apps_user_fetch_records_selected').empty();\r\n        });\r\n    };\r\n\r\n    // selected records status update\r\n    var selectedStatusUpdate = function () {\r\n        $('#kt_subheader_group_actions_status_change').on('click', \"[data-toggle='status-change']\", function () {\r\n            var status = $(this).find(\".kt-nav__link-text\").html();\r\n\r\n            // fetch selected IDs\r\n            var ids = datatable.rows('.kt-datatable__row--active').nodes().find('.kt-checkbox--single > [type=\"checkbox\"]').map(function (i, chk) {\r\n                return $(chk).val();\r\n            });\r\n\r\n            if (ids.length > 0) {\r\n                // learn more: https://sweetalert2.github.io/\r\n                swal.fire({\r\n                    buttonsStyling: false,\r\n\r\n                    html: \"Are you sure to update \" + ids.length + \" selected records status to \" + status + \" ?\",\r\n                    type: \"info\",\r\n\r\n                    confirmButtonText: \"Yes, update!\",\r\n                    confirmButtonClass: \"btn btn-sm btn-bold btn-brand\",\r\n\r\n                    showCancelButton: true,\r\n                    cancelButtonText: \"No, cancel\",\r\n                    cancelButtonClass: \"btn btn-sm btn-bold btn-default\"\r\n                }).then(function (result) {\r\n                    if (result.value) {\r\n                        swal.fire({\r\n                            title: 'Deleted!',\r\n                            text: 'Your selected records statuses have been updated!',\r\n                            type: 'success',\r\n                            buttonsStyling: false,\r\n                            confirmButtonText: \"OK\",\r\n                            confirmButtonClass: \"btn btn-sm btn-bold btn-brand\",\r\n                        })\r\n                        // result.dismiss can be 'cancel', 'overlay',\r\n                        // 'close', and 'timer'\r\n                    } else if (result.dismiss === 'cancel') {\r\n                        swal.fire({\r\n                            title: 'Cancelled',\r\n                            text: 'You selected records statuses have not been updated!',\r\n                            type: 'error',\r\n                            buttonsStyling: false,\r\n                            confirmButtonText: \"OK\",\r\n                            confirmButtonClass: \"btn btn-sm btn-bold btn-brand\",\r\n                        });\r\n                    }\r\n                });\r\n            }\r\n        });\r\n    }\r\n\r\n    // selected records delete\r\n    var selectedDelete = function () {\r\n        $('#kt_subheader_group_actions_delete_all').on('click', function () {\r\n            // fetch selected IDs\r\n            var ids = datatable.rows('.kt-datatable__row--active').nodes().find('.kt-checkbox--single > [type=\"checkbox\"]').map(function (i, chk) {\r\n                return $(chk).val();\r\n            });\r\n\r\n            if (ids.length > 0) {\r\n                // learn more: https://sweetalert2.github.io/\r\n                swal.fire({\r\n                    buttonsStyling: false,\r\n\r\n                    text: \"Are you sure to delete \" + ids.length + \" selected records ?\",\r\n                    type: \"danger\",\r\n\r\n                    confirmButtonText: \"Yes, delete!\",\r\n                    confirmButtonClass: \"btn btn-sm btn-bold btn-danger\",\r\n\r\n                    showCancelButton: true,\r\n                    cancelButtonText: \"No, cancel\",\r\n                    cancelButtonClass: \"btn btn-sm btn-bold btn-brand\"\r\n                }).then(function (result) {\r\n                    if (result.value) {\r\n                        swal.fire({\r\n                            title: 'Deleted!',\r\n                            text: 'Your selected records have been deleted! :(',\r\n                            type: 'success',\r\n                            buttonsStyling: false,\r\n                            confirmButtonText: \"OK\",\r\n                            confirmButtonClass: \"btn btn-sm btn-bold btn-brand\",\r\n                        })\r\n                        // result.dismiss can be 'cancel', 'overlay',\r\n                        // 'close', and 'timer'\r\n                    } else if (result.dismiss === 'cancel') {\r\n                        swal.fire({\r\n                            title: 'Cancelled',\r\n                            text: 'You selected records have not been deleted! :)',\r\n                            type: 'error',\r\n                            buttonsStyling: false,\r\n                            confirmButtonText: \"OK\",\r\n                            confirmButtonClass: \"btn btn-sm btn-bold btn-brand\",\r\n                        });\r\n                    }\r\n                });\r\n            }\r\n        });\r\n    }\r\n\r\n    var updateTotal = function () {\r\n        datatable.on('kt-datatable--on-layout-updated', function () {\r\n            //$('#kt_subheader_total').html(datatable.getTotalRows() + ' Total');\r\n        });\r\n    };\r\n\r\n    return {\r\n        // public functions\r\n        init: function () {\r\n            init();\r\n            search();\r\n            selection();\r\n            selectedFetch();\r\n            selectedStatusUpdate();\r\n            selectedDelete();\r\n            updateTotal();\r\n        },\r\n    };\r\n}();\r\n\r\n// On document ready\r\nKTUtil.ready(function () {\r\n    KTUserListDatatable.init();\r\n});\n\n//# sourceURL=webpack:///../src/assets/js/pages/custom/contacts/list-datatable.js?");

/***/ })

/******/ });