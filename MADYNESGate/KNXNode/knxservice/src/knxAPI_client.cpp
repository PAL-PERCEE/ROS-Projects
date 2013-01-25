#include "ros/ros.h"
#include "knxservice/KnxSet.h"
#include <cstdlib>
#include <stdlib.h>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "Client_KNX");

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<knxservice::KnxSet>("KNX_API");
  knxservice::KnxSet srv;

  if (argc == 4 && (strcmp(argv[1],"set")==0))
  {
   srv.request.value = atoll(argv[3]);
  }
  else if (argc <= 3 && strcmp(argv[1],"get")==0 ){

  }
  else {
    printf("usage:\tclient_knx <set> [target] [value]\n");
    printf("      \tclient_knx <get> [target]\n");
    return 1;
}


  std::stringstream action_;
  std::stringstream target_;
  
  action_<<argv[1];
  target_<<argv[2];
 

  srv.request.action = action_.str();
  srv.request.target = target_.str();
 // srv.request.value = atoll(argv[3]);
 
  if (strcmp(srv.request.action.c_str(),"get")==0 && client.call(srv))
  {
    ROS_INFO("Value of %s = %d", srv.request.target.c_str(), atoi(srv.response.xml.c_str()));
  }
  else if (strcmp(srv.request.action.c_str(),"set")==0 && client.call(srv))
  {
    ROS_INFO("Action sur %s = %s", srv.request.target.c_str(),srv.response.etat.c_str());
  }
  else
  {
    ROS_ERROR("Failed to call service KNX_API");
    return 1;
  }

  return 0;
}
