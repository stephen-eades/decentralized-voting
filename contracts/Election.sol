pragma solidity 0.5.16;

contract Election {

	// Model a candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// Read/write Candidates
	mapping(uint => Candidate) public candidates;

	// Store Candidates Count
	uint public candidatesCount;

	// Constructor
	constructor() public {
		addCandidate("Joe Biden");
		addCandidate("Donald Trump");
	}

	//
	function addCandidate(string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
	
}