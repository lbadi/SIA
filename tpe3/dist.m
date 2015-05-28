function ret = dist(x)
	% ret = 1-1/(1 + exp(-2*0.01*x));
	% a = [1:100];
	ret = 1-tanh(0.01*x);
end
