(function(e){function t(e){if(!n.isInIframe()){e.inject=r.inject.FLOAT,(6===e.position||7===e.position)&&(e.h=48);var t={ls:e.ls,w:e.w,h:e.h,inject:e.inject,pos:e.position,rurl:n.getUrl(),pn:window.top.QIHOO_UNION.FLOAT,prt:(new Date).getTime(),tit:n.getDocumentTitle(),pt:window.top.QIHOO_UNION.PT,cw:window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,jv:r.jv};t.inlay=s.getAdNumber(e),t.link=o.getAdNumber(e),t.hao360=u.getAdNumber(e),t.rank=a.getAdNumber(e),t.imagelink=f.getAdNumber(e),t.searchlink=0,(6===e.position||7===e.position)&&(t.w=t.cw);var i=r.searchPage+n.serialize(t),l=n.createPlaceHolder("float",e);l.innerHTML+=6===e.position||7===e.position?n.createWidthIframe(e.h,i):n.createIframe(e.w,e.h,i),document.write(l.outerHTML),window.top.QIHOO_UNION.FLOAT++}}var n={getLeftRightOfBody:function(){var e=Math.max(document.documentElement.clientWidth,document.documentElement.scrollWidth),t=document.body.clientWidth;return Math.max(0,(e-t)/2)},createTopBottomPlaceHolder:function(e,t,i,s,o){var u=/msie 6.0/gi.test(navigator.userAgent)||"CSS1Compat"!==document.compatMode,a=(window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight);("top"===r.floatPos[o.position]||"bottom"===r.floatPos[o.position])&&(s.style.width="100%",s.style.height=o.h+"px"),s.style.position="fixed",s.style.left=0,i?s.style.top=0:s.style.bottom=0,u&&(i||(s.style.top=Math.max(0,a-o.h)+"px"),s.style.position="absolute",s.setAttribute("data-top",s.style.top.match(/\d+/)[0]),n.bind(window,"scroll",function(e){var t=e[0],n=document.documentElement.scrollTop||document.body.scrollTop,r=n+parseInt(t.getAttribute("data-top"),10);document.getElementById(t.id).style.top=r+"px"},s)),"onScroll"===t&&(s.style.display="none",n.bind(window,"scroll",function(e){var t=e[0],n=document.documentElement.scrollTop||document.body.scrollTop;document.getElementById(t.id).style.display=n>48?"block":"none"},s))},setLeftRightFloatPlaceHolder:function(e,t,r,i){var s=18,o=5,u=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight,a=/msie 6.0/gi.test(navigator.userAgent)||"CSS1Compat"!==document.compatMode,f=Math.max(0,u-i.h-s-o);"body"===e?t?r.style.left=Math.max(0,n.getLeftRightOfBody()-i.w)+"px":r.style.right=Math.max(0,n.getLeftRightOfBody()-i.w)+"px":t?r.style.left=0:r.style.right=0,r.style.top=f/2+"px",r.style.position="fixed",r.style.width=i.w+"px",r.style.height=i.h+s+o+"px",a&&(r.style.position="absolute",r.setAttribute("data-top",r.style.top.match(/\d+/)[0]))},createLeftRightFloatPlaceHolder:function(e,t,r,i){n.setLeftRightFloatPlaceHolder(e,t,r,i);var s=54,o=18,u=5,a=document.createElement("div");a.style.margin="0px 0px "+u+"px "+(i.w-54).toString()+"px",a.style.padding="0px",a.style["float"]="none",a.style.overflow="hidden",a.style.display="block",a.style.border="none",a.style.backgroundImage='url("http://p6.qhimg.com/d/inn/69518715/close.jpg")',a.style.visibility="visible",a.style.width=s+"px",a.style.height=o+"px",a.style.cursor="pointer",a.style.boxSizing="content-box",a.setAttribute("onclick",'document.getElementById("'+r.id+'").style.display = "none";'),r.appendChild(a);var f=/msie 6.0/gi.test(navigator.userAgent)||"CSS1Compat"!==document.compatMode;f&&n.bind(window,"scroll",function(e){var t=document.getElementById(e[0].id);if(null!==t){var n=document.documentElement.scrollTop||document.body.scrollTop,r=n+parseInt(t.getAttribute("data-top"),10);t.style.top=r+"px"}},r),n.bind(window,"resize",function(e){var t=e[0],n=e[1],r=e[2],i=e[3],s=e[4];s.setLeftRightFloatPlaceHolder(i,r,document.getElementById(t.id),n,!1)},r,i,t,e,this)},setLeftRightBottomPlaceHolder:function(e,t,r,i){var s=18,o=5,u=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight,a=/msie 6.0/gi.test(navigator.userAgent)||"CSS1Compat"!==document.compatMode,f=Math.max(0,u-i.h-s-o);"body"===e?t?r.style.left=n.getLeftRightOfBody()+"px":r.style.right=n.getLeftRightOfBody()+"px":t?r.style.left=0:r.style.right=0,r.style.position="fixed",r.style.top=f+"px",r.style.width=i.w+"px",r.style.height=i.h+s+o+"px",a&&(r.style.position="absolute",r.setAttribute("data-top",r.style.top.match(/\d+/)[0]))},createLeftRightBottomPlaceHolder:function(e,t,r,i){n.setLeftRightBottomPlaceHolder(e,t,r,i);var s=54,o=18,u=5,a=document.createElement("div");a.style.margin="0px 0px "+u+"px "+(i.w-54).toString()+"px",a.style.padding="0px",a.style["float"]="none",a.style.overflow="hidden",a.style.display="block",a.style.border="none",a.style.backgroundImage='url("http://p6.qhimg.com/d/inn/69518715/close.jpg")',a.style.visibility="visible",a.style.width=s+"px",a.style.height=o+"px",a.style.cursor="pointer",a.style.boxSizing="content-box",a.setAttribute("onclick",'document.getElementById("'+r.id+'").style.display = "none";'),r.appendChild(a);var f=/msie 6.0/gi.test(navigator.userAgent)||"CSS1Compat"!==document.compatMode;f&&n.bind(window,"scroll",function(e){var t=document.getElementById(e[0].id);if(null!==t){var n=document.documentElement.scrollTop||document.body.scrollTop,r=n+parseInt(t.getAttribute("data-top"),10);t.style.top=r+"px"}},r),n.bind(window,"resize",function(e){var t=e[0],n=e[1],r=e[2],i=e[3],s=e[4];s.setLeftRightBottomPlaceHolder(i,r,document.getElementById(t.id),n,!1)},r,i,t,e,this)},createPlaceHolder:function(e,t){if("inlay"===e){var i=document.createElement("div");return i.id="QIHOO_UNION_PLACEHOLDER_"+(new Date).getTime()+100*Math.random(),i}if("float"===e){var i=document.createElement("div");i.id="QIHOO_UNION_PLACEHOLDER_"+(new Date).getTime()+100*Math.random(),i.style.margin="0px",i.style.padding="0px",i.style["float"]="none",i.style.overflow="hidden",i.style.display="block",i.style.border="none",i.style.background="none",i.style.visibility="visible",i.style.cursor="pointer",i.style.boxSizing="content-box",i.style.zIndex="2147483646";var s=r.floatPos[t.position],o=r.floatOrigin[t.origin]||"browser",u=r.floatDisplay[t.display]||"default";switch(s){case"left":n.createLeftRightFloatPlaceHolder(o,!0,i,t);break;case"right":n.createLeftRightFloatPlaceHolder(o,!1,i,t);break;case"top":n.createTopBottomPlaceHolder(o,u,!0,i,t);break;case"bottom":n.createTopBottomPlaceHolder(o,u,!1,i,t);break;case"leftbottom":n.createLeftRightBottomPlaceHolder(o,!0,i,t);break;case"rightbottom":n.createLeftRightBottomPlaceHolder(o,!1,i,t)}return i}},createIframe:function(e,t,n){var r='<iframe id="{{id}}" src="{{src}}" width="{{width}}" height="{{height}}" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" align="center,center" allowtransparency="true" style="display:block;"></iframe>';return this.template(r,{id:"QIHOO_UNION_"+(new Date).getTime(),src:n,width:e,height:t})},createWidthIframe:function(e,t){var n='<iframe id="{{id}}" src="{{src}}" width="100%" height="{{height}}" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" align="center,center" allowtransparency="true" style="display:block;"></iframe>';return this.template(n,{id:"QIHOO_UNION_"+(new Date).getTime(),src:t,height:e})},serialize:function(e){var t=[];for(var n in e)e.hasOwnProperty(n)&&t.push(encodeURIComponent(n)+"="+encodeURIComponent(e[n])).toString().substr(0,512);return t.join("&")},template:function(e,t){return e.replace(/{{(\w+)}}/g,function(e,n){return t[n]})},getUrl:function(){var e,t=window;if("[object Function]"!==Object.prototype.toString.call(window.setInterval))e=window.location.href;else for(var n=10;n>0;){try{e=t.parent.location.href,t=t.parent}catch(r){e=t.document.referrer;break}n--}return e.replace(/\(|\)|>|<|\'|\"/g,"")},isInIframe:function(){var e=window,t="",n=!1;try{t=e.parent.location.href,e=e.parent}catch(r){n=!0}return n},getDocumentTitle:function(){var e="",t=window;if("[object Function]"!==Object.prototype.toString.call(window.setInterval))e=document.title||"";else for(var n=10;n>0;){try{e=t.document.title,t=t.parent}catch(r){break}n--}return e.replace(/\(|\)|>|<|\'|\"/g,"")},bind:function(e,t,n){var r=Array.prototype.slice.call(arguments,3),i=function(){n(r)};window.addEventListener?e.addEventListener(t,i,!1):e.attachEvent("on"+t,i)}},r={searchPage:"http://api.so.lianmeng.360.cn/searchthrow/api/ads/throw?",pos:{INLAY:0,LEFTBOTTOM:1,RIGHTBOTTOM:2,LEFT:3,RIGHT:4,TOP:5,BOTTOM:6},inject:{INLAY:1,FLOAT:2},jv:"1437124819535",floatPos:["","leftbottom","rightbottom","leftright","left","right","top","bottom","topbottom"],floatOrigin:["","body","browser"],floatDisplay:["","default","onScroll"]},i={PT:(new Date).getTime(),INLAY:0,FLOAT:0};n.isInIframe()?window.QIHOO_UNION=window.QIHOO_UNION||i:window.top.QIHOO_UNION=window.top.QIHOO_UNION||i;var s={sizeToAdnumber:{"960_90":4,"640_60":3,"300_250":3,"250_250":3,"160_600":7,"336_280":4},getAdNumber:function(e){var t=e.w+"_"+e.h;return this.sizeToAdnumber[t]||0}},o={sizeToAdnumber:{"960_90":27,"640_60":12,"300_250":12,"250_250":12,"160_600":15,"336_280":12},getAdNumber:function(e){var t=e.w+"_"+e.h,n=this.sizeToAdnumber[t]||0;if(0===n)if(e.h>=28&&e.h<=1024&&e.w>=103&&e.w<=1024){var r=Math.floor(e.w/103),i=Math.floor(e.h/28);r*i>50&&(i=Math.floor(50/r)),n=r*i}else n=0;return n}},u={getAdNumber:function(e){return 50}},a={getAdNumber:function(e){var t=0;if(e.h>=28&&e.h<=1024&&e.w>=120&&e.w<=1024){var n=Math.floor(e.w/120),r=Math.floor(e.h/28);n*r>50&&(r=Math.floor(50/n)),t=n*r}else t=0;return t}},f={getAdNumber:function(e){var t,n,r,i,s,o,u=e.w,a=e.h,f=32,l=86,c=86,h=180,p=180;if(90>u||90>a)return 0;for(var d=[],v=[],m=l;h>=m;m+=5)for(var g=c;p>=g;g+=5)n=Math.floor(u/m),r=Math.floor(a/g),r=Math.min(r,Math.floor(f/n)),i=Math.floor((u-m*n)/(n+1)),s=Math.floor((a-g*r)/(r+1)),t=Math.abs(i/s-1),o=Math.abs(m/(g-20)-1.8),r>0&&n>0&&i>1&&s>1&&d.push({column:n,line:r,unitWidth:m,unitHeight:g,spaceX:i,spaceY:s,rate:o});return v=d.sort(function(e,t){return e.spaceX+e.spaceY-(t.spaceX+t.spaceY)}).slice(0,10).sort(function(e,t){return e.rate-t.rate}),v[0].column*v[0].line}},l={getAdNumber:function(e){var t=e.w,n=e.h;if(200>t||48>n)return 0;var r=36,i=5,s=1,o=5,u=t-2*s-2*i,a=u,f=Math.max(0,n-r-o-2*s-2*i);t=a,n=f;var l=Math.floor(t/120),c=Math.floor(n/27);return l*c>32&&(c=Math.floor(32/l)),Math.max(1,c*l)}},c=window.QIHOO_UNION_F_SLOT||window.QIHOO_union_F_SLOT;if(""!==c.position){c.position=parseInt(c.position,10),c.display=""===c.display?1:parseInt(c.display,10),c.origin=""===c.origin?2:parseInt(c.origin,10);var h=r.floatPos[c.position]||"";"leftright"===h?(c.position=4,t(c),c.position=5,t(c)):"topbottom"===h?(c.position=6,t(c),c.position=7,t(c)):t(c)}})();