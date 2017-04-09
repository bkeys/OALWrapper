# Locate OGG
# This module defines
# OGG_LIBRARY
# OGG_FOUND, if false, do not try to link to OGG 
# OGG_INCLUDE_DIR, where to find the headers
#
# $OGGDIR is an environment variable that would
# correspond to the ./configure --prefix=$OGGDIR
# used in building OGG.
#
# Created by Sukender (Benoit Neil). Based on FindOGG.cmake module.

FIND_PATH(OGG_INCLUDE_DIR
	NAMES ogg/ogg.h ogg/os_types.h
	HINTS
	$ENV{OGGDIR}
    $ENV{CSP_DEVPACK}
	$ENV{OGG_PATH}
	PATH_SUFFIXES include
	PATHS
	~/Library/Frameworks
	/Library/Frameworks
	/usr/local
	/usr
	/sw # Fink
	/opt/local # DarwinPorts
	/opt/csw # Blastwave
	/opt
)

FIND_LIBRARY(OGG_LIBRARY 
	ogg
	HINTS
	$ENV{OGGDIR}
    $ENV{CSP_DEVPACK}
	$ENV{OGG_PATH}
	PATH_SUFFIXES win32/Dynamic_Release lib
	PATHS
	~/Library/Frameworks
	/Library/Frameworks
	/usr/local
	/usr
	/sw
	/opt/local
	/opt/csw
	/opt
)

SET(OGG_FOUND "NO")
IF(OGG_LIBRARY AND OGG_INCLUDE_DIR)
	SET(OGG_FOUND "YES")
	MARK_AS_ADVANCED(OGG_LIBRARY OGG_INCLUDE_DIR)
ELSEIF(OGG_FIND_REQUIRED)
	MESSAGE(FATAL_ERROR "Required library OGG not found! Install the library (including dev packages) and try again. If the library is already installed, set the missing variables manually in cmake.")
ENDIF()

