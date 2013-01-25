Nancy-PublicGate (ZigBee)
=========================
-------

This package represente a ZigBee GATE implementation of PALGate over the ROS System. 

The gate description is available on:
Nancy-PublicGate-ZigBee/Specification  


Specification
--


* Data structure:
	Description of Zigbee Data trasmitted by the Gate through the ROS encapsulation messages.

* Getting Started with Client API of Zigbee Gate:
	Tutoriel demonstrates simple receipt of messages from a zigbee Gate over the PALGate system.

* Getting Started with Zigbee Gate (Publisher):
	Description of operating mode of Nancy_Zigbee_Gate


Tutorial
--

Data Structure file: Nancy-PublicGate-ZigBee/GATE_ZigBee/msg/ZigbeeFrame.msg

show message structure with ROS:
> root@rosserver:~$ rosmsg show ZigbeeFrame

Gate location: Nancy-PublicGate-ZigBee / GATE_ZigBee / bin / GATEZigbee_pub

run the gate with ROS:
> root@rosserver:~$ rosrun GATE_ZigBee GATEZigbee_pub nancy capID 15min

> root@rosserver:~$ rosrun GATE_ZigBee GATEZigbee_pub help

Client location: Nancy-PublicGate-ZigBee / GATE_ZigBee / bin / GATEZigbee_sub

run the client with ROS:
> root@rosserver:~$ rosrun GATE_ZigBee GATEZigbee_sub cap12










