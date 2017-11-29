function[C]=remez(r,wc,ws,w,K,n1,q)
%���type I Q(w)=1 ���   ��ż�Գƣ�NΪ����  ��Ƶ�ͨ�˲���
%NΪ����
%wcΪͨ��ת��Ƶ�ʣ�wsΪ���ת�۵�
%WwΪ��Ȩ����
if(q==1)
    Q=ones(r+1,1);
else
    Q=cos(w/2);
end
D=zeros(r+1);
B=zeros(r+1,1);
for i=1:r+1
    for j=1:r
        D(i,j)=cos((j-1)*w(i));
    end
end
for k=1:n1
    D(k,r+1)=K*(-1)^(k-1)./Q(k);
end
for k=n1+1:r+1
    D(k,r+1)=(-1)^(k-1)./Q(k);
end
for n=1:r+1
    B(n,1)=sign(sign((wc+ws)/2-w(n))+1)./Q(n);
end
C=D\B;