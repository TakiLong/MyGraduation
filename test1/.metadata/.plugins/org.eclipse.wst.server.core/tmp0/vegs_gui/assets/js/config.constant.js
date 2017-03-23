'use strict';

/**
 * Config constant
 */
var webBaseURL="http://localhost:8090";  //rest接口

app.constant('APP_MEDIAQUERY', {
    'desktopXL': 1200,
    'desktop': 992,
    'tablet': 768,
    'mobile': 480
});
app.constant('JS_REQUIRES', {
    //*** Scripts
    scripts: {
        //*** Javascript Plugins
        'modernizr': ['module/components-modernizr/modernizr.js'],
        'moment': ['module/moment/min/moment.min.js'],
        'spin': 'module/spin.js/spin.js',

        //*** jQuery Plugins
        'perfect-scrollbar-plugin': ['module/perfect-scrollbar/js/min/perfect-scrollbar.jquery.min.js', 'module/perfect-scrollbar/css/perfect-scrollbar.min.css'],
        'ladda': ['module/ladda/dist/ladda.min.js', 'module/ladda/dist/ladda-themeless.min.css'],
        'sweet-alert': ['module/sweetalert/lib/sweet-alert.min.js', 'module/sweetalert/lib/sweet-alert.css'],
        'chartjs': 'module/chartjs/Chart.min.js',
        'jquery-sparkline': 'module/jquery.sparkline.build/dist/jquery.sparkline.min.js',
        'ckeditor-plugin': 'module/ckeditor/ckeditor.js',
        'jquery-nestable-plugin': ['module/jquery-nestable/jquery.nestable.js'],
        'touchspin-plugin': ['module/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js', 'module/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css'],

        //*** Controllers
        
        'dashboardCtrl': 'assets/js/controllers/dashboardCtrl.js',
        
        
        
        
        'ngTableCtrl': 'assets/js/controllers/ngTableCtrl.js',
        
        
        
        'loginCtrl': 'assets/js/controllers/loginCtrl.js',
        'headerCtrl': 'assets/js/controllers/headerCtrl.js',
        'navCtrl': 'assets/js/controllers/navCtrl.js',
        'infoCtrl': 'assets/js/controllers/infoCtrl.js',
        'userCtrl': ['assets/js/controllers/userCtrl.js'],
        //*** service
        'userService': 'assets/js/service/userservice.js',
        'downloadService': 'assets/js/service/downloadservice.js',
        'propertyService': 'assets/js/service/propertyService.js',
        'tableService': 'assets/js/service/tableService.js',
        //*** Filters
        'htmlToPlaintext': 'assets/js/filters/htmlToPlaintext.js'
    },
    //*** angularJS Modules
    modules: [{
        name: 'angularMoment',
        files: ['module/angular-moment/angular-moment.min.js']
    }, {
        name: 'toaster',
        files: ['module/AngularJS-Toaster/toaster.js', 'module/AngularJS-Toaster/toaster.css']
    }, {
        name: 'angularBootstrapNavTree',
        files: ['module/angular-bootstrap-nav-tree/dist/abn_tree_directive.js', 'module/angular-bootstrap-nav-tree/dist/abn_tree.css']
    }, {
        name: 'angular-ladda',
        files: ['module/angular-ladda/dist/angular-ladda.min.js']
    }, {
        name: 'ngTable',
        files: ['module/ng-table/dist/ng-table.min.js', 'module/ng-table/dist/ng-table.min.css']
    },{
        name: 'ngTags',
        files: ['module/ng-tags/dist/ng-tags.min.js', 'module/ng-tags/dist/ng-tags.min.css']
    }, {
        name: 'ui.select',
        files: ['module/angular-ui-select/dist/select.min.js', 'module/angular-ui-select/dist/select.min.css', 'module/select2/dist/css/select2.min.css', 'module/select2-bootstrap-css/select2-bootstrap.min.css', 'module/selectize/dist/css/selectize.bootstrap3.css']
    }, {
        name: 'ui.mask',
        files: ['module/angular-ui-utils/mask.min.js']
    }, {
        name: 'ngImgCrop',
        files: ['module/ngImgCrop/compile/minified/ng-img-crop.js', 'module/ngImgCrop/compile/minified/ng-img-crop.css']
    }, {
        name: 'angularFileUpload',
        files: ['module/angular-file-upload/angular-file-upload.min.js']
    }, {
        name: 'ngAside',
        files: ['module/angular-aside/dist/js/angular-aside.min.js', 'module/angular-aside/dist/css/angular-aside.min.css']
    }, {
        name: 'truncate',
        files: ['module/angular-truncate/src/truncate.js']
    }, {
        name: 'oitozero.ngSweetAlert',
        files: ['module/angular-sweetalert-promised/SweetAlert.min.js']
    }, {
        name: 'monospaced.elastic',
        files: ['module/angular-elastic/elastic.js']
    }, {
        name: 'ngMap',
        files: ['module/ngmap/build/scripts/ng-map.min.js']
    }, {
        name: 'tc.chartjs',
        files: ['module/tc-angular-chartjs/dist/tc-angular-chartjs.min.js']
    }, {
        name: 'flow',
        files: ['module/ng-flow/dist/ng-flow-standalone.min.js']
    }, {
        name: 'uiSwitch',
        files: ['module/angular-ui-switch/angular-ui-switch.min.js', 'module/angular-ui-switch/angular-ui-switch.min.css']
    }, {
        name: 'ckeditor',
        files: ['module/angular-ckeditor/angular-ckeditor.min.js']
    }, {
        name: 'mwl.calendar',
        files: ['module/angular-bootstrap-calendar/dist/js/angular-bootstrap-calendar.js', 'module/angular-bootstrap-calendar/dist/js/angular-bootstrap-calendar-tpls.js', 'module/angular-bootstrap-calendar/dist/css/angular-bootstrap-calendar.min.css']
    }, {
        name: 'ng-nestable',
        files: ['module/ng-nestable/src/angular-nestable.js']
    }, {
        name: 'vAccordion',
        files: ['module/v-accordion/dist/v-accordion.min.js', 'module/v-accordion/dist/v-accordion.min.css']
    }, {
        name: 'xeditable',
        files: ['module/angular-xeditable/dist/js/xeditable.min.js', 'module/angular-xeditable/dist/css/xeditable.css', 'assets/js/config/config-xeditable.js']
    }, {
        name: 'login-bg',
        files: ['module/login-bg/particles.js']
    },/* {
        name: 'ui-grid',
        files: ['module/ui-grid/ui-grid.min.js']
    },*/
    {
        name: 'checklist-model',
        files: ['module/checklist-model/checklist-model.js']
    }]
});
