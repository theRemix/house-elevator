import js.Node;

class House
{
  public static var player = Node.require('play');
  public static inline function play(floors:Int, done:Void->Void):Void
  {
    // cap floors at 5
    if(floors > 5) floors = 5;
    // no loitering!
    else if(floors < 1) floors = 1;

    player.sound('./bin/${floors}floors.wav', done);
  }
}