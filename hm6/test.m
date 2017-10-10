z = 0:0.01:4;
z_ = -2:0.01:0;
f_Z = 3*exp(-3*z);
f_Z_ = zeros(1,length(z_));
plot(z,f_Z,z_,f_Z_);
xlabel('z');
