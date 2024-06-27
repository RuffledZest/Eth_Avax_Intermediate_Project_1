# Functions and Errors: Passport Eligibility

This project demonstrates the use of assert(), revert(), and require() statements in Solidity.

## Description

The contract "ErrorHandling" checks the age eligibility for applying for a passport in different countries using require, assert, and revert statements.

* require() Statement

The require() statement is used to validate inputs and conditions before execution. If the condition is false, it reverts the transaction with an optional error message, saving gas.

```solidity
function passportAcceptanceRequire(string memory _country, uint _age) public view returns(string memory) {
    for(uint i = 0; i < countryAgeEligibility.length; i++) {
        if(keccak256(abi.encodePacked(countryAgeEligibility[i].country)) == keccak256(abi.encodePacked(_country))) {
            require(_age >= countryAgeEligibility[i].age, "Passport Rejected you are too young to apply");
            return "Passport Accepted";
        }
    }
    return "Country not found";
}
```

* assert() Statement

The assert() statement is used to check for conditions that should never be false. If the condition is false, it uses up all gas and reverts the transaction.

```solidity
function passportAcceptanceAssert(string memory _country, uint _age) public view returns(string memory) {
    for(uint i = 0; i < countryAgeEligibility.length; i++) {
        if(keccak256(abi.encodePacked(countryAgeEligibility[i].country)) == keccak256(abi.encodePacked(_country))) {
            assert(_age >= countryAgeEligibility[i].age);
            return "Passport Accepted";
        }
    }
    return "Country not found";
}
```

* revert() Statement

The revert() statement is used to flag an error and revert the transaction with an optional error message.

```solidity
function passportAcceptanceRevert(string memory _country, uint _age) public view returns(string memory) {
    for(uint i = 0; i < countryAgeEligibility.length; i++) {
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
```

* Show Country Names

The showCountryName() function returns a string of all country names in the eligibility list.

```solidity
function showCountryName() public view returns(string memory) {
    string memory countries;
    for(uint i = 0; i < countryAgeEligibility.length; i++) {
        countries = string(abi.encodePacked(countries, countryAgeEligibility[i].country, " "));
    }
    return countries;
}
```

## Authors

- Name: Vibhansh Alok
- MetacrafterID: RuffledZest (vibhanshalok@gmail.com)
- Loom Video Link: https://www.loom.com/share/ee7a9ed81b5a453eae283438b1ca42e6

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
