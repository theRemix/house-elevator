import js.Node;

class House
{
  public static var play = Node.require('./play.js');
  public static inline var STORIES:Int = 5;
  public static inline function music(floors:Int, done:Void->Void):Void
  {
    // cap floors at 5
    if(floors > STORIES) floors = STORIES;
    // no loitering!
    else if(floors < 1) floors = 1;
    
    play.sound('./bin/${floors}floors.wav', done);
  }
}