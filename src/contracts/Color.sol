pragma solidity ^0.5.16;

// Import ERC721 contract from Open Zeppelin lib
import "./ERC721Full.sol";

/**
 * The Color contract
 */
contract Color is ERC721Full {

	//IDs
	uint id = 0;
	
	// Store colors
	string[] public colors;

	// Colors are registered
	mapping(string => bool) _colorExists;

	//Colors from user
	mapping(uint => string) _color4user;

	// ERC721 Constructor 
	constructor() ERC721Full("Color", "COLOR") public {
	}

	// Mint colors
	function mint (string memory _color) public {
		
		// Check if color exists
		require(!_colorExists[_color]);

		// Add Color & used is true
		_color4user[id] = _color;
		_colorExists[_color] = true;

		// Mint a color with _mint from OZ_ERC721
		_mint(msg.sender, id);

		id++;

	}

	// Check colors minted by user
	function checkColor (uint _idreact, address _address) public view returns (string memory){
		uint _id_ =  _tokensOfOwner(_address)[_idreact];
		return _color4user[_id_];
	}
	
}