// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")
// require('jquery')

import $ from 'jquery';

global.$ = $
global.jQuery = $

require("jquery-ui")


// jquery-ui theme
// require.context('file-loader?name=[path][name].[ext]&context=node_modules/jquery-ui-dist!jquery-ui-dist', true,    /jquery-ui\.css/ );
// require.context('file-loader?name=[path][name].[ext]&context=node_modules/jquery-ui-dist!jquery-ui-dist', true,    /jquery-ui\.theme\.css/ );
// ui-icons_444444_256x240

// require.context('../images', true)
// import "images/ui-icons_444444_256x240.png";
// import {} from 'jquery-ujs';

// import {datepickerFactory} from 'jquery-datepicker';


// import "foundation-sites"
// require the css in assets/stylesheets/application.css!!
import { Foundation } from 'foundation-sites';
Foundation.addToJquery($);


// $(document).on('turbolinks:load', function() {
//   // console.log("turbolinks:load")
//   $(function(){ 
//     // console.log("JQuery")
//     $(document).foundation();
//   });
// });
$(function(){ $(document).foundation(); });

// console.log('Hello World from Webpacker')


 // $(function(){
 //    $(".test").html("jQuery is working.");
 //  });

 import '../src/font-awesome.js';