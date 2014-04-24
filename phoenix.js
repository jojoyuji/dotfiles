/**
* Global Settings
*/
var mash = ["alt"];
var mashShift = ["alt", "shift"];
var threeMash = ["alt", "cmd", "ctrl"];
var padding = 0;

var previousSizes = {};
var previousPositions = {};


/**
* Upgrade Phoenix Window
*/

Window.prototype.moveToScreen = function(screen) {
  if (!screen) {
    return;
  }
  var frame = this.frame();
  var oldScreenRect = this.screen().frameWithoutDockOrMenu();
  var newScreenRect = screen.frameWithoutDockOrMenu();
  var xRatio = newScreenRect.width / oldScreenRect.width;
  var yRatio = newScreenRect.height / oldScreenRect.height;

  this.setFrame({
    x: (Math.round(frame.x - oldScreenRect.x) * xRatio) + newScreenRect.x,
    y: (Math.round(frame.y - oldScreenRect.y) * yRatio) + newScreenRect.y,
    width: Math.round(frame.width * xRatio),
    height: Math.round(frame.height * yRatio)
  });
};


Window.prototype.focusNextWindowsOnSameScreen = function() {
  var currentWindow = Window.focusedWindow();
  var windows = currentWindow.otherWindowsOnSameScreen();
  windows.push(currentWindow);
  windows = _.chain(windows).sortBy(function(window) { return window.app().pid}).value();
  windows[(_.indexOf(windows, currentWindow) + 1) % windows.length].focusWindow();
};


Window.prototype.focusNextScreen = function() {
  var windows = _.union(Window.visibleWindowsMostRecentFirst(), _.difference(this.otherWindowsOnAllScreens(), this.otherWindowsOnSameScreen()));
  if (windows.length > 2) {
    windows[1].focusWindow();
  }
};


Window.prototype.focusPreviousWindowsOnSameScreen = function() {
  var currentWindow = Window.focusedWindow();
  var windows = currentWindow.otherWindowsOnSameScreen()
  windows.push(currentWindow);
  windows = _.chain(windows).sortBy(function(window) { return window.app().pid}).value();
  windows[(_.indexOf(windows, currentWindow) - 1 + windows.length) % windows.length].focusWindow();
};



Window.prototype.toGrid = function( x, y, width, height ) {
  var screen = this.screen().frameWithoutDockOrMenu();

  this.setFrame({
    x: Math.round( x * screen.width ) + padding + screen.x,
    y: Math.round( y * screen.height ) + padding + screen.y,
    width: Math.round( width * screen.width ) - ( 2 * padding ),
    height: Math.round( height * screen.height ) - ( 2 * padding )
  });

  this.focusWindow();

  return this;
};

Window.prototype.toCenter = function() {

  var screen = this.screen().frameWithoutDockOrMenu();
  var app = this.frame();
  var offset = {
    x: (screen.width-app.width)/2,
    y: (screen.height-app.height)/2
  };
  this.setFrame( {
    x: Math.round(offset.x),
    y: Math.round(offset.y),
    width: Math.round(app.width),
    height: Math.round(app.height)
  });


  this.focusWindow();
  return this;
}

Window.prototype.toFullScreen = function() {
  return this.toGrid( 0, 0, 1, 1 );
};

Window.prototype.toggleFullscreen = function() {
  if ( previousSizes[ this ] ) {
    this.setFrame( previousSizes[ this ] );
    delete previousSizes[ this ];
  }
  else {
    previousSizes[ this ] = this.frame();
    this.toFullScreen();
  }

  return this;
};

Window.prototype.snap = function(type, direction) {
  var percent = 1/type;
  var app = this.frame();
  switch(direction){
    case 'left':
      app.width = percent;
      app.x = 0;
      app.y = 0;
      break;
    case 'right':
      app.width = percent;
      app.x = 1 - app.width;
      app.y = 0;
      break;
    case 'top':
      app.height = percent;
      app.x = 0;
      app.y = 0;
      break;
    case 'bottom':
      app.height = percent;
      app.y = 1 - app.height;
      app.x = 0;
      break;

  }

  return this.toGrid( app.x, app.y, app.width, app.height );
};

/**
* My Settings
*/

// Launch App
//api.bind('`', mash, function() { api.launch('iTerm'); });
//api.bind('1', mash, function() { api.launch('Firefox'); });
//api.bind('2', mash, function() { api.launch('Google Chrome'); });
//api.bind('3', mash, function() { api.launch('QQ'); });
//api.bind('a', mash, function() { api.launch('MacVim'); });
//api.bind('s', mash, function() { api.launch('IntelliJ IDEA 13'); });

/**********
*  JOjo  *
**********/

//nextScreen
api.bind('t', ['cmd', 'ctrl'], function() {
  Window.focusedWindow().moveToScreen(Window.focusedWindow().screen().nextScreen());
});
//center
api.bind('y', ['cmd', 'ctrl'], function() {
  Window.focusedWindow().toCenter();
});

// maximize
api.bind('m', ['alt','cmd','ctrl'], function() {
  Window.focusedWindow().toggleFullscreen()
});

// 1/5
api.bind('left', ['cmd'], function() { Window.focusedWindow().snap(5,'left'); });
api.bind('right', ['cmd'], function() { Window.focusedWindow().snap(5,'right'); });
api.bind('up', ['cmd'], function() { Window.focusedWindow().snap(5,'top'); });
api.bind('down', ['cmd'], function() { Window.focusedWindow().snap(5,'bottom'); });

// 1/4
api.bind ( 'left',  ['cmd', 'alt'], function() { Window.focusedWindow ().snap (3,'left'); });
api.bind ( 'right', ['cmd', 'alt'], function() { Window.focusedWindow ().snap (3,'right'); });
api.bind ( 'up',    ['cmd', 'alt'], function() { Window.focusedWindow ().snap (3,'top'); });
api.bind ( 'down',  ['cmd', 'alt'], function() { Window.focusedWindow ().snap (3,'bottom'); });

// 1/2
api.bind ( 'left',  ['cmd', 'alt', 'ctrl'], function() { Window.focusedWindow ().snap (2,'left'); });
api.bind ( 'right', ['cmd', 'alt', 'ctrl'], function() { Window.focusedWindow ().snap (2,'right'); });
api.bind ( 'up',    ['cmd', 'alt', 'ctrl'], function() { Window.focusedWindow ().snap (2,'top'); });
api.bind ( 'down',  ['cmd', 'alt', 'ctrl'], function() { Window.focusedWindow ().snap (2,'bottom'); });

// 4/5
api.bind ( 'left',  ['cmd', 'alt', 'ctrl', 'shift'], function() { Window.focusedWindow ().snap (1.25,'left'); });
api.bind ( 'right', ['cmd', 'alt', 'ctrl', 'shift'], function() { Window.focusedWindow ().snap (1.25,'right'); });
api.bind ( 'up',    ['cmd', 'alt', 'ctrl', 'shift'], function() { Window.focusedWindow ().snap (1.25,'top'); });
api.bind ( 'down',  ['cmd', 'alt', 'ctrl', 'shift'], function() { Window.focusedWindow ().snap (1.25,'bottom'); });
/*************
*  endJojo  *
*************/


// Multi screen
api.bind('l', mash, function() {
  Window.focusedWindow().focusNextScreen();
});
api.bind('h', mash, function() {
  Window.focusedWindow().focusNextScreen();
});
api.bind('h', mashShift, function() {
  Window.focusedWindow().moveToScreen(Window.focusedWindow().screen().previousScreen());
});

// Window
//api.bind('m', mash, function() {
//Window.focusedWindow().maximize();
//});

api.bind('j', mash, function() {
  var window = Window.focusedWindow();
  if (window === undefined) {
    Window.visibleWindowsMostRecentFirst()[0].focusWindow();
    return;
  }
  window.focusNextWindowsOnSameScreen();
});
api.bind('k', mash, function() {
  var window = Window.focusedWindow();
  if (window === undefined) {
    Window.visibleWindowsMostRecentFirst()[0].focusWindow();
    return;
  }
  window.focusPreviousWindowsOnSameScreen();
});

