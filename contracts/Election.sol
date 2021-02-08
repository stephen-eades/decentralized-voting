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
	// Store accounts that have voted
	mapping(address => bool)) public voters;
	// Store Candidates Count
	uint public candidatesCount;

	// Constructor
	constructor() public {
		addCandidate("Joe Biden");
		addCandidate("Donald Trump");
	}

	function addCandidate(string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote (uint memory _candidateId) public {
		// require that they haven't voted before
		require(!voters[msg.sender]);
		// require a valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);
		// record that voter has voted
		voters[msg.sender] = true;
		// update candidate vote count
		candidates[_candidateId].voteCount++;
	}
	
}