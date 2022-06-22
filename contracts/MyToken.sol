// contracts/MyToken.sol
// SPDX-License-Identifier: MIT
//WITHOUT USING OPENZEPPELIN

pragma solidity ^0.8.4;

contract MyToken {
    string private name;
    string private symbol;
    uint256 private decimals;
    uint256 private totalSupply;
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) allowances;

    //from IERC20MetaData
    function getName() external view returns (string memory) {
        return name;
    }

    function getSymbol() external view returns (string memory) {
        return symbol;
    }

    function getDecimals() external view returns (uint256) {
        return decimals;
    }

    //from Context
    function getMessageSender() external view returns (address) {
        return msg.sender;
    }

    //from IERC20

    event Transfer(address _from, address _to, uint256 _amount);

    event Approve(address _from, address _to, uint256 _amount);

    function getTotalSupply() external view returns (uint256) {
        return totalSupply;
    }

    function getBalanceOf(address _account) external view returns (uint256) {
        return balances[_account];
    }

    function getAllowanceOf(address _owner, address _spender)
        external
        view
        returns (uint256)
    {
        return allowances[_owner][_spender];
    }

    function transfer(
        address _from,
        address _to,
        uint256 _amount
    ) external returns (bool) {
        require(balances[_from] >= _amount, "Sorry, insufficient funds.");
        balances[_from] = balances[_from] - _amount;
        balances[_to] = balances[_to] + _amount;
        emit Transfer(_from, _to, _amount);
    }
}
