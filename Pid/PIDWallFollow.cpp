const int pidConst  = 1;
const int p = 1;
const int i = 1;
const int d = 1;


int desired =0;
int feed = 0;

int pastErr= 0;
int futErr = 0;
int propErr 0;

int error = 0;
int diff = 0;
int integral = 0;



int PIDCntrl()
{
	error = feed - desired;

	//proportionla

	propErr = pidConst*p*error;

	//inegral

	integral = error+ integral;
	futErr = integral*i*pidConst


	//differential 

	diff = error- pastErr; 

	pastErr = diff*d*pidConst;


	return pastErr+futErr+propErr;
}