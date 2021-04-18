pragma solidity ^0.5.16;

// Import ERC721 contract from Open Zeppelin lib
import "./ERC721Full.sol";

/**
 * The Color contract
 */
contract Color is ERC721Full {

	// Store colors
	string[] public colors;

	// Colors are registered
	mapping(string => bool) _colorExists;

	// ERC721 Constructor 
	constructor() ERC721Full("Color", "COLOR") public {
	}

	// Mint colors
	function mint (string memory _color) public {
		
		// Check if color exists
		require(!_colorExists[_color]);

		// Add Color & used is true 
		uint _id = colors.push(_color);
		_colorExists[_color] = true;

		// Mint a color with _mint from OZ_ERC721
		_mint(msg.sender, _id);

	}
	
}