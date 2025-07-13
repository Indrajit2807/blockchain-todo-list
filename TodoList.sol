// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    struct Task {
        string description;
        bool completed;
    }

    Task[] public tasks;

    function addTask(string memory _description) public {
        tasks.push(Task(_description, false));
    }

    function getTask(uint _index) public view returns (string memory, bool) {
        require(_index < tasks.length, "Invalid index");
        Task storage task = tasks[_index];
        return (task.description, task.completed);
    }

    function completeTask(uint _index) public {
        require(_index < tasks.length, "Invalid index");
        tasks[_index].completed = true;
    }

    function getTaskCount() public view returns (uint) {
        return tasks.length;
    }
}
