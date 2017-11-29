function IIR()
clear
Fs=100;
t=(1:100)/Fs;
s1=sin(2*pi*t*5);
s2=sin(2*pi*t*15);
s3=sin(2*pi*t*30);
s=s1+s2+s3;
plot(t,s);
xlabel('ʱ��(s)');
ylabel('��ֵ');
grid;
%��Բ��ͨ�˲��������
[b,a]=ellip(5,0.1,40,5*2/Fs);
[H,w]=freqz(b,a,512);
plot(w*Fs/(2*pi),abs(H));
xlabel('Ƶ��(Hz)');ylabel('Ƶ����Ӧͼ');
grid;
%���˲�����źŽ��з����ͱ任
sf=filter(b,a,s);
plot(t,sf);
xlabel('ʱ�� (s)');
ylabel('��ֵ');
axis([0 1 -1 1]);
S=fft(s,512);
SF=fft(sf,512);
w=(0:255)/256*(Fs/2);
plot(w,abs([S(1:256)' SF(1:256)']));
xlabel('Ƶ��(Hz)');
ylabel('����Ҷ�任ͼ');
grid;
legend({'before','after'});
end