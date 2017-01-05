function[d_q_d_eta] = DuranMoreauODE(eta, q)	
%	This is a function that returns the rhs of the spatially evolving ODE as a function of axial coordinate for nozzles with a linear velocity profile
%	Unpack the parameter vector
	global param;
	global SPLINES;

	M_a 	= param(1);
	M_b 	= param(2);
%	M_c 	= param(3);
	gamma 	= param(4);
	Omega	= param(5);
	T0	= param(6);
	p0	= param(7);
	Zbar	= param(8);
%	w_p_a	= param(9);
%	w_m_a	= param(10);
%	w_s_a 	= param(11);
%	w_z_a	= param(12);
%	w_p_b	= param(13);
%	w_m_b	= param(14);
%	w_s_b 	= param(15);
%	w_z_b	= param(16);
	L		= param(17);

	delta = 1E-8;

%	Unpack the spline vector
	M_sp 		= SPLINES(1);
	Tbar_sp 	= SPLINES(2);
	pbar_sp 	= SPLINES(3);
	Psibar_sp 	= SPLINES(4);
	ubar_sp		= SPLINES(5);

%	Precompute for convenience
	gm1 = gamma - 1;
	gp1 = gamma + 1;
	gm1o2 = gm1/2;

	M 		= ppval(M_sp, eta);
%	Mp 		= ppval(M_sp, eta+delta);
%	Mm		= ppval(M_sp, eta-delta);
	M2 		= M*M;
	Tbar 	= ppval(Tbar_sp, eta);
	pbar 	= ppval(pbar_sp, eta);
	Psibar 	= ppval(Psibar_sp, eta);
	ubar 	= ppval(ubar_sp, eta);
	uminus 	= ppval(ubar_sp, eta-delta);
	uplus 	= ppval(ubar_sp, eta+delta);
%	dMdeta = (Mp - Mm)/(2*delta);
%	beta 	= sqrt(Tbar/T0)/sqrt(1+gm1o2*M2)*dMdeta;
	beta 	= (uplus - uminus)/(2*delta);

%	etahat = eta.*eta;
%	M = sqrt((2.0/gp1)*etahat/(1 - gm1/gp1*etahat));
%	M2 = M*M;
%	Tbar = (1 + gm1o2*M2)^(-1)*T0;
%	pbar = (1 + gm1o2*M2)^(-gamma/gm1)*p0;

%	Psibar = returnPsi(Tbar, pbar, Zbar);
%	ubar = M*sqrt(Tbar/T0);

	


%	A = -2*pi*sqrt(-1)*Omega/(ubar*(M*M-1))*[ 			M2			-(1+gm1o2*M2)/gm1				gamma/gm1					gamma/gm1*Psibar;
%											 -gm1*M2/(1+gm1o2*M2)			M2				-(gm1*M2+1)/(1+gm1o2*M2)	-(1+gm1*M2)/(1+gm1o2*M2)*Psibar;
%														0					0							M2-1							0;
%														0					0							0								(M2-1)];

	A = 2*pi*sqrt(-1)*Omega*	[	1	0	0	0	;
									0	1	0	0	;	
									0	0	1	0	;
									0	0	0	1	];

	B = [	0			0	 	0		0			;
			-gm1*beta	2*beta	-beta	-Psibar*beta;
			0			0		0		0			;
			0			0		0		0			];

	C = ubar*[	1		1	0	0;
				M^-2	1	0	0;
				0		0	1	0;
				0		0	0	1];

%	B = zeros(4);

	d_q_d_eta = -inv(C)*(A + B*L)*q/L;

end
