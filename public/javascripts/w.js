//
// w.js lib must require jQuery.js
window.W = (function(){
  var version = "1.0";

  var nsLoopFn = function(nsname, fn){
    var names = nsname.split(".");
    if (names[0]=="window"){
      names.shift();
    }
    var nsObj = window;
    var flag = true;
    var i=0, len = names.length;
    while(i<len && flag){
      var curname = names[i];
      flag = fn(curname, nsObj);
      if(flag)
        nsObj = nsObj[curname];
      i++;
    }
    return flag;
  };

  var namespaceUtils = {
    //
    // ==== Example
    // W.ns("Lecai.Global") => Lecai.Global = {}
    ns: function(nsname){
      nsLoopFn(nsname, function(name, obj){
        if (!(name in obj))
          obj[name] = {};
        return true;
      });
    },
    nsExisted: function(nsname){
      return nsLoopFn(nsname, function(name, obj){
        return (name in obj);
      });
    },
    getNS: function(objName) {
      return nsLoopFn(objName, function(name, obj){
        return (name in obj)?obj[name]:false;
      });
    }
  };

  var ua = navigator.userAgent.toLowerCase();
  var checkUA = function(keywords){
    return ua.indexOf(keywords)!=-1;
  };
  var browserUtils = {
    isMSIE7: (document.all && checkUA("msie 7.0")),
    isSafari: (window.openDatabase && checkUA("safari")),

    //
    // ==== Example
    // W.isMSIE => true
    isMSIE: checkUA("msie") && !checkUA("opera"),    // 匹配IE浏览器

    isOpera: checkUA("opera"),   // 匹配Opera浏览器
    isChrome: checkUA("chrome"),   // 匹配Chrome浏览器
    isFirefox: checkUA("gecko") && !checkUA("webkit"),   // 匹配Firefox浏览器

    //
    // ==== Example
    // W.getUrlParam("t","all") => "picture"
    getUrlParam: function (key, defV){
      var paramList = window.location.search.substring(1).split("&");
      var len = paramList.length;
      for(var i=0; i<len; i+=1){
        var p = paramList[i];
        if(p.indexOf(key+"=")==0)
          return p.substring(key.length+1);
      }
      return defV;
    },
    // ==== Example
    // http://xx.com/?color=black
    // W.replaceUrlParam("color","red") => http://xx.com/?color=red
    // http://xx.com/
    // W.replaceUrlParam("color","red") => http://xx.com/?color=red
    // http://xx.com/?size=big
    // W.replaceUrlParam("color","red") => http://xx.com/?size=big&color=red
    replaceUrlParam: function(key,value){
      var paramList = window.location.search.substring(1).split("&");
      var len = paramList.length;
      var exist=false;
      var href = "";
      for(var i=0;i<len;i+=1){
        var p = paramList[i];
        if (p.indexOf(key+"=") == 0){
          paramList[i] = key + "="+value;
          exist = true;
        }
      }
      if (exist == false){
        if(window.location.search != ""){
          href = window.location.href + "&" + key + "=" + value;
        }else{
          href = window.location.href + "?" + key + "=" + value;
        }

      }else{
        href = window.location.protocol + "//" + window.location.host + window.location.pathname + "?" + paramList.join("&");
      }
      return  href;
    }
  };

  var globalFn = {
    isEmpty: function(obj){
      return obj === null || obj === undefined || obj === "";
    }
  };

  return $.extend(namespaceUtils,globalFn,browserUtils);
})();

W.Array = {
  //
  // ==== Example
  // W.Array.indexOf(["a","b","c",function(ele){ return ele == "b" }]) => 1
  indexOf: function(arr, matchFn) {
    if(!arr || arr.length==0)
      return -1;
    var len = arr.length;
    for (var i=0; i<len; i++) {
      if (matchFn(arr[i]))
        return i;
    }
    return -1;
  },

  //
  // ==== Example
  // W.Array.last(["a","b","c"]) => "c"
  last: function(arr){
    return arr[arr.length - 1];
  },

  //
  // ==== Example
  // W.Array.empty([]) => true
  empty: function(arr){
    if(arr.length == 0)
      return true;
    else
      return false;
  }

};

W.String = {
  //
  // === Example
  // W.String.trim(" a b ") => "a b"
  trim: function(str) {
    return $.trim(str);
  },

  isEmpty: function(str) {
    return str === "";
  }
};

W.Object = {
  //
  // ==== Example
  // W.Object.isNull(null) => true
  isNull: function(obj){
    return obj == null;
  },
  //
  // ==== Example
  // W.Object.isUndefied(undefined) => true
  isUndefined: function(obj){
    return obj == undefined;
  },
  //
  // ====Example
  // W.Object.isEmpty(null) => true
  // W.Object.isEmpty(undefined) => true
  isEmpty: function(obj){
    return obj === null || obj === undefined;
  }
};