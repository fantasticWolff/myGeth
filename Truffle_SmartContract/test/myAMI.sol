//pragma solidity >=0.4.22 <0.7.0;
//pragma solidity 0.6.7;
pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;
/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract myAMI {
    string message;
    bool public is_activate; // off
    address public owner; // off
    
    /*
    struct Resource {
        string object_name;
        string resource_name;
    }
    Resource[] public r; // off
    */
    
    struct Object {
        string object_name;
        string[] resource_name;
    }
    //Object[] public o; // off
    mapping(uint => Object) public o; // off
    
    struct Subject {
        string name;
        address s_address;
    }
    mapping(address => Subject) public s; // off
    
    enum Action {read, write, both}
    enum Permission {allow, deny}
    
    // AddPolicy (s.EOA, r, action, permission, expiration_time)
    struct Policy {
        address s_address;
        string object_name;
        string resource_name;
        Action action;
        Permission permission;
        uint expiration_time;
    }
    Policy[] public p;

    event RemarksEvent(string message);
    event AddSubjectEvent(address new_s_address, string new_s_name);
    event RemoveSubjectEvent(address s_address);
    
    constructor() public {
        is_activate = true;
        owner = msg.sender;
        message = "Contract Creation";
        emit RemarksEvent(message);
        AddSubject(owner, "owner");
        //SetResource();
        SetObject();
    }
    
    /*
    function SetResource() private{
        r.push(Resource({
            object_name: "Obj_1",
            resource_name: "Rec_1" 
        }));
    }
    */
    
    function SetObject() private {
        o[0].object_name = "Obj_0";
        o[0].resource_name.push("Rec_00");
        o[0].resource_name.push("Rec_01");
        o[1].object_name = "Obj_1";
        o[1].resource_name.push("Rec_10");
        o[1].resource_name.push("Rec_11");
    }
    
    // AddSubject (s.EOA, s.Infos)
    function AddSubject(address new_s_address, string memory new_s_name) public {
        require(msg.sender == owner, "Only owner can add new Subjects!");
        require(keccak256(bytes(s[new_s_address].name))==keccak256(""), "Subject already exist!");
        s[new_s_address].name = new_s_name;
        s[new_s_address].s_address = new_s_address;
        emit AddSubjectEvent(new_s_address, new_s_name);
    }
    
    // RemoveSubject (s.EOA)
    function RemoveSubject(address s_address) public {
        require(msg.sender == owner, "Only owner can remove Subjects!");
        require(keccak256(bytes(s[s_address].name))!=keccak256(""), "Subject not exist!");
        delete(s[s_address]);
        emit RemoveSubjectEvent(s_address);
    }
    
    // ChangeStatus(bool status)
    function ChangeStatus(bool status) public {
        require(msg.sender == owner, "Only owner can Change Status!");
        is_activate = status;
    }
    
    // AddPolicy (s.EOA, r, action, permission, expiration_time)
    // no event
    function AddPolicy(address s_address, uint[2] memory r, Action action, Permission permission, uint expiration_time) public {
        require(msg.sender == owner, "Only owner can Add Policies!");
        require(is_activate == true, "Contract not activate");
        require(keccak256(bytes(s[s_address].name))!=keccak256(""), "Subject not authenticated!");
        
        p.push(Policy({
            s_address: s_address,
            object_name: o[r[0]].object_name,
            resource_name: o[r[0]].resource_name[r[1]],
            action: action,
            permission: permission,
            expiration_time: expiration_time
        }));
        /*
        0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        [0,0]
        0
        1
        2
        */
    }

    // UpdatePolicy (s.EOA, r, action, permission, expiration_time)
    // no event
    function UpdatePolicy(address s_address, uint[2] memory r, Action action, Permission permission, uint expiration_time) public {
        require(msg.sender == owner, "Only owner can Update Policies!");
        require(is_activate == true, "Contract not activate");
        require(keccak256(bytes(s[s_address].name))!=keccak256(""), "Subject not authenticated!");
        for(uint i=0; i<p.length; i++){
            if(
                (p[i].s_address==s_address) &&
                (keccak256(bytes(p[i].object_name)) == keccak256(bytes(o[r[0]].object_name))) &&
                (keccak256(bytes(p[i].resource_name)) == keccak256(bytes(o[r[0]].resource_name[r[1]]))) &&
                (p[i].action == action)
            ){
                p[i].permission = permission;
                p[i].expiration_time = expiration_time;
            }
        }
    }
    
    // DeletePolicy (s.EOA, r, action, permission, expiration_time)
    // not event
    function DeletePolicy(address s_address, uint[2] memory r, Action action, Permission permission, uint expiration_time) public {
        require(msg.sender == owner, "Only owner can Delete Policies!");
        require(is_activate == true, "Contract not activate");
        require(keccak256(bytes(s[s_address].name))!=keccak256(""), "Subject not authenticated!");
        
        for(uint i=0; i<p.length; i++){
            if(
                (p[i].s_address==s_address) &&
                (keccak256(bytes(p[i].object_name)) == keccak256(bytes(o[r[0]].object_name))) &&
                (keccak256(bytes(p[i].resource_name)) == keccak256(bytes(o[r[0]].resource_name[r[1]]))) &&
                (p[i].action==action) && 
                (p[i].permission==permission) &&
                (p[i].expiration_time==expiration_time)
            ){
                delete(p[i]);
                //p.length--;
            }
        }
    }
    
    // CheckAccess (s.EOA, r, action, permission, expiration_time)
    function CheckAccess(address s_address, uint[2] memory r, Action action, Permission permission, uint expiration_time) public returns(bool) {
        require(is_activate == true, "Contract not activate");
        require(s[s_address].s_address == s_address, "Subject not authenticated!");
        
        for(uint i=0; i<p.length; i++){
            if(
                (p[i].s_address==s_address) &&
                (keccak256(bytes(p[i].object_name)) == keccak256(bytes(o[r[0]].object_name))) &&
                (keccak256(bytes(p[i].resource_name)) == keccak256(bytes(o[r[0]].resource_name[r[1]]))) &&
                (p[i].action==action) && 
                (p[i].permission==permission) &&
                (p[i].expiration_time==expiration_time)
            ){
                message = "Requests are passed!";
                emit RemarksEvent(message);
                return true;
            }
        }
        message = "Requests are blocked!";
        emit RemarksEvent(message);
        return false;
    }
    
    
    
    
    
    function return_contract_name() public pure returns (string memory){
        return "myAMI";
    }
}
