Nancy-PublicGate-KNX
====================
-----------

GATE KNX allows to Query / Act on domestic actuator

Tutorial
--

> palgate_user@master:~$ rosrun knxservice clientknx help

    usage:  client_knx <set> [target] [value]
        	client_knx <get> [target]


Set up the kitchen's lamp
> palgate_user@master:~$ rosrun knxservice clientknx set EclairageCuisine 1

    [ INFO] [1341938173.886180649]: Action sur EclairageCuisine = Request OK
    

Get state of the kitchen's lamp
> palgate_user@master:~$ rosrun knxservice clientknx get EtatLumCuisine

    [ INFO] [1341938041.115683630]: Value of EtatLumCuisine = 1
