# Functions and Errors

This project is to demonstrate the use of assert(), revert() and require() statements

## Description

* The assert() takes only one parameter as input, that is, the condition. If the conditions is true the execution continues.
  Here The usingAssert() function takes two parameters (uint a, uint b) and returns the value of (a/b). And the assert() handler makes sure the value of 'b' is not 0.
  ```shell
  function usingAssert ( uint a, uint b) public pure returns(uint){
        
        assert(b!=0);
        return a/b;
    }
  ```
* The revert() can be used as flagging mechanism, it reverts all the changes back to initial state thus saving further gas loss.
 Here The usingRevert() function also takes two parameters (uint a, uint b) and returns the value of (a/b). And if the value of 'b' is 0 then the revert() handler reverts the whole state with a message "Cannot divide by zero". if b!=0 then the execution will continue.
  ```shell
  function usingRevert (uint a, uint b) public pure returns(uint){
        if(b==0){
            revert("Cannot divide by zero");
        }
        else{
            return a/b;
            
        }
    }
  ```
* The require() statement has two parameters, one the the condition, second is the message that is to be dysplayed if the condition fails (second condition is optional)
 Here The usingRequire() function takes a parameters (address add). And the require() handler makes sure that the add is of the message.sender else "Invalid owner" message will be displayed.
  ```shell
  function usingRequire (address add) public view{

        require(add == msg.sender, "Invalid owner");

    }
  ```
  
## Authors

* Name: Vibhansh Alok
* MetacrafterID: RuffledZest (vibhanshalok@gmail.com)
* Loom Video Link: https://www.loom.com/share/5c4b607a3ab34dbeac899468e0b29d0c

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
