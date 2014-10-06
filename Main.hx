import js.Node;
class Main
{
  public static var readlineSync = Node.require('readline-sync');

  public function new()
  {
    var elevator = new Elevator();
    var in_house = true;
    while(in_house){
      var result = readlineSync.question("What floor sir? ");
    
      if(Std.parseInt(result) != null){
        elevator.goto(Std.parseInt(result));
      }else if(result == "q" || result == "exit" || result == "bye"){
        // leave house
        in_house = false;
      }
    }
  }

  static public function main()
  {
    var app = new Main();
  }
}