function delta=main(N)
    wc=0.05*pi:0.02*pi:0.45*pi;
    ws=0.55*pi:0.02*pi:0.95*pi;
    delta=zeros(1,21);
    for i=1:21
        [~,delta(i)]=parks_moclellan(N,wc(i),ws(i));
    end
    bw=0.1*pi:0.04*pi:0.9*pi;
    bw=flip(bw);
    plot(bw,delta);
end