
var hyper = function (key) {
  return key + ":cmd,ctrl,alt,shift";
};

var fullscreen = slate.operation("move", {
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX",
  "height": "screenSizeY"
});

var pushLeft = slate.operation("push", {
  "direction": "left",
  "style": "bar-resize:screenSizeX/2"
});
var pushRight = pushLeft.dup({"direction": "right"});


var hint = slate.operation("hint", {
  "characters": "ASDFGHJKLQWERTYUIOPCVBN"
});

// direction: 0=left, 1=top, 2=right, 3=bottom
var tolerance = function (win, direction) {
  var app = win.app();
  if (app.name() === "MacVim") {
    return 20;
  }
  return 5;
};

var isWindowOnLeftHalf = function (win) {
  var win_rect = win.rect();
  var screen_rect = win.screen().visibleRect();

  return Math.abs(win_rect.x - screen_rect.x) < tolerance(win, 0) &&
    Math.abs(win_rect.y - screen_rect.y) < tolerance(win, 1) &&
    Math.abs(win_rect.width - screen_rect.width / 2) < tolerance(win, 2) &&
    Math.abs(win_rect.height - screen_rect.height) < tolerance(win, 3);
};

var isWindowOnRightHalf = function (win) {
  var win_rect = win.rect();
  var screen_rect = win.screen().visibleRect();

  return Math.abs(win_rect.x - screen_rect.x - screen_rect.width / 2) < tolerance(win, 0) &&
    Math.abs(win_rect.y - screen_rect.y) < tolerance(win, 1) &&
    Math.abs(win_rect.width - screen_rect.width / 2) < tolerance(win, 2) &&
    Math.abs(win_rect.height - screen_rect.height) < tolerance(win, 3);
};

var cycleLeft = function (win) {
  if (isWindowOnLeftHalf(win)) {
    var currentScreen = win.screen().id();
    var targetScreen = currentScreen - 1;
    if (targetScreen < 0) {
      targetScreen = slate.screenCount() - 1;
    }
    win.doOperation(slate.operation('throw', {
      'screen': targetScreen,
      "x": "screenOriginX+screenSizeX/2",
      "y": "screenOriginY",
      "width": "screenSizeX/2",
      "height": "screenSizeY"
    }));
  } else {
    win.doOperation(pushLeft);
  }
};

var cycleRight = function (win) {

  if (isWindowOnRightHalf(win)) {
    var currentScreen = win.screen().id();
    var targetScreen = currentScreen + 1;
    if (targetScreen >= slate.screenCount()) {
      targetScreen = 0;
    }
    win.doOperation(slate.operation('throw', {
      'screen': targetScreen,
      "x": "screenOriginX",
      "y": "screenOriginY",
      "width": "screenSizeX/2",
      "height": "screenSizeY"
    }));
  } else {
    win.doOperation(pushRight);
  }
};


// PUSH

//slate.bind(hyper("j"), cycleLeft);
//slate.bind(hyper("k"), cycleRight);

slate.bind(hyper("j"), fullscreen);
slate.bind(hyper("h"), pushLeft);
slate.bind(hyper("l"), pushRight);


// FOCUS
//slate.bind("h:cmd", slate.operation("focus", {"direction": "left"}));
//slate.bind("l:cmd", slate.operation("focus", {"direction": "right"}));
//slate.bind("j:cmd", slate.operation("focus", {"direction": "up"}));
//slate.bind("k:cmd", slate.operation("focus", {"direction": "down"}));

// OTHER
slate.bind(hyper("space"), hint);
slate.bind(hyper("u"), slate.operation("undo"));
//slate.config("windowHintsIgnoreHiddenWindows", false);
//slate.config("windowHintsShowIcons", true);
slate.config("focusPreferSameApp", false);
slate.config("windowHintsFontSize", 60);
slate.config("windowHintsWidth", 200);
slate.config("windowHintsHeight", 200);
slate.config("windowHintsFontName", "Helvetica Bold");
slate.config("windowHintsBackgroundColor", "50;53;58;0.9");
slate.config("windowHintsFontColor", "255;13;255;0.8");
//slate.config("windowHintsShowIcons", false);
// Helper functions for debugging
/*
slate.bind("1:ctrl", function(win) {
  var rect = win.rect();
  slate.log('win    x='+rect.x+' y='+rect.y+' w='+rect.width+' h='+rect.height);
  var srect = win.screen().visibleRect();
  slate.log('screen x='+srect.x+' y='+srect.y+' w='+srect.width+' h='+srect.height);
  slate.log('isLeft = '+isWindowOnLeftHalf(win));
  slate.log('isRight = '+isWindowOnRightHalf(win));
  var app = win.app();
  slate.log('app name="'+app.name()+'"');
});

slate.bind("0:ctrl", slate.operation("relaunch"));
// */
