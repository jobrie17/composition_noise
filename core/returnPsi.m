function[psi, gctr, gammactr, aleph, phi] = returnPsi(Tbar, pbar, Zbar)
%	Returns the normalized chemical potential and (gibbs free energy, if desired) as a function of mean temperature, pressure, and composition
	global data mechanism a A MW Hover;

%	compute the size of the flamelet stored in data
	if (mechanism > 0)
		[N,M] = size(data);
%		Find the Z value to the right of Zbar
		index = 1;
		while (data(1,index+1) < Zbar) %&& ((index + 1) < M) 
			index = index + 1;
			if (index > M)
				break;
			end
		end

%		Obtain the composition on either side of Zbar
		Ylft = data(3:N,index);
		Yrgt = data(3:N,index+1);

%		Obtain the mixtur fractions on either side of Zbar
		Zlft = data(1,index);
		Zrgt = data(1,index+1);

%		Central difference to obtain the composition gradient at Zbar
		Yctr = (Zrgt - Zbar)/(Zrgt - Zlft)*Ylft + (Zbar - Zlft)/(Zrgt - Zlft)*Yrgt;
	elseif (mechanism == 4) %H2 - N2
		eps = 1E-2;
		Zlft = Zbar - eps;
		Zrgt = Zbar + eps;
		YL = [1 0];
		YR = [0 1];
		Yctr = YL*Zbar + YR*(1 - Zbar);
		Ylft = YL*Zlft + YR*(1 - Zlft);
		Yrgt = YL*Zrgt + YR*(1 - Zrgt);
	end

	if (mechanism ~= 6) %Not the algebraic Jeonglae Checks
%		Obtain the gibbs free energies at either side of Zbar, and the specific heat at Zbar
%		 1		2	3	4		5		6
		[~,		~, 	~, 	glft, 	h0lft, 	gammalft] 	= returnSpeciesProperties(Tbar, pbar, Ylft, a, A, MW, Hover);
		[cp, 	~, 	~, 	gctr, 	h0ctr, 	gammactr]	= returnSpeciesProperties(Tbar, pbar, Yctr, a, A, MW, Hover);
		[~, 	~, 	~, 	grgt, 	h0rgt, 	gammargt] 	= returnSpeciesProperties(Tbar, pbar, Yrgt, a, A, MW, Hover);

%		Compute the gradient of the Gibbs free energy at Zbar
		dGdZ = ((grgt - h0rgt) - (glft - h0lft))/(Zrgt - Zlft);

		[gamma0, T0, p0, Zbar] = returnAmbientState();
		[cp0, ~, ~, ~, ~, ~] = returnSpeciesProperties(T0, p0, Yctr, a, A, MW, Hover);
	
%		Return the value of psi
		psi = 1/(cp0*Tbar)*dGdZ;

%		Return null arguments for now	
		alpeph 	= 0;
		phi 	= 0;
	elseif (mechanism == 6) % Algebraic Jeonglae Check
		psi = -40;
	end
end
