var http = require('http'), 
    spawn = require('child_process').spawn,
    child;

var play = exports;

play.playerList = [
  'afplay',
  'play' 
];

exports.sound = function(file, callback) {
  if (play.playerList.length == 0) { 
    console.log('No suitable audio player could be found - exiting.');
    return true; 
  }
  var command = [file];
  var child = spawn(play.playerList[0], command);
  
  child.stderr.setEncoding('ascii');
  child.on('exit', function (code, signal) {
    
    if(code == null || signal != null || code === 1) {
      console.log('couldnt play, had an error ' + '[code: '+ code + '] ' + '[signal: ' + signal + ']');
    }
    else if(code == 127){
      play.playerList.shift();
      play.sound(file, callback);
    }else if (code == 2) {
      console.log(file + ' => could not be read by your player.')
    }
    else{
      // console.log( 'completed'.green + '=>'.yellow + file.magenta);
      callback();
    }
  });
  

}