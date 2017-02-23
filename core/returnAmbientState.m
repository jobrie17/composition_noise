function[gamma, T0, p0, Zbar] = returnAmbientState()
	global fuel;
	gamma = 1.4;
	T0 = 2100.0;%
	p0 = 1E5;
	if fuel == 1
		Zbar = 0.0627964;%stoichiometric value
	elseif (fuel == 2)
		Zbar = 0.0627964;%stoichiometric value
	elseif (fuel == 3)
		Zbar = 0.0627964;%stoichiometric value
	elseif (fuel == 4)
		Zbar = 0.5;
		T0 = 316.483;%K
		p0 = 98043.4487;%Pa
	else
		error('fuel not defined');
	end
end
