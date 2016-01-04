// Port of MIA's HSP contest 2008 raytracing.hsp http://taillove.jp/mia/
#include "hsp3r.h"

#include <vector>
#include <string>
#include "hsplib.h"

static double gr;
static double gy;
static double gd;
static double ctx;
static double ctz;
static double sunx;
static double suny;
static double sunz;
static int nObstacles;
static double r;
static std::vector<double> ox;
static std::vector<double> oy;
static std::vector<double> oz;
static std::vector<double> os;
static std::vector<double> ocr;
static std::vector<double> ocg;
static std::vector<double> ocb;
static double cx;
static double cy;
static double cz;
static double omx;
static double mx;
static double omy;
static double my;
static double mw;
static int obt;
static int bt;
static int step;
static int w;
static int h;
static double zoom;
static int ru;
static int rd;
static double vox;
static double voz;
static double gx;
static double gz;
static int sel;
static double dx;
static double v;
static double orgxv;
static double orgyv;
static double mode;
static int hit;
static double starttime;
static double py;
static double px;
static double lr;
static double lg;
static double lb;
static double sr;
static double sg;
static double sb;
static double yv;
static double l;
static double xv;
static double zv;
static double col;
static double fg;
static double t;
static double y;
static double x;
static double z;
static int nHit;
static double n0d;
static int n0c;
static double endtime;
static double minv;
static double dy;
static double dz;
static double b;
static double d;
static double c;
static double f;
static double nx;
static double ny;
static double nz;
static double e;
static int nc;
static double nd;
static double oxv;
static double oyv;
static double ozv;
static double a;

using namespace hsp;


void TRACE_RAY() {
	if (mode == 0) nHit = 0;
	for (int cnt = 0; cnt < 10; cnt++) {
		hit = -1; minv = 10000.0;

		// 球とレイの交点を求める
		for (int cnt = 0; cnt < nObstacles; cnt++) {
			r = os[cnt];
			dx = ox[cnt] - x; dy = oy[cnt] - y; dz = oz[cnt] - z;
			b = dx * xv + dy * yv + dz * zv;
			d = dx * dx + dy * dy + dz * dz;
			c = d - r * r; f = b * b - c; if (f < 0.0) continue;
			v = (b - rt.sqrt(f)); if (v < 0.0) continue;

			if (mode == 1) {
				hit = 1;
				break;
			}
			if (v < minv) {
				if ((y + yv * v) > 0.0) {
					minv = v;
					hit = cnt;
				}
			}
		}
		if (mode) {
			mode = 0;
			break; // 特殊モード
		}
		if (hit < 0) break;

		// 交点と法線を求める
		d = 1.0 / os[hit];
		x += xv * minv; nx = (x - ox[hit]) * d;
		y += yv * minv; ny = (y - oy[hit]) * d;
		z += zv * minv; nz = (z - oz[hit]) * d;

		// 光線を反射
		d = 2.0 * (nx * xv + ny * yv + nz * zv);
		xv = xv - d * nx; yv = yv - d * ny; zv = zv - d * nz;

		// 色計算
		e = rt.limitf(1.1 + d * 0.5, 0, 1); e = e * e * 4; // フレネル

														// diffuse 計算
		nc = hit; nd = rt.limitf(nx * sunx + ny * suny + nz * sunz, 0, 1);
		if (nd > 0.0) {
			oxv = xv; oyv = yv; ozv = zv;
			xv = sunx; yv = suny; zv = sunz;
			mode = 1;
			TRACE_RAY();
			if (hit > 0)
				nd *= 0.2;
			xv = oxv; yv = oyv; zv = ozv;
		}

		// 反射レイの色を更新
		lr *= ocr[nc] * e; lg *= ocg[nc] * e; lb *= ocb[nc] * e;

		if (nHit == 0) {
			n0c = nc; n0d = nd;
		}
		else {
			sr += nd * ocr[nc] * lr;
			sg += nd * ocg[nc] * lg;
			sb += nd * ocb[nc] * lb;
		}

		nHit++;
	}
	return;
}

void MAKE_RAY() {
	xv = -voz *  orgxv - vox;
	yv = -orgyv;
	zv = vox *  orgxv - voz;
	a = 1.0 / rt.sqrt(xv * xv + yv * yv + zv * zv);
	xv *= a; yv *= a; zv *= a;
	x = gx; y = gy; z = gz;
	return;
}


void __HspEntry(void) {
	rt.randomize();

	// 常にカレントスクリーンにフルサイズで描画するので、
	// ここでレンダリングサイズが変えられる
//	bgscr 2, 320, 240, 0

	gr = 0.0;
	gy = 28.0;	// カメラの高さ
	gd = 80.0;	// カメラのY軸からの距離

	ctx = 0.0;  ctz = 0.0;

	// 太陽の方向(正規化ベクトルにしておくこと)
	sunx = 0.5; suny = 0.7071; sunz = -0.5;

	// 太陽光の正規化ルーチン
//	d = 1.0 / sqrt( sunx*sunx + suny*suny + sunz*sunz ) : sunx *= d : suny *= d : sunz *= d

	rt.font(msgothic, 12);

INIT:
	// 初期配置
	nObstacles = 8;
	ox.resize(nObstacles);
	oy.resize(nObstacles);
	oz.resize(nObstacles);
	os.resize(nObstacles);
	ocr.resize(nObstacles);
	ocg.resize(nObstacles);
	ocb.resize(nObstacles);
	for (int cnt = 0; cnt < nObstacles; cnt++) {
		r = 3.14159 / 4 * cnt;
		ox[cnt] = sin(r) * 20;
		oy[cnt] = cos(r) * 20 + 28;
		oz[cnt] = 0.0;
		os[cnt] = 10.0;
		ocr[cnt] = 0.3;
		ocg[cnt] = 0.3;
		ocb[cnt] = 0.3;
	}

	goto MAIN;

START:
	// ユーザによる配置リセット
	nObstacles = rt.rnd(12)+1;
	ox.resize(nObstacles);
	oy.resize(nObstacles);
	oz.resize(nObstacles);
	os.resize(nObstacles);
	ocr.resize(nObstacles);
	ocg.resize(nObstacles);
	ocb.resize(nObstacles);
	cx = 0.0; cy = 0.0; cz = 0.0;
	for (int cnt = 0; cnt < nObstacles; cnt++) {
		ox[cnt] = 0.0 + rt.rnd(60) - 30;
		oy[cnt] = 0.0 + rt.rnd(40);
		oz[cnt] = 0.0 + rt.rnd(60) - 30;
		os[cnt] = 4.0 + 0.01 * rt.rnd(900);
		ocr[cnt] = 0.001 * rt.rnd(1000);
		ocg[cnt] = 0.001 * rt.rnd(1000);
		ocb[cnt] = 0.001 * rt.rnd(1000);
		cx += ox[cnt] / nObstacles;
		cy += oy[cnt] / nObstacles;
		cz += oz[cnt] / nObstacles;
	}

MAIN:
	while (true) {
		omx = mx; omy = my; mx = rt.mousex(); my = rt.mousey(); mw = rt.mousew();
		obt = bt; rt.stick(bt, 15+256); if (bt & 16) break;

		if (bt & 32) {
			step = 1; rt.color(0, 255, 0); rt.boxf(633, 0);
			rt.pos(540, 460); rt.mes("中断 : ESC");
		} else {
			step = 16; rt.redraw(0);
		}
		w = ginfo_winx->getInt() / step; h = ginfo_winy->getInt() / step; zoom = 1.0 / h;

		rt.getkey(ru, 33); rt.getkey(rd, 34);
		gd -= 0.5 * ( ru - rd );
		gr += 0.03 * ( (bt>>2&1) - (bt   &1) );
		gy += ( (bt>>1&1) - (bt>>3&1) );
		if (gy < 1.0) gy = 1.0;

		ctx += (cx - ctx) * 0.1;
		ctz += (cz - ctz) * 0.1;

		vox = sin(gr); voz = -cos(gr);
		gx = vox * gd + ctx;
		gz = voz * gd + ctz;

		if (bt & 256) {
			if (sel >= 0) {
				dx = mx - omx; v = 0.16;
				oy[sel] += v * (omy - my);
				ox[sel] -= v * voz * dx;
				oz[sel] += v * vox * dx;
				if (mw>0) os[sel] += 0.4;
				if (mw<0) os[sel] -= 0.4;
			}
		} else { sel = -1; }

		if (( (obt^bt) & bt ) & 256) {
			orgxv = zoom * (0.5 + omx / step - 0.5 * w);
			orgyv = zoom * (0.5 + omy / step - 0.5 * h);
			MAKE_RAY(); mode = 2; TRACE_RAY();
			sel = hit;
		}

		starttime = (rt.gettime(5) * 60 + rt.gettime(6)) * 1000 + rt.gettime(7);

		for (int cnt = 0; cnt < h; cnt++) {
			py = cnt * step; orgyv = zoom * (0.5 + cnt - 0.5 * h);
			for (int cnt = 0; cnt < w; cnt++) {
				px = cnt * step; orgxv = zoom * (0.5 + cnt - 0.5 * w);
				// 視線の式
				MAKE_RAY();

				lr = 1.0; lg = 1.0; lb = 1.0;
				sr = 0.0; sg = 0.0; sb = 0.0;

				// レイトレーシングコア
				TRACE_RAY();

				if ( yv >= 0.0 ) {
					// 空
					l = rt.limitf( xv * sunx + yv * suny + zv * sunz, 0, 1);
					for (int i = 0; i < 8; i++) {
						l = l * l;
					}
					col = l * 100;
				} else {
					// 地面
					fg = -yv * 5.0; t = -y / yv; x = x + t * xv; y = 0.0; z = z + t * zv;
					col = rt.limitf( 0.7 * ( ( (int(x+80000)/8+int(z+80000)/8) & 1) != 0 ? 1 : 0 ), 0.3, fg);

					xv = sunx; yv = suny; zv = sunz;
					mode = 1;
					TRACE_RAY();
					if (hit > 0) col *= 0.2;
				}

				if (nHit) {
					sr += n0d * ocr[n0c];
					sg += n0d * ocg[n0c];
					sb += n0d * ocb[n0c];
				}

				// 塗る
				rt.color(rt.limitf( col * lr + sr, 0, 1 ) * 255, rt.limitf( col * lg + sg, 0, 1 ) * 255, rt.limitf( col * lb + sb, 0, 1 ) * 255);
				rt.boxf(px, py, px+step-1, py+step-1);
			}
			rt.await(0);
			if (step == 1) {
				rt.stick(bt);
				if (bt & 128) {
					step = 16;
					break;
				}
			}
		}

		endtime = (rt.gettime(5) * 60 + rt.gettime(6)) * 1000 + rt.gettime(7);
		rt.color(255,255,255); rt.pos(0,20); rt.mes(("->" + std::to_string(double(endtime - starttime) / 1000) + "sec").c_str());

		if (step == 1) {
			rt.dialog("セーブしますか？", 2);
			if (rt.stat() == 6) {
				rt.dialog("bmp",17);
				if (rt.stat()) rt.bmpsave(rt.refstr().c_str());
			}
			rt.stick(bt);
		} else {
			rt.color(255,255,255); rt.pos(0,0);
			rt.mes("操作:↑↓←→ Rup Rdn Enter Space Drag+Wheel");
		}
		rt.redraw(1);
	}
	goto START;
}
