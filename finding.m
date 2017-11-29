function [w,n1]=finding(C,wc,ws,r,n2,K,q)
L=r*100;
C=C(1:r);
wj=0:pi/L:pi;
if(q==1)
    Q=ones(L+1,1);
else
    Q=cos(wj/2);
end
A=zeros(L+1,r);
for i=1:L+1
    for j=1:r
        A(i,j)=cos((j-1)*wj(i));
    end
end

P=A*C;
W=ones(L+1,1);
Hd=zeros(L+1,1);
for i=1:L+1
    if((i-1)*pi/L<=wc)
        W(i)=W(i)/K;
        Hd(i)=1;
    else
        break
    end
end
E=W.*(Hd-P.*Q');
w=[];
w=[w,0];
for x=1:L-1
    if((x+2)*pi/L>wc && (x-1)*pi/L<ws)
        continue
    end
    if((E(x+1)-E(x))*(E(x+2)-E(x+1))<=0)
        temp=w;
        w=[temp,x];
    end
end
if(q==1)
    w=[w,L];
end
if(length(w)<r-1)
    for i=1:r-1-length(w)
        j=1;
        dw=w(2)-w(1);
        for k=1:length(w)-1
            if(w(k)*pi/L<wc && w(k+1)*pi/L>wc)
                continue
            end
            if(dw<(w(k+1)-w(k)))
                dw=w(k+1)-w(k);
                j=k;
            end
        end
        w=[w(1:j),fix((w(j+1)-w(j))/2),w(j+1:length(w))];
    end
elseif(length(w)>r-1)
    for i=1:length(w)-r+1
        j=1;
        for k=1:length(w)-1
            if(abs(E(w(j)+1))>abs(E(w(k+1)+1)))
                j=k+1;
            end
        end
        if(j==1)
            w=w(2:length(w));
        elseif(j==length(w))
            w=w(1:j-1);
        else
            w=[w(1:j-1),w(j+1:length(w))];
        end
    end
end
             
for i=1:length(w)
    if(w(i)*pi/L>=wc)
        break;
    end
end

n2=i;
w=[w(1:n2-1)/L*pi,wc,ws,w(n2:length(w))/L*pi];
n1=n2;




    

        