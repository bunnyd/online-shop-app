module.exports=function(a){function b(d){if(c[d])return c[d].exports;var e=c[d]={i:d,l:!1,exports:{}};return a[d].call(e.exports,e,e.exports,b),e.l=!0,e.exports}var c={};return b.m=a,b.c=c,b.d=function(a,c,d){b.o(a,c)||Object.defineProperty(a,c,{configurable:!1,enumerable:!0,get:d})},b.r=function(a){Object.defineProperty(a,'__esModule',{value:!0})},b.n=function(a){var c=a&&a.__esModule?function(){return a['default']}:function(){return a};return b.d(c,'a',c),c},b.o=function(a,b){return Object.prototype.hasOwnProperty.call(a,b)},b.p='',b(b.s=7)}([function(a){a.exports=require('path')},function(a){a.exports=function(a){return a.webpackPolyfill||(a.deprecate=function(){},a.paths=[],!a.children&&(a.children=[]),Object.defineProperty(a,'loaded',{enumerable:!0,get:function(){return a.l}}),Object.defineProperty(a,'id',{enumerable:!0,get:function(){return a.i}}),a.webpackPolyfill=1),a}},function(a,b,c){(function(a){const b=c(0),d=b.join(__dirname,'keytar.node');try{global.process.dlopen(a,d)}catch(a){throw new Error('Cannot open '+d+': '+a)}}).call(this,c(1)(a))},function(a,b,c){function d(a,b){if(!a||0>=a.length)throw new Error(b+' is required.')}function e(a){if('function'==typeof a)return new Promise(function(b,c){a((a,d)=>{a?c(a):b(d)})});throw new Error('Callback required')}var f=c(2);a.exports={getPassword:function(a,b){return d(a,'Service'),d(b,'Account'),e((c)=>f.getPassword(a,b,c))},setPassword:function(a,b,c){return d(a,'Service'),d(b,'Account'),d(c,'Password'),e((d)=>f.setPassword(a,b,c,d))},deletePassword:function(a,b){return d(a,'Service'),d(b,'Account'),e((c)=>f.deletePassword(a,b,c))},findPassword:function(a){return d(a,'Service'),e((b)=>f.findPassword(a,b))}}},function(a,b,c){'use strict';Object.defineProperty(b,'__esModule',{value:!0});const d=c(3);b.TokenStore={setItem:function(a,b,c){return d.setPassword(a,b,c)},getItem:function(a,b){return d.getPassword(a,b)},deleteItem:function(a,b){return d.deletePassword(a,b)}}},function(a,b){'use strict';function c(a){const b='GitHub';return`${b} - ${a}`}Object.defineProperty(b,'__esModule',{value:!0}),b.getKeyForAccount=function(a){return c(a.endpoint)},b.getKeyForEndpoint=c},function(a,b,c){'use strict';Object.defineProperty(b,'__esModule',{value:!0});const d=c(5),e=c(4);b.responseForPrompt=async function(a){const b=process.env.DESKTOP_USERNAME;if(null==b||0===b.length)return null;if(a.startsWith('Username'))return b;if(a.startsWith('Password')){const a=process.env.DESKTOP_ENDPOINT;if(null==a||0===a.length)return null;const c=d.getKeyForEndpoint(a);return await e.TokenStore.getItem(c,b)}return null}},function(a,b,c){'use strict';Object.defineProperty(b,'__esModule',{value:!0});const d=c(6),e=process.argv[2];d.responseForPrompt(e).then((a)=>{a&&(process.stdout.write(a),process.stdout.end())})}]);
//# sourceMappingURL=ask-pass.js.map