// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ErrorHandling {


    //using 'require' 

    function usingRequire (address add) public view{

        require(add == msg.sender, "Invalid owner");

    }

    //using 'assert' 

    function usingAssert ( uint a, uint b) public pure returns(uint){
        
        assert(b!=0);
        return a/b;
    }

    //using 'revert' 

    function usingRevert (uint a, uint b) public pure returns(uint){
        if(b==0){
            revert("Cannot divide by zero");
        }
        else{
            return a/b;
            
        }
    }


    
}      
