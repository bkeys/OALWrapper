cmake_minimum_required (VERSION 2.8)
project (OALWrapper)

set(OALWrapper_VERSION_MAJOR 1)
set(OALWrapper_VERSION_MINOR 1)

set(CMAKE_MODULE_PATH
 ${PROJECT_SOURCE_DIR}/CMake
 ${PROJECT_SOURCE_DIR}/CMake/Packages/
)

option(OALWRAPPER_BUILD_STATIC "Build a static library" OFF)

find_package(OGG)
find_package(Vorbis)
find_package(OpenAL)
find_package(SDL2)

SET(all_sources
    sources/OAL_AudioData.cpp
    sources/OAL_Buffer.cpp
    sources/OAL_Device.cpp
    sources/OAL_Effect.cpp
    sources/OAL_Effect_Reverb.cpp
    sources/OAL_EffectSlot.cpp
    sources/OAL_EFX.cpp
    sources/OAL_EFXManager.cpp
    sources/OAL_Filter.cpp
    sources/OAL_Helper.cpp
    sources/OAL_Init.cpp
    sources/OAL_Loaders.cpp
    sources/OAL_LoggerObject.cpp
    sources/OAL_OggSample.cpp
    sources/OAL_OggStream.cpp
    sources/OAL_WAVSample.cpp
    sources/OAL_CustomStream.cpp
    sources/OAL_Playback.cpp
    sources/OAL_Sample.cpp
    sources/OAL_Source.cpp
    sources/OAL_SourceManager.cpp
    sources/OAL_Stream.cpp
    sources/OAL_Types.cpp
)

if(OALWRAPPER_BUILD_STATIC)
add_library(OALWrapper STATIC
    ${all_sources}
)
else()
add_library(OALWrapper SHARED
    ${all_sources}
)
endif()

TARGET_LINK_LIBRARIES(OALWrapper
    ${VORBISFILE_LIBRARY}
    ${VORBIS_LIBRARY}
    ${OGG_LIBRARY}
    ${OPENAL_LIBRARY}
    ${SDL2_LIBRARY}
    -pthread
    -ldl
)

set(OAL_INCLUDE_DIR
    "${PROJECT_SOURCE_DIR}/include/"
)

include_directories(
${OAL_INCLUDE_DIR}
${SDL2_INCLUDE_DIR}
${OGG_INCLUDE_DIR}
${VORBIS_INCLUDE_DIR}
)

ADD_EXECUTABLE(SimpleTest tests/Simple/main.cpp)
TARGET_LINK_LIBRARIES(SimpleTest OALWrapper)

ADD_EXECUTABLE(PlaySound tests/PlaySound/main.cpp)
TARGET_LINK_LIBRARIES(PlaySound OALWrapper)

#ADD_EXECUTABLE(Playlist tests/Playlist/main.cpp)
#TARGET_LINK_LIBRARIES(Playlist OALWrapper)

ADD_EXECUTABLE(CustomStream tests/CustomStream/main.cpp)
TARGET_LINK_LIBRARIES(CustomStream OALWrapper)