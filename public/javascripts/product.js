(function(){

  W.ns("Weiyi.Product");

  Weiyi.Product = {
    changeColor: function(color){
      window.location.href = W.replaceUrlParam("color",color);
    },
    changePrice: function(price){
      window.location.href = W.replaceUrlParam("price",price);
    },
    changeMianliao: function(mianliao){
      window.location.href = W.replaceUrlParam("mianliao",mianliao);
    },
    changeSort: function(sort){
      window.location.href = W.replaceUrlParam("sort",sort);
    },
    changePinpai: function(pinpai){
      window.location.href = W.replaceUrlParam("pinpai",pinpai);
    }
  }

})()