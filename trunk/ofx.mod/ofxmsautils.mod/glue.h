
#include "ofxMSAUtils.h"

extern "C" {

	msaColor * bmx_ofx_msacolor_new();
	void bmx_ofx_msacolor_free(msaColor * color);
	void bmx_ofx_msacolor_sethsv(msaColor * color, float f, float s, float v, float a);
	float bmx_ofx_msacolor_r(msaColor * color);
	float bmx_ofx_msacolor_g(msaColor * color);
	float bmx_ofx_msacolor_b(msaColor * color);
	float bmx_ofx_msacolor_a(msaColor * color);

}
