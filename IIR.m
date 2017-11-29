function IIR()
clear
Fs=100;
t=(1:100)/Fs;
s1=sin(2*pi*t*5);
s2=sin(2*pi*t*15);
s3=sin(2*pi*t*30);
s=s1+s2+s3;
plot(t,s);
xlabel('时间(s)');
ylabel('幅值');
grid;
%椭圆低通滤波器的设计
[b,a]=ellip(5,0.1,40,5*2/Fs);
[H,w]=freqz(b,a,512);
plot(w*Fs/(2*pi),abs(H));
xlabel('频率(Hz)');ylabel('频率响应图');
grid;
%对滤波后的信号进行分析和变换
sf=filter(b,a,s);
plot(t,sf);
xlabel('时间 (s)');
ylabel('幅值');
axis([0 1 -1 1]);
S=fft(s,512);
SF=fft(sf,512);
w=(0:255)/256*(Fs/2);
plot(w,abs([S(1:256)' SF(1:256)']));
xlabel('频率(Hz)');
ylabel('傅立叶变换图');
grid;
legend({'before','after'});
end