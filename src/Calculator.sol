//SPDX-License-Identifier: MIT

pragma solidity 0.8.29;

contract Calculator{

    // Variables
    uint256 public result;
    address public admin;

    // Events
    event Addition(uint256 num1_, uint256 num2_, uint256 result_);
    event Substraction(uint256 num1_,uint256 num2_,uint256 result_);
    event Multiplier(uint256 num1_,uint256 num2_,uint256 result_);
    event Division(uint256 num1_,uint256 num2_,uint256 result_);

    //Modifier
    modifier onlyAdmin(){
        require (msg.sender == admin, "Not allowed");
        _;
    }

    constructor (uint256 firstResult_, address admin_){
        result = firstResult_;
        admin = admin_;
    } 

    //Functions

    // Addition
    function addition (uint256 num1_, uint256 num2_) external returns(uint256 result_){
        result_ = num1_ + num2_;
        result = result_;

        emit Addition(num1_, num2_, result_);
    }

    // Substraction
    function substraction (uint256 num1_, uint256 num2_) external returns(uint256 result_){
        result_ = num1_ - num2_;
        result = result_;

        emit Substraction(num1_, num2_, result_);

    }

    // Multiplier
    function multiplier(uint256 num1_, uint256 num2_) external returns(uint256 result_){
        result_ = num1_ * num2_;
        result = result_;

        emit Multiplier(num1_, num2_, result_);

    }

    //Division
    function division(uint256 num1_, uint256 num2_) external onlyAdmin returns(uint256 result_){
        if (num2_ == 0 ) return 0;
        result_ = num1_ / num2_;
        result = result_;

        emit Division(num1_, num2_, result_);
    }
}