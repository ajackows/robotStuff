cmake_minimum_required(VERSION 2.8)
project( ContourDetect )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( ContourDetect ContourDetect.cpp )
target_link_libraries( ContourDetect ${OpenCV_LIBS} )

