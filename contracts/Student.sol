pragma solidity >=0.4.22 <0.9.0;


contract Student {
    
  // If anything goes wrong the Contract can recover it transaction cost
  // because of the payable constructor
  constructor() public payable {} 

  string helloMessage = "hello";

  // Struct for tracking the student info
  struct StudentInfo {
    string student_Id; // given by the course
    string student_NIC; // real world NIC
    string student_first_name;
    string student_last_name;
    uint8 student_final_score;
    uint256 timestamp;
  }

  // StudentId given By the contract
  uint32 studentId = 0;

  // Blockchain generated Id <-> StuentInfo
  mapping(uint=>StudentInfo) studentMap;

  // Add Student information to the contract memory 
  function createStudent(string memory _studentId, string memory _studentNIC, string memory _studentFName, string memory _studentLName) public {

    uint32 newStudentId = studentId++;
    studentMap[newStudentId].student_Id = _studentId;
    studentMap[newStudentId].student_NIC = _studentNIC;
    studentMap[newStudentId].student_first_name = _studentFName;
    studentMap[newStudentId].student_last_name = _studentLName;
    studentMap[newStudentId].student_final_score = 0;
    studentMap[newStudentId].timestamp = block.timestamp;

  }

  // Retrieve the last registered student id
  function getCurrentStudentId() public view returns(uint32) {
    return studentId;
  }

  // This method will return the Student information related to supplied trailNo
  function getStudentDetails(uint32 _studentId) public view returns (string memory, string memory, string memory, string memory, uint8, uint) {
    return (studentMap[_studentId].student_Id, studentMap[_studentId].student_NIC,
              studentMap[_studentId].student_first_name, studentMap[_studentId].student_last_name,
              studentMap[_studentId].student_final_score, studentMap[_studentId].timestamp);
  }
  
  // Update Student Score
  function updateStudentLastScore(uint32 _studentId, uint8 _lastScore) public returns(bool)  {
      studentMap[_studentId].student_final_score = _lastScore;
      studentMap[_studentId].student_final_score = _lastScore;
      return true;
  }

  function getHello() public view returns(string memory) {
      return helloMessage;
  }

  function setHello(string memory _message) public {
      helloMessage = _message;
  }

}