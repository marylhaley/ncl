/*
 *      $Id: PSWorkstation.h,v 1.1 1995-03-24 11:27:34 boote Exp $
 */
/************************************************************************
*									*
*			     Copyright (C)  1995			*
*	     University Corporation for Atmospheric Research		*
*			     All Rights Reserved			*
*									*
************************************************************************/
/*
 *	File:		PSWorkstation.h
 *
 *	Author:		Jeff W. Boote
 *			National Center for Atmospheric Research
 *			PO 3000, Boulder, Colorado
 *
 *	Date:		Fri Mar 24 00:33:23 MST 1995
 *
 *	Description:	
 */
#ifndef _NPSWorkstation_h
#define	_NPSWorkstation_h

#include <ncarg/hlu/Workstation.h>

#define	NhlNwkPSFormat		"wkPSFormat"
#define	NhlCwkPSFormat		"WkPSFormat"

#define	NhlNwkVisualType	"wkVisualType"
#define	NhlCwkVisualType	"WkVisualType"

#define	NhlNwkOrientation	"wkOrientation"
#define	NhlCwkOrientation	"WkOrientation"

#define	NhlNwkPSFileName	"wkPSFileName"
#define	NhlCwkPSFileName	"WkPSFileName"

#define	NhlNwkFullBackground	"wkFullBackground"
#define	NhlCwkFullBackground	"WkFullBackground"

#define	NhlNwkDeviceLowerX	"wkDeviceLowerX"
#define	NhlCwkDeviceLowerX	"WkDeviceLowerX"

#define	NhlNwkDeviceLowerY	"wkDeviceLowerY"
#define	NhlCwkDeviceLowerY	"WkDeviceLowerY"

#define	NhlNwkDeviceUpperX	"wkDeviceUpperX"
#define	NhlCwkDeviceUpperX	"WkDeviceUpperX"

#define	NhlNwkDeviceUpperY	"wkDeviceUpperY"
#define	NhlCwkDeviceUpperY	"WkDeviceUpperY"

#define	NhlNwkPSResolution	"wkPSResolution"
#define	NhlCwkPSResolution	"WkPSResolution"

/*
 * New Types.
 */

#define	NhlTVisualType	"VisualType"
typedef enum _NhlVisualType{
	NhlCOLOR = 0,
	NhlMONOCHROME = 3
} NhlVisualType;

#define	NhlTPSFormat	"PSFormat"
typedef enum _NhlPSFormat{
	NhlPS = 0,
	NhlEPS = 1,
	NhlEPSI = 2
} NhlPSFormat;

#define NhlTWorkOrientation	"WorkOrientation"
typedef enum _NhlWorkOrientation{
	NhlPORTRAIT = 0,
	NhlLANDSCAPE = 6
} NhlWorkOrientation;

extern NhlLayerClass NhlpsWorkstationLayerClass;

#endif /* _NPSWorkstation_h */
