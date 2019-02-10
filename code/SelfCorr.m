function max_value = SelfCorr(I)
D = normxcorr2(I,I);
max_value=max(max(D));
