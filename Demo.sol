pragma solidity >=0.5.8;

contract Demo {
    struct SensorInfo {
        uint256 timestamp;
        string sensor_type;
        bool humidity;
        bool temperature;
        string unit;
        uint256 value;
    }

    mapping(uint256 => SensorInfo) AllSensors;
    uint256 public sensorCount;

    function SetSensorData(
        uint256 _timestamp,
        string memory _sensor_type,
        bool _humidity,
        bool _temperature,
        string memory _unit,
        uint256 _value
    ) public {
        AllSensors[sensorCount].timestamp = _timestamp;
        AllSensors[sensorCount].sensor_type = _sensor_type;
        AllSensors[sensorCount].humidity = _humidity;
        AllSensors[sensorCount].temperature = _temperature;
        AllSensors[sensorCount].unit = _unit;
        AllSensors[sensorCount].value = _value;
        sensorCount++;
    }

    function GetSensorData(
        uint256 _sensor_id
    )
        public
        view
        returns (uint256, string memory, bool, bool, string memory, uint256)
    {
        return (
            AllSensors[_sensor_id].timestamp,
            AllSensors[_sensor_id].sensor_type,
            AllSensors[_sensor_id].humidity,
            AllSensors[_sensor_id].temperature,
            AllSensors[_sensor_id].unit,
            AllSensors[_sensor_id].value
        );
    }

    function getSensorCount() public view returns (uint256) {
        return sensorCount;
    }

    event Echo(string message);

    function echo(string calldata message) external {
        emit Echo(message);
    }
}
