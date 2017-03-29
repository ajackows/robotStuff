/*
 * webcamCap.cpp
 * 
 * Copyright 2016 ajackow <ajackow@ajackow-lnx>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */
#include "opencv2/opencv.hpp"
using namespace cv;
int main(int argc, char** argv)
{
    VideoCapture cap;
    // open the default camera, use something different from 0 otherwise;
    // Check VideoCapture documentation.
    if(!cap.open(0))
        return 0;
    for(;;)
    {
          Mat frame;
          cap >> frame; // pass capture frame pointer to frame to be processed
          if( frame.empty() ) break; // end of video stream
          imshow("this is you, smile! :)", frame);
          if( waitKey(1) == 27 ) break; // stop capturing by pressing ESC 
    }
    // the camera will be closed automatically upon exit
    // cap.close();
    return 0;
}
