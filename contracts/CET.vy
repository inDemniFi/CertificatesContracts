# Define the Crypto Exploit Technician (CET) NFT contract
# pragma solidity ^0.8.0;

# Import necessary ERC721 interfaces
# ...

# Contract definition
contract CryptoExploitTechnicianNFT is ERC721 {
    # Variables to track metadata
    mapping(uint256 => uint256) public exploitCount;  # Track number of exploits
    mapping(uint256 => uint256) public dateEarned;    # Track date earned
    mapping(uint256 => string) public roleOfCET;      # Track role of CET
    
    # Constructor to initialize the contract
    constructor() ERC721("CryptoExploitTechnician", "CET") {
        # Contract initialization
        # ...
    }

    # Mint function to create new NFTs
    function mint(address to, uint256 tokenId) external {
        # Mint the NFT and assign to 'to' address
        _safeMint(to, tokenId);
        
        # Set initial metadata
        exploitCount[tokenId] = 0;
        dateEarned[tokenId] = block.timestamp;  # Set the date earned as the current block timestamp
        roleOfCET[tokenId] = "Crypto Exploit Technician";  # Set the initial role
        
        # Emit event for minting
        # ...
    }

    # Function to update metadata - increase complexity of role
    function updateRole(uint256 tokenId, string memory newRole) external {
        require(ownerOf(tokenId) == msg.sender, "You are not the owner of this NFT");
        
        # Update the role of the CET
        roleOfCET[tokenId] = newRole;
        
        # Emit event for role update
        # ...
    }

    # Function to increment exploit count
    function incrementExploitCount(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "You are not the owner of this NFT");
        
        # Increase the exploit count
        exploitCount[tokenId]++;
        
        # Emit event for exploit count increment
        # ...
    }
}
