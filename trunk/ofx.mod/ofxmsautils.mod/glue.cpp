
#include "glue.h"


msaColor * bmx_ofx_msacolor_new() {
	return new msaColor;
}

void bmx_ofx_msacolor_free(msaColor * color) {
	delete color;
}

void bmx_ofx_msacolor_sethsv(msaColor * color, float f, float s, float v, float a) {
	color->setHSV(f, s, v, a);
}

float bmx_ofx_msacolor_r(msaColor * color) {
	return color->r;
}

float bmx_ofx_msacolor_g(msaColor * color) {
	return color->g;
}

float bmx_ofx_msacolor_b(msaColor * color) {
	return color->b;
}

float bmx_ofx_msacolor_a(msaColor * color) {
	return color->a;
}


