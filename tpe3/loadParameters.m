function ret = loadParameters(filename)
	filename = ["config/" filename ".cfg"];
	if (!strcmp(filename,'') && exist(filename))
		load(filename);
		ret = c;
		printf("Cargado %s.\n",filename);
	else
		ret = 0;
		printf("Error al cargar %s.\n",filename);
	end
	fflush(stdout);
end