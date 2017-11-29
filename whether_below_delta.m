function flag = whether_below_delta(C,wc,ws,r,K,q)
L=r*100;
wj=0:pi/L:pi;
A=zeros(L+1,r);
if(q==1)
    Q=ones(L+1,1);
else
    Q=cos(wj/2);
end
flag=1;
for i=1:L+1
    for j=1:r
        A(i,j)=cos((j-1)*wj(i));
    end
end
delta=C(length(C));
C=C(1:length(C)-1);
P=A*C;
n=0;
for wn=1:L+1
    n=n+1;
    if((wn-1)*pi/L<=wc)
        t=abs(1-P(wn)*Q(wn))/K;
        if(t>1.00005163*abs(delta))
            flag=0;
            break
        end
    elseif((wn-1)*pi/L>=ws)
        t=abs(P(wn)*Q(wn));
        if(t>1.00005163*abs(delta))
            flag=0;
            break
        end
    else
        continue
    end
end

    