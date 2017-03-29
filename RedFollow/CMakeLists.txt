cmake_minimum_required(VERSION 2.8)
project( redDetect )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

add_library(SerialDriver SerialDriver.cpp)


add_executable( redDetect redDetect.cpp )
target_link_libraries( redDetect SerialDriver ${OpenCV_LIBS})
