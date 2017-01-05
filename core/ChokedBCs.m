function[Res] = ChokedBCs(q_a, q_b)
%	Computes boundary condition residual for subsonic side of choked flow
%	
%	Unpack param vector
	global param;
	M_a 	= param(1);
	M_b 	= param(2);
%	M_c 	= param(3);
	gamma 	= param(4);
%	Omega	= param(5);
	Tbar	= param(6);
	pbar	= param(7);
	Zbar 	= param(8);
	w_p_a	= param(9);
	w_m_a	= param(10);
	w_s_a 	= param(11);
	w_z_a	= param(12);
%	w_p_b	= param(13);
%	w_m_b	= param(14);
%	w_s_b 	= param(15);
%	w_z_b 	= param(16);

%	Pre-compute for convenience
	gm1 = gamma - 1;
	gp1 = gamma + 1;
	gm1o2 = gm1/2;

	T_a = (1 + gm1o2*M_a*M_a)^(-1)*Tbar;
	T_b = (1 + gm1o2*M_b*M_b)^(-1)*Tbar;

	p_a = (1 + gm1o2*M_a*M_a)^(-gamma/gm1)*pbar;
	p_b = (1 + gm1o2*M_b*M_b)^(-gamma/gm1)*pbar;

%	Psi_a = returnPsi(T_a, p_a, Zbar); %Not needed
	Psi_b = returnPsi(T_b, p_b, Zbar);

	alpha_a = 1/(1+gm1o2*M_a*M_a);
	alpha_b = 1/(1+gm1o2*M_b*M_b);

	R_a = [	1 	M_a 	0	0;
		   	1  -M_a 	0	0;
			0	0		1	0;
			0	0		0	1];

	R_b = [	1 	M_b 	0	0;
		   	1  -M_b 	0	0;
			0	0		1	0;
			0	0		0	1];

	w_a = R_a*q_a;
	w_b = R_b*q_b;

	w_m_b_num = w_b(2);
	w_p_a_num = w_a(1);
	w_s_a_num = w_a(3);
	w_z_a_num = w_a(4);


	Res(1) = (w_p_a_num - w_p_a);%	(u+c) = prescribed value at the inlet
	Res(2) = (w_s_a_num - w_s_a);%	(s) = prescirbed value at the inlet
	Res(3) = gm1o2*q_b(1) + -q_b(2) + 0.5*q_b(3) + 0.5*Psi_b*q_b(4); % M' = 0 at the throat
	Res(4) = (w_z_a_num - w_z_a);% 	(z) = prescribed value at the inlet
end%ChokedBCs()
