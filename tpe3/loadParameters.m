function ret = loadParameters(filename)
	filename = ["data/config/" filename ".cfg"];
	if (!strcmp(filename,'') && exist(filename))
		load(filename);
		ret = 1;
		printf("Cargado %s.\n",filename);
	else
		ret = 0;
		printf("Error al cargar %s.\n",filename);
	end
end