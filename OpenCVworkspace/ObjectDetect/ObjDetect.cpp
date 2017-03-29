#include <iostream>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <stdio.h>
#include <cv.h>
#include <stdlib.h>

using namespace cv;
using namespace std;

Mat cam;
Mat src;
Mat src_gray;



int thresh = 100;
int max_thresh = 255;
RNG rng(12345);


//Try to detect objects using color and contours

/// Function header
void thresh_callback(int, void* );
void contourDetec();


int main( int argc, char** argv )
 {
    VideoCapture cap(0); //capture the video from webcam

    if ( !cap.isOpened() )  // if not success, exit program
    {
         cout << "Cannot open the web cam" << endl;
         return -1;
    }
    
    /// Create Window
	char* source_window = "Source";
	namedWindow( source_window, CV_WINDOW_AUTOSIZE );
    
   // visual trackbar to manage threshold objects
	createTrackbar( " Canny thresh:", "Source", &thresh, max_thresh, thresh_callback );
    
    //char* Diff_window = "Diff";
	//namedWindow( Diff_window, CV_WINDOW_AUTOSIZE );
    
	while(1)
		{
		
		//get image form camera
		cap.read(cam);
		
		
		cvtColor(cam, src_gray, CV_BGR2GRAY); // convert to grayscale
		blur( src_gray, src_gray, Size(3,3) );
		
		imshow( source_window, cam );
		
		thresh_callback( 0, 0 );

		if (waitKey(30) == 27) //wait for 'esc' key press for 30ms. If 'esc' key is pressed, break loop
		{
			cout << "esc key is pressed by user" << endl;
			break; 
		}
	}
	return(0);
}

void thresh_callback(int, void*)
{
	Mat canny_output;
	vector <vector<Point> > contours;
	vector<Vec4i> hierarchy;
	
	
	//detect edges using canny
	Canny(src_gray, canny_output, thresh, thresh*2, 3);
	
	//find countours
	findContours( canny_output, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, Point(0, 0) );
	 
	//Draw contours
	Mat drawing = Mat::zeros( canny_output.size(), CV_8UC3);
	
	
	//get moments
	vector<Moments> mu(contours.size() );
	
	vector<Point2f> mc( contours.size() );
	
	for (int i = 0; i<contours.size(); i++)
	{
		
		Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0,255), rng.uniform(0,255) );
		drawContours( drawing, contours, i, color, 2, 8, hierarchy, 0, Point() );
		mu[i] = moments( contours[i], false );
		color = Scalar(255,255,255);
		
		//get center point of contour
		mc[i] = Point2f( mu[i].m10/mu[i].m00 , mu[i].m01/mu[i].m00 );
		circle( drawing, mc[i], 4, color, -1, 8, 0 );
	}
	
	namedWindow( "Contours", CV_WINDOW_AUTOSIZE );
	imshow( "Contours", drawing );
}

