// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract DigitalAssetsMarketplace is ERC721 {
    struct Asset {
        string assetId;
        address seller;
        string assetLink;
        uint256 price;
    }

    mapping(string => Asset) public assets;

    event AssetCreated(
        string assetId,
        address indexed seller,
        string assetLink,
        uint256 price
    );
    event AssetSold(
        string assetId,
        address indexed seller,
        address indexed buyer,
        string assetLink,
        uint256 price
    );

    constructor() ERC721("DigitalAssetsMarketplace", "DAM") {}

    function createAsset(
        string memory assetId,
        string memory assetLink,
        uint256 price
    ) public {
        uint256 assetUintId = uint256(keccak256(abi.encodePacked(assetId)));
        require(!_exists(assetUintId), "Asset already exists");
        _mint(msg.sender, assetUintId);
        Asset memory newAsset = Asset(assetId, msg.sender, assetLink, price);
        assets[assetId] = newAsset;

        emit AssetCreated(assetId, msg.sender, assetLink, price);
    }

    function buyAssets(string[] memory assetIds) public payable {
        uint256 totalCost = 0;
        for (uint256 i = 0; i < assetIds.length; i++) {
            Asset memory asset = assets[assetIds[i]];
            totalCost += asset.price;
        }

        require(
            msg.value >= totalCost,
            "Insufficient funds to purchase assets"
        );

        for (uint256 i = 0; i < assetIds.length; i++) {
            Asset memory asset = assets[assetIds[i]];
            uint256 assetUintId = uint256(
                keccak256(abi.encodePacked(assetIds[i]))
            ); 

            // Pay the seller
            payable(asset.seller).transfer(asset.price);

            emit AssetSold(assetIds[i], asset.seller, msg.sender, asset.assetLink, asset.price);
        }
    }
}
