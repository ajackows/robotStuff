cmake_minimum_required(VERSION 2.8)
project( ObjDetect )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( ObjDetect ObjDetect.cpp )
target_link_libraries( ObjDetect ${OpenCV_LIBS} )

