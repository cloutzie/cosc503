// Working

javascript:
var autoclicker = setInterval(function(){
    try {
      for(var i = 0; i < 100; i++) {
          Game.ClickCookie();
          Game.lastClick = 0;
    }} catch (err) {
      console.error('Stopping auto clicker');
      clearInterval(autoclicker);
    }
  }, 1);


// Test Build

javascript:
(function(){
    if(window._activeClickInterval){
        clearInterval(window._activeClickInterval);
        delete window._activeClickInterval
    }else{
        window._activeClickInterval=setInterval(function(){
            for(var i = 0; i < 100; i++) {
                Game.ClickCookie();
                Game.lastClick = 0;
            }
          },1)}})();
