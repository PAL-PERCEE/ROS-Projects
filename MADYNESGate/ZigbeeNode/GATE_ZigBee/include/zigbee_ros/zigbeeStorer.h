/* 
 * Hugo Cruz Sanchez 
 * 13 January 2010
 * Program to read the messages coming from the appartment
 * For parsing, the format presented in 
 */

#include <stdio.h> 
#include <string.h> 
#include <unistd.h> 
#include <fcntl.h> 
#include <errno.h> 
#include <stdlib.h> 
#include <termios.h> /* Terminal control library (POSIX) */ 
#include <ctype.h> 
#include <time.h>

#include "ros/time.h"
 
 
#define MAX 500 
#define MAX_SQL 700
#define MAX_DATA 100
#define LOCAL 0
#define EXTERNAL 1


int sd = 3; 
char *serialPort = "";
char *serialPort0 = "/dev/ttyUSB0";
char valor[MAX] = "";
char c;
struct termios opciones;

ros::Duration one_min = ros::Duration(60.0);
ros::Duration five_min = ros::Duration(5*60);
ros::Duration fifteen_min = ros::Duration(15*60);
ros::Duration therteen_min = ros::Duration(30*60);
ros::Duration one_hour = ros::Duration(60*60);
ros::Duration two_hour = ros::Duration(60*60) + ros::Duration(60*60);
ros::Duration one_day = ros::Duration(24*60*60);

struct xbee_data {
	char variableName[20];
	char variableValue[20];
};



struct xbee_frame {
   char mac[20];
   char x[20];
   char y[20];
   char z[20];
   char temp[20];
   char bat[20];
	char cucu[20];
};

struct xbee_dataframe { 
	char iD[20];
	char location[20];
	char time[20];
	int numberOfReadings;
	struct xbee_data sensor[MAX_DATA];
};

struct xbee_frame strct_frame;

//struct to pass as an argument to functions

struct xbee_dataframe strct_mydataframe;

char aux[MAX] = "";

int init(void);
void getFrame();

void parseFrame(struct xbee_frame *p_frame, struct xbee_dataframe *p_sensorDataframe);

void Publishmain_By_CAPID(int argc, char **argv);
void Publishmain_By_LOCATIONID(int argc, char **argv);
void Publishmain_ALL(int argc, char **argv);

void help_function();



