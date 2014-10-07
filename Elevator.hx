import js.Node;
class Elevator
{

  public var floor:Int;
  public var isTravelling:Bool;

  public function new(){
    this.floor = 1;
    isTravelling = false;
  }

  // absolute
  public function goto(floor:Int):Void
  {
    var travel = floor - this.floor;

    if( travel < 0 ){ // going down
      // cap a max floors
      if(travel - floor < 1){
        Node.console.log("not allowed in the basement");
        travel = 0; // not allowed
      }
    }else if( travel > 0 ){
      
    }else{
      Node.console.log("staying on this floor.");
      return;
    }
    
    travelto(travel);
  }

  // -1 down
  public function travelto(floors:Int):Void
  {
    this.isTravelling = true;
    var floors_to_travel = Std.int( Math.abs( cast(floors,Float) ) );
    Node.console.log('going ${(floors<0)?"down":"up"} ${floors_to_travel} floors');
    House.music( floors_to_travel, doneTravelling);
    floor += floors;
  }

  public function doneTravelling():Void
  {
    this.isTravelling = false;
  }


}