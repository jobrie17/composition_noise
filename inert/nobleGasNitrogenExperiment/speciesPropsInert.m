function[Nspecies, species, a, A, MW, Hover] = speciesProps()
	global molweight;
	Nspecies = 3;
%	1	2	3	4	5	6	7	8   9
 	species = {'N2','O2','X'};
	MW 	= zeros(Nspecies,1);
	a 	= zeros(Nspecies, 7);
	A 	= zeros( Nspecies, 7);

	MW = 		[28.01340;	
				 15.9994*2;
				 molweight];
				

	a(:,:) 	=  [+2.95257637E+00	+1.39690040E-03	-4.92631603E-07	+7.86010195E-11	-4.60755204E-15	-9.23948688E+02	+5.87188762E+00; %6 - N2
				+3.66096065E+00	+6.56365811E-04	-1.41149627E-07	+2.05797935E-11	-1.29913436E-15	-1.21597718E+03	+3.41536279E+00; %8 - O2
				+2.50000000E+00	+0.00000000E-00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+9.28723974E-01;] %2 - Not Ar
					
%				a1				a2				a3				a4				a5				a6				a7
	A(:,:) 	=  [+3.53100528E+00	-1.23660988E-04	-5.02999433E-07	+2.43530612E-09	-1.40881235E-12	-1.04697628E+03	+2.96747038E+00; %6 - N2
				+3.78245636E+00	-2.99673416E-03	+9.84730201E-06	-9.68129509E-09	+3.24372837E-12	-1.06394356E+03	+3.65767573E-00; %8 - O2
				+2.50000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	+0.00000000E+00	-7.45375000E+02	+9.28723974E-01]; %2 - Not Ar

	Hover = [+0.00000000E+00; 
			 +0.00000000E+00;
			 +0.00000000E+00];
end