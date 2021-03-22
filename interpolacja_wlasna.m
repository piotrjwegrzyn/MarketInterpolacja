clear all;
close all;

% wczytywanie danych:

N = 31;
K = 20;
% x = 1:0.1:N;

dane = csvread('cdproject.csv', 1, 0);

dni = dane(:,1);

cena1 = dane(:,2);
cena2 = dane(:,3);
cena3 = dane(:,4);
cena4 = dane(:,5);


% rysowanie danych punktowych

figure(1)
subplot(2, 2, 1)
plot(dni, cena1, '.r')
xlim([0 N])
ylim([0 500])
subtitle("Kurs otwarcia")

subplot(2, 2, 4)
plot(dni, cena2, '.')
xlim([0 N])
ylim([0 500])
subtitle("Cena maksymalna")

subplot(2, 2, 3)
plot(dni, cena3, '.b')
xlim([0 N])
ylim([0 500])
subtitle("Cena minimalna")

subplot(2, 2, 2)
plot(dni, cena4, '.m')
xlim([0 N])
ylim([0 500])
subtitle("Kurs zamknięcia");


% rysowanie danych łączonych liniowo

figure(2)
subplot(2, 2, 1)
plot(dni, cena1, '-r')
xlim([0 31])
ylim([0 500])
subtitle("Kurs otwarcia")

subplot(2, 2, 4)
plot(dni, cena2, '-')
xlim([0 N])
ylim([0 500])
subtitle("Cena maksymalna")

subplot(2, 2, 3)
plot(dni, cena3, '-b')
xlim([0 N])
ylim([0 500])
subtitle("Cena minimalna")

subplot(2, 2, 2)
plot(dni, cena4, '-m')
xlim([0 N])
ylim([0 500])
subtitle("Kurs zamknięcia");


% liczenie interpolacji metodą własną (łamanym Lagrange'm)

for i = 1:17
    
    tX = [dni(i), dni(i+1), dni(i+2), dni(i+3)];
    tY = [cena1(i), cena1(i+1), cena1(i+2), cena1(i+3)];
    
    for x = 10:310
        if(x>10*dni(i+1)-1 && x<10*dni(i+2))
            cena1_lw(x) = 0;
            for j = 1:4
                
                cena1_lw(x) = cena1_lw(x) + tY(j) * wielomianLk(x/10, tX, j);
                
            end
        elseif(x < 21)
            cena1_lw(x) = cena1(1);
        elseif(x>289)
            cena1_lw(x) = cena1(20);
        end
    end
end

for i = 1:17
    
    tX = [dni(i), dni(i+1), dni(i+2), dni(i+3)];
    tY = [cena2(i), cena2(i+1), cena2(i+2), cena2(i+3)];
    
    for x = 10:310
        if(x>10*dni(i+1)-1 && x<10*dni(i+2))
            cena2_lw(x) = 0;
            for j = 1:4
                
                cena2_lw(x) = cena2_lw(x) + tY(j) * wielomianLk(x/10, tX, j);
                
            end
        elseif(x < 21)
            cena2_lw(x) = cena2(1);
        elseif(x>289)
            cena2_lw(x) = cena2(20);
        end
    end
end

for i = 1:17
    
    tX = [dni(i), dni(i+1), dni(i+2), dni(i+3)];
    tY = [cena3(i), cena3(i+1), cena3(i+2), cena3(i+3)];
    
    for x = 10:310
        if(x>10*dni(i+1)-1 && x<10*dni(i+2))
            cena3_lw(x) = 0;
            for j = 1:4
                
                cena3_lw(x) = cena3_lw(x) + tY(j) * wielomianLk(x/10, tX, j);
                
            end
        elseif(x < 21)
            cena3_lw(x) = cena3(1);
        elseif(x>289)
            cena3_lw(x) = cena3(20);
        end
    end
end

for i = 1:17
    
    tX = [dni(i), dni(i+1), dni(i+2), dni(i+3)];
    tY = [cena4(i), cena4(i+1), cena4(i+2), cena4(i+3)];
    
    for x = 10:310
        if(x>10*dni(i+1)-1 && x<10*dni(i+2))
            cena4_lw(x) = 0;
            for j = 1:4
                
                cena4_lw(x) = cena4_lw(x) + tY(j) * wielomianLk(x/10, tX, j);
                
            end
        elseif(x < 21)
            cena4_lw(x) = cena4(1);
        elseif(x>289)
            cena4_lw(x) = cena4(20);
        end
    end
end

figure(3)
subplot(2, 2, 1)
plot(cena1_lw, '-r')
xlim([10 310])
ylim([0 500])
subtitle("Kurs otwarcia")

subplot(2, 2, 4)
plot(cena2_lw, '-')
xlim([10 310])
ylim([0 500])
subtitle("Cena maksymalna")

subplot(2, 2, 3)
plot(cena3_lw, '-b')
xlim([10 310])
ylim([0 500])
subtitle("Cena minimalna")

subplot(2, 2, 2)
plot(cena4_lw, '-m')
xlim([10 310])
ylim([0 500])
subtitle("Kurs zamknięcia")


