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

    event AssetCreated(string assetId, address indexed seller, string assetLink, uint256 price);
    event AssetSold(string assetId, address indexed seller, address indexed buyer, uint256 price);

    constructor() ERC721("DigitalAssetsMarketplace", "DAM") {}

    function createAsset(string memory assetId, string memory assetLink, uint256 price) public {
        uint256 assetUintId = uint256(keccak256(abi.encodePacked(assetId)));
        require(!_exists(assetUintId), "Asset already exists");
        _mint(msg.sender, assetUintId);
        Asset memory newAsset = Asset(assetId, msg.sender, assetLink, price);
        assets[assetId] = newAsset;

        emit AssetCreated(assetId, msg.sender, assetLink, price);
    }

    function buyAsset(string memory assetId) public payable {
        Asset memory asset = assets[assetId];
        require(msg.value >= asset.price, "Insufficient funds to purchase asset");

        // Transfer the asset to the buyer
        uint256 assetUintId = uint256(keccak256(abi.encodePacked(assetId)));
        _transfer(asset.seller, msg.sender, assetUintId);

        // Pay the seller
        payable(asset.seller).transfer(asset.price);

        emit AssetSold(assetId, asset.seller, msg.sender, asset.price);
    }
}