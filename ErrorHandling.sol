// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ErrorHandling {

    //I have made this ErrorHandling contract to show the difference between 'require', 'assert' and 'revert' statements.
    // this contract will check the age eligibility for applying passport in different countries.

    struct ContuntryAgeEligibility {
        string country;
        uint age;
    }

    ContuntryAgeEligibility[] public countryAgeEligibility;

    constructor() {
        countryAgeEligibility.push(ContuntryAgeEligibility("IND", 18));
        countryAgeEligibility.push(ContuntryAgeEligibility("USA", 16));
        countryAgeEligibility.push(ContuntryAgeEligibility("AUS", 12));
    }


    //using 'require' statement

    function passportAcceptanceRequire(string memory _country, uint _age) public view returns(string memory) {
        for(uint i=0; i<countryAgeEligibility.length; i++) {
            if(keccak256(abi.encodePacked(countryAgeEligibility[i].country)) == keccak256(abi.encodePacked(_country))) {
                require(_age >= countryAgeEligibility[i].age, "Passport Rejected you are too young to apply");
                return "Passport Accepted";
            }
        }
        return "Country not found";
    }



    // using 'assert' statement

    function passportAcceptanceAssert(string memory _country, uint _age) public view returns(string memory) {
        for(uint i=0; i<countryAgeEligibility.length; i++) {
            if(keccak256(abi.encodePacked(countryAgeEligibility[i].country)) == keccak256(abi.encodePacked(_country))) {
                assert(_age >= countryAgeEligibility[i].age);
                return "Passport Accepted";
            }
        }
        return "Country not found";
    }

    //using 'revert' statement

    function passportAcceptanceRevert(string memory _country, uint _age) public view returns(string memory) {
        for(uint i=0; i<countryAgeEligibility.length; i++) {
            if(keccak256(abi.encodePacked(countryAgeEligibility[i].country)) == keccak256(abi.encodePacked(_country))) {
                if(_age >= countryAgeEligibility[i].age) {
                    return "Passport Accepted";
                } else {
                    revert("Passport Rejected You are too young to apply");
                }
            }
        }
        return "Country not found";
    }


    function showCountryName() public view returns(string memory) {
        string memory countries;
        for(uint i=0; i<countryAgeEligibility.length; i++) {
            countries = string(abi.encodePacked(countries, countryAgeEligibility[i].country, " "));
        }
        return countries;
    }
    
}      
