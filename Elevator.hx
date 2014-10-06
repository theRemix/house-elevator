class Elevator
{

  public var floor:Int;

  public function new(){
    
  }

  public function goto(floor:Int):Void
  {
    this.floor = floor;
    trace('going to floor $floor');
  }
}