clear all;
close all;


% wczytywanie danych:

N = 31;
K = 20;
x = 1:0.1:N;

dane = csvread('cdproject.csv', 1, 0);

dni = dane(:,1);

cena1 = dane(:,2);
cena2 = dane(:,3);
cena3 = dane(:,4);
cena4 = dane(:,5);


% rysowanie wczytanych danych

figure(1)
subplot(2, 2, 1)
plot(dni, cena1, '.r')
xlim([0 31])
ylim([0 500])
subtitle("Kurs otwarcia (dane)")

subplot(2, 2, 4)
plot(dni, cena2, '.')
xlim([0 N])
ylim([0 500])
subtitle("Cena maksymalna (dane)")

subplot(2, 2, 3)
plot(dni, cena3, '.b')
xlim([0 N])
ylim([0 500])
subtitle("Cena minimalna (dane)")

subplot(2, 2, 2)
plot(dni, cena4, '.m')
xlim([0 N])
ylim([0 500])
subtitle("Kurs zamknięcia (dane)");


% interpolacja wielomianowa macierzą Vandermonde'a

DNI = vander(dni);

cena1_w = DNI\cena1;
cena2_w = DNI\cena2;
cena3_w = DNI\cena3;
cena4_w = DNI\cena4;

% rysowanie w pełnym zakresie ceny

figure(2)
subplot(2, 2, 1)
plot(x, polyval(cena1_w, x), 'r-')
xlim([0 31])
%ylim([0 500]);
subtitle("Kurs otwarcia (Vandermonde)")

subplot(2, 2, 4)
plot(x, polyval(cena2_w, x), '-')
xlim([0 N])
%ylim([0 500]);
subtitle("Cena maksymalna (Vandermonde)")

subplot(2, 2, 3)
plot(x, polyval(cena3_w, x), 'b-')
xlim([0 N])
%ylim([0 500]);
subtitle("Cena minimalna (Vandermonde)")

subplot(2, 2, 2)
plot(x, polyval(cena4_w, x), 'm-')
xlim([0 N])
%ylim([0 500]);
subtitle("Kurs zamknięcia (Vandermonde)");

% rysowanie w zawężonym zakresie ceny

figure(3)
subplot(2, 2, 1)
plot(x, polyval(cena1_w, x), '-r')
xlim([0 31])
ylim([0 500])
subtitle("Kurs otwarcia (Vandermonde2)")

subplot(2, 2, 4)
plot(x, polyval(cena2_w, x), '-')
xlim([0 N])
ylim([0 500])
subtitle("Cena maksymalna (Vandermonde2)")

subplot(2, 2, 3)
plot(x, polyval(cena3_w, x), 'b-')
xlim([0 N])
ylim([0 500])
subtitle("Cena minimalna (Vandermonde2)")

subplot(2, 2, 2)
plot(x, polyval(cena4_w, x), 'm-')
xlim([0 N])
ylim([0 500])
subtitle("Kurs zamknięcia (Vandermonde2)");


% liczenie interpolacji metodą Newtona

d(:,1) = cena1;
for j = 2:K
    for k=j:K
        d(k,j) = (d(k, j-1) - d(k-1, j-1)) / (dni(k) - dni(k-j+1));
    end
end
for x=10:310
    cena1_n(x)=d(1,1);
    for k = 1:K-1
        m = 1;
        for j = 1:k
            m = m * (x/10-dni(j));
        end
        cena1_n(x) = cena1_n(x) + d(k+1, k+1) * m;
    end
end

d(:,1) = cena2;
for j = 2:K
    for k=j:K
        d(k,j) = (d(k, j-1) - d(k-1, j-1)) / (dni(k) - dni(k-j+1));
    end
end
for x=10:310
    cena2_n(x)=d(1,1);
    for k = 1:K-1
        m = 1;
        for j = 1:k
            m = m * (x/10-dni(j));
        end
        cena2_n(x) = cena2_n(x) + d(k+1, k+1) * m;
    end
end

d(:,1) = cena3;
for j = 2:K
    for k=j:K
        d(k,j) = (d(k, j-1) - d(k-1, j-1)) / (dni(k) - dni(k-j+1));
    end
end
for x=10:310
    cena3_n(x)=d(1,1);
    for k = 1:K-1
        m = 1;
        for j = 1:k
            m = m * (x/10-dni(j));
        end
        cena3_n(x) = cena3_n(x) + d(k+1, k+1) * m;
    end
end

d(:,1) = cena4;
for j = 2:K
    for k=j:K
        d(k,j) = (d(k, j-1) - d(k-1, j-1)) / (dni(k) - dni(k-j+1));
    end
end
for x=10:310
    cena4_n(x)=d(1,1);
    for k = 1:K-1
        m = 1;
        for j = 1:k
            m = m * (x/10-dni(j));
        end
        cena4_n(x) = cena4_n(x) + d(k+1, k+1) * m;
    end
end


% rysowanie metody Newtona

figure(4)
subplot(2, 2, 1)
plot(cena1_n, 'r-')
xlim([10 310])
ylim([0 500])
subtitle("Kurs otwarcia (Newton)")

subplot(2, 2, 4)
plot(cena2_n, '-')
xlim([10 310])
ylim([0 500])
subtitle("Cena maksymalna (Newton)")

subplot(2, 2, 3)
plot(cena3_n, 'b-')
xlim([10 310])
ylim([0 500])
subtitle("Cena minimalna (Newton)")

subplot(2, 2, 2)
plot(cena4_n, 'm-')
xlim([10 310])
ylim([0 500])
subtitle("Kurs zamknięcia (Newton)");

