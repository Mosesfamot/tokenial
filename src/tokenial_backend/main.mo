import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor Tokenial {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show (startTime));

  let id = 32454635475867866567; 
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //topUp();

  //Allow users to withdrawl an amount from the currentValue
  //Decrease the currentValue by the amount

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Withdrawal amount larger than account size. Input a lesser amount");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

} 