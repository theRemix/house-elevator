import js.Node;
import haxe.Timer;
class Main
{
  private static inline var PROMPT:String = "What floor sir? ";
  private static inline var PROMPT_INIT:String = "What floor sir? (type 'help' for usage) ";
  public static var readlineSync = Node.require('readline-sync');

  public var elevator:Elevator;
  public var prompt:String;
  public var timer:Timer;
  public function new()
  {
    Node.console.log("HOUSE ELEVATOR!!!!!");
    elevator = new Elevator();
    prompt = PROMPT_INIT;

    timer = new Timer(50);
    timer.run = checkReady;
  }

  public function ready():Void
  {
    var result = readlineSync.question( prompt );
    
    if(prompt != PROMPT) prompt = PROMPT;

    if( StringTools.startsWith(result, "+") ){ // stuff that should be in Elevator
      
      var floors = Std.parseInt( result.substr(1) );
      if( floors != null ){
        elevator.travelto(floors);
      }

    }else if( StringTools.startsWith(result, "-") ){
      
      var floors = Std.parseInt( result );
      if( floors != null ){
        elevator.travelto(floors);
      }

    }else if(Std.parseInt(result) != null){ // absolute

      elevator.goto(Std.parseInt(result));

    }else if(result == "q" || result == "exit" || result == "bye"){
      // leave house
      // exit app
      timer.stop();
    }else{
      // bad command
      prompt = PROMPT_INIT;
    }
  }

  // pretend blocking execution, wait for elevator to "arrive"
  public function checkReady():Void
  {
    if(!elevator.isTravelling){
      ready();
    }
  }

  static public function main()
  {
    var app = new Main();
  }
}