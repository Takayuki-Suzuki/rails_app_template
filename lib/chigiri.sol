pragma solidity ^0.4.0;
contract Chigiri {
    address owner;

    struct Relation {
        uint8 relationId;
        bool accepted;
    }

    mapping (uint => mapping (uint => Relation)) relations;

    modifier ensureOwner() {
        require(msg.sender == owner);
        _;
    }

    function Chigiri() public {
        owner = msg.sender;
    }

    function createRelation(uint _uid1, uint _uid2, uint8 _relationId) public ensureOwner {
        relations[_uid1][_uid2] = Relation(_relationId, false);
    }

    function accept(uint _uid1, uint _uid2) public payable ensureOwner {
        relations[_uid1][_uid2].accepted = true;
    }
}