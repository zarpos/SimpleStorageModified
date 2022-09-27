// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// We are importing a contract from npm that has been deployed in github first.

library PriceConverter {
    // All functions in an library must be internal.

    function getPrice(AggregatorV3Interface priceFeed)
        internal
        view
        returns (uint256)
    {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        // This is refering the price of ETH in USD
        return uint256(price * 1e10); // This line is to add the decimals as they give us the price with no decimals.
    }

    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            // Rinkeby 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
        return priceFeed.version();
    }

    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        // This function will allow us change the msg.value that is set in ETH, change it to USD
        uint256 ethPrice = getPrice(priceFeed);
        // In the line above us we are calling the function getPrice to get in real time the Ethereum price.
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        // Then to withdraw the money, we multiply the amount of ETH by it price and then we divide it (to get rid off so many decimals) and get the price in USD
        return ethAmountInUsd;
    }
}
