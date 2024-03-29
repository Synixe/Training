#define PREFIX training
#define COMPONENT main

// Version
#define MAJOR 1
#define MINOR 0
#define PATCHLVL 0

// Map
#define MAP hebontes

#define DEBUG_SYNCHRONOUS
//#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_mission.hpp"

#define PATHTOTACRF(var1,var2) PATHTOF_SYS(\x\tacr\addons,var1,var2)
#define QPATHTOTACRF(var1,var2) QUOTE(PATHTOTACRF(var1,var2))

#define TACFUNC(var1,var2) TRIPLES(DOUBLES(tac,var1),fnc,var2)

#define TACGVAR(var1,var2) TRIPLES(tac,var1,var2)
#define QTACGVAR(var1,var2) QUOTE(TACGVAR(var1,var2))
