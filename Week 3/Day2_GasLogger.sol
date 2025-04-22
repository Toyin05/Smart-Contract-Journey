// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// This is a GasLogger contract to log global variables and gas usage

contract GasLogger {
    struct LogEntry {
        address sender;
        uint256 timestamp;
        uint256 blockNumber;
        uint256 gasLeft;
    }

    LogEntry[] public logs;

    /// @notice Logs current block and msg context details
    function log() external {
        LogEntry memory newLog = LogEntry({
            sender: msg.sender,
            timestamp: block.timestamp,
            blockNumber: block.number,
            gasLeft: gasleft()
        });

        logs.push(newLog);
    }

    /// @notice Returns the number of logs stored
    function getLogCount() external view returns (uint256) {
        return logs.length;
    }

    /// @notice Returns a specific log entry by index
    /// @param index The index of the log entry in the array
    function getLog(uint256 index) external view returns (
        address sender,
        uint256 timestamp,
        uint256 blockNumber,
        uint256 gasLeft
    ) {
        require(index < logs.length, "Invalid index");
        LogEntry memory entry = logs[index];
        return (entry.sender, entry.timestamp, entry.blockNumber, entry.gasLeft);
    }
}
