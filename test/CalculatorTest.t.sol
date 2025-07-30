//SPDX-License-Identifier: MIT

pragma solidity 0.8.29;

import "forge-std/Test.sol";
import "../src/Calculator.sol";

contract CalculatorTest is Test{

    Calculator calculator;
    uint256 public firstResult = 100;
    address public admin = vm.addr(1); //it creates a invented address
    address public randomUser = vm.addr(2);

    // It is what is executed before every test
    function setUp() public{
        calculator = new Calculator(firstResult, admin);
    }

    // Unit testing = given inputs
    function testCheckFirstResult() public view{
        uint256 firstResult_ = calculator.result();
        assert(firstResult_ == firstResult);

    } 

    function testAddition() public{
        uint256 num1_ = 5;
        uint256 num2_ = 5;

        uint256 result_ = calculator.addition(num1_,num2_);

        assert (result_ == num1_ + num2_);
    }

    function testSubstraction() public{
        uint256 num1_ = 5;
        uint256 num2_ = 5;

        uint256 result_ = calculator.substraction(num1_,num2_);

        assert (result_ == num1_ - num2_);
    }

     function testMultiplier() public{
        uint256 num1_ = 5;
        uint256 num2_ = 5;

        uint256 result_ = calculator.multiplier(num1_, num2_);

        assert(result_ == num1_ * num2_);
    }

     function testDivisionDefaultUser() public{
        uint256 num1_ = 5;
        uint256 num2_ = 5;
        console.log(msg.sender);
        vm.expectRevert();
        calculator.division(num1_, num2_); 
    }

    // Function expected to fail
    function testCannotMultiply2LargeNumbers() public{
        uint256 num1_ = 111111111111111111111113283849849849893849839489999999999646464668767556755677;
        uint256 num2_ = 5;

        vm.expectRevert();
        calculator.multiplier(num1_, num2_);
    }

    function testIfNotAdminCallsDivisionReverts() public {
        vm.startPrank(randomUser);

        uint256 num1_ = 5;
        uint256 num2_ = 5;
        vm.expectRevert();
        calculator.division(num1_, num2_);

        vm.stopPrank();
    }

    function testAdminCanCallDivision() public{
        vm.startPrank(admin);

        uint256 num1_ = 5;
        uint256 num2_ = 5;
        calculator.division(num1_, num2_);

        vm.stopPrank();
    }

    function testDivisionExecutedCorrectly() public{
        vm.startPrank(admin);

        uint256 num1_ = 5;
        uint256 num2_ = 2;
        uint256 result_ = calculator.division(num1_, num2_);

        assert(result_ == num1_ / num2_);
        vm.stopPrank();
    }

    function testCannotDivideByZero() public{
        vm.startPrank(admin);

        uint256 num1_ = 5;
        uint256 num2_ = 0;
        vm.expectRevert();
        calculator.division(num1_, num2_);

        vm.stopPrank();
    }

    // Fuzzing testing = random inputs

    function testFuzzingDivision(uint256 num1_, uint256 num2_) public {
        vm.startPrank(admin);

        calculator.division(num1_, num2_);

        vm.stopPrank();
    }

}
