#include "ros/ros.h"
#include "knxservice/KnxSet.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>

#include <curlpp/cURLpp.hpp>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>


namespace
{
const long MyPort = 80;
}

FILE* XML;

/*
XML PARSER: Parser les objets KNX :les fils et get ovalue : valeur du l'objet KNX
*/
std::string parseObjetsKNX (xmlDocPtr doc, xmlNodePtr cur) {
        std::stringstream ovalue; // returned ovalue
	xmlChar *value;
	cur = cur->xmlChildrenNode;
	while (cur != NULL) {
	    if ((!xmlStrcmp(cur->name, (const xmlChar *)"ovalue"))) {
		    value = xmlNodeListGetString(doc, cur->xmlChildrenNode, 1);
		   // printf("valeur: %s\n", value);
		    ovalue<<value; //ovalue
		    xmlFree(value);
 	    }
	cur = cur->next;
	}
    return ovalue.str(); //return string ovalue.str()
}
/*
XML PARSER: parler le fichier knx_value.xml
*/
std::string parseDoc(char *docname) {

	std::stringstream value; //

	xmlDocPtr doc;
	xmlNodePtr cur;

	doc = xmlParseFile(docname);
	
	if (doc == NULL ) {
		fprintf(stderr,"Document not parsed successfully. \n");
		return 0;
	}
	
	cur = xmlDocGetRootElement(doc);
	
	if (cur == NULL) {
		fprintf(stderr,"empty document\n");
		xmlFreeDoc(doc);
		return 0;
	}
	
	if (xmlStrcmp(cur->name, (const xmlChar *) "space")) {
		fprintf(stderr,"document of the wrong type, root node != space"); //space = xml root // vérifier le début du fichier
		xmlFreeDoc(doc);
		return 0;
	}
	
	cur = cur->xmlChildrenNode;
	while (cur != NULL) {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"object"))){ //object = premier children
			value<<parseObjetsKNX (doc, cur); //get String ovalue
		}
		 
	cur = cur->next;
	}
	
	xmlFreeDoc(doc);
	return value.str();
}
/*

# FONCTION RETOURNE LA VALEUR de l'objet KNX (string)#

intéroger le serveur KNX d'après la cible 
valeur retournée en format XML

enregistrer la valeur dans un nouveau fichier XML knx_value.xml

Parser le fichier et retourner la valeur de la cible
*/

std::string acquireKNX(std::string target){

 std::ostringstream os;
 std::stringstream URL;

 try
	{
		curlpp::Cleanup myCleanup;

		{	//Interrogation HTML	 
		  URL<<"http://192.168.0.110/cgi/acquire.cgi?login=user&passwd=toto&target="<<target<<"&form=4&op=2&stamptrig=0";
		  os << curlpp::options::Url(URL.str());
	                //Création d'un nouveau fichier XML
                  XML = fopen("bin/knx_value.xml","w");
 		  if (!XML){
		  printf("\nProblem XML FILE !\n");
		  }
		  else {
		  std::string text = os.str();
     		  char text_c[1000];
		  strcpy(text_c,text.c_str());
			//Enregistrement de la valeur retournée dans le fichier
		  fprintf(XML,"%s",text_c);
		  fflush(XML);
		  }

		}
	}
		
	catch( curlpp::RuntimeError &e )
	{
		std::cout << e.what() << std::endl;
	}

	catch( curlpp::LogicError &e )
	{
		std::cout << e.what() << std::endl;
	}
return parseDoc("bin/knx_value.xml") ;
}

/*SET SEND*/
std::string sendKNX(std::string target, long int value){

 std::ostringstream os;
 std::stringstream URL;

 try
	{
		curlpp::Cleanup myCleanup;

		{	//Interrogation HTML	 
		  URL<<"http://192.168.0.110/cgi/senddata.cgi?op=1&login=user&passwd=toto&target="<<target<<"&value="<<value;

		  os << curlpp::options::Url(URL.str());
	           
		  }

	}
		
	catch( curlpp::RuntimeError &e )
	{
		std::cout << e.what() << std::endl;
	}

	catch( curlpp::LogicError &e )
	{
		std::cout << e.what() << std::endl;
	}
return os.str() ;
}


bool knxaction(knxservice::KnxSet::Request  &req,
         knxservice::KnxSet::Response &res )
{
	
 
  if(strcmp(req.action.c_str(),"set")==0){
  res.etat = sendKNX(req.target.c_str(),(long int)req.value);
  ROS_INFO("Action: %s, Target: %s, Value: %ld", req.action.c_str() ,req.target.c_str(),(long int)req.value);
  ROS_INFO("sending back response: [Etat: %s]", res.etat.c_str());
  }
  else if(strcmp(req.action.c_str(),"get")==0){
  res.xml = acquireKNX(req.target.c_str());
  ROS_INFO("Action: %s, Target: %s", req.action.c_str() ,req.target.c_str());
  ROS_INFO("sending back response: [value: %d]", atoi(res.xml.c_str()));
  }

  //ROS_INFO("action: %s, target: %s, value: %ld", req.action.c_str() ,req.target.c_str(), (long int)req.value);
 // ROS_INFO("sending back response: [%s , %s]", res.etat.c_str(), res.xml.c_str());
  return true;
}

int main(int argc, char **argv)
{
 /* std::string val = parseDoc("bin/knx_value.xml");
  printf("value %s\n", val.c_str());*/
  
  ros::init(argc, argv, "Serveur_KNX"); //node name
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("KNX_API", knxaction); //Service name
  ROS_INFO("Ready to action ..");
  ros::spin();

  return 0;
}
