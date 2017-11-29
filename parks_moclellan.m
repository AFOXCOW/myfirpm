function [An,delta]= parks_moclellan(N,wc,ws)
        K=1;
if(rem(N,2)==1)
    r=(N+1)/2;
else
    r=N/2;
end
        d=(pi-ws+wc)/(r+1);
        for n1=1:r
            if((n1)*d>=wc)
                break;
            end
        end
        % if (rem(n1,2)==0)
        %     n1=n1+1;
        % end
        deltaw1=wc/(n1);
        deltaw2=(pi-ws)/(r+1-n1);
        w=[deltaw1:deltaw1:wc,ws:deltaw2:pi-deltaw2];
        %deltaw=(pi-ws+wc)/(r+1);
        %w=[deltaw:deltaw:wc,ws:deltaw:pi-deltaw];
q=rem(N,2);
        C=remez(r,wc,ws,w,K,n1,q);
        flag=whether_below_delta(C,wc,ws,r,K,q);
        while(~flag)

            [w,n1]=finding(C,wc,ws,r,n1,K,q);
            C=remez(r,wc,ws,w,K,n1,q);
            flag=whether_below_delta(C,wc,ws,r,K,q);
        end

L=r*100;
        delta=C(length(C));
        An=C(1:length(C)-1);
        A=zeros(L+1,r);
        wj=0:pi/L:pi;
        if(rem(N,2)==1)
            Q=ones(length(wj));
        else
            Q=cos(wj/2);
        end
        for i=1:L+1
            for j=1:r
                A(i,j)=cos((j-1)*wj(i));
            end
        end
        P=A*An;
        H=P.*Q';
%         plot(H);hold on;
%         ONE=ones(1,L);
%         ZERO=zeros(1,L);
%         plot(1:L,delta*K+ONE);hold on;
%         plot(1:L,delta+ZERO);hold on;
%         plot(1:L,-delta*K+ONE);hold on;
%         plot(1:L,-delta+ZERO);hold on;
        
        h((N+1)/2)=An(1);
        for i=1:(N-1)/2
            h(i)=0.5*An((N+3)/2-i);
            h(N+1-i)=h(i);
        end
% %         w=0:pi/800:pi;
% %         plot(wj,20*log10(abs(H/H(1))));
        [H,w]=freqz(h,1);
 %       plot(abs(H));hold on;
        plot(w/pi,20*log10(abs(H/H(1))));
        hold on;
        
%         Hmatlab=firpm(N-1,[0 wc/pi ws/pi 1],[1 1 0 0]);
%         [Hw,w]=freqz(Hmatlab,1);
%         %plot(w,abs(Hw));
%         plot(w/pi,20*log10(abs(Hw/Hw(1))),'b');
%         hold on;


