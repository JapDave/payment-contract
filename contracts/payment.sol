// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract Gateway{

    mapping(address=>uint256) public AddressToAmount;
    address payable owner = 0xeB4F9D171De4E52354Ec8E87FDC4d627ceD4F41E;
    AggregatorV3Interface public priceFeed;

    
    constructor(address _priceFeed) public {
        priceFeed = AggregatorV3Interface(_priceFeed);
        owner = msg.sender;
    }

    function fund() public payable {
        owner.transfer(msg.value);
    }

    function getPrice() public view returns (uint256) {
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

}


  
    // function getPrice() public view returns (uint256) {
    //     (, int256 answer, , , ) = priceFeed.latestRoundData();
    //     return uint256(answer * 10000000000);
    // }

    // // 1000000000
    // function getConversionRate(uint256 ethAmount)
    //     public
    //     view
    //     returns (uint256)
    // {
    //     uint256 ethPrice = getPrice();
    //     uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
    //     return ethAmountInUsd;
    // }

