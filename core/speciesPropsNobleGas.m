function[Nspecies, species, a, A, MW, Hover] = speciesProps()
	global molweight;
	Nspecies = 2;
%	1	2	3	4	5	6	7	8   9
 	species = {'Ar','X'};
	MW 	= zeros(Nspecies,1);
	a 	= zeros(Nspecies, 7);
	A 	= zeros( Nspecies, 7);

	MW = 		[39.94800;
				 molweight];
				

	a(:,:) 	=  [+2.50000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+4.37967491E+00; %1 - Ar
				+2.50000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+4.37967491E+00]; %2 - Not Ar
%				+2.50000000E+00	+0.00000000E-00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+9.28723974E-01;] %2 - Not Ar
					
%				a1				a2				a3				a4				a5				a6				a7
	A(:,:) 	=  [+2.50000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+4.37967491E+00; %1 - Ar
				+2.50000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+4.37967491E+00]; %2 - Not Ar
%				+2.50000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+9.28723974E-01]; %2 - Not Ar

	Hover = [+0.00000000E+00; +0.00000000E+00];
end