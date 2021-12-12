pragma solidity >=0.4.22 <0.9.0;

contract HelloWorld {

    string private helloWorld = "Hello World";
    
    function getHelloWorld() public view returns (string memory) {
        return helloWorld;
    }

}