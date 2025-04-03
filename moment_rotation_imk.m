%made by- prayush shah
%roll no- 24v0052
%insti- indian institute of technology, bombay

P = 819000;  %axial load
b = 400;    %width in mm
h = 400;     %depth in mm
fc_prime = 25.6;  %cyclindr strength mpa
fy = 474;  %long. steel yield stress mpa
fy_sh = 333;  %trans. steel yeild stress mpa
d_prime = 62;   %effective cover mm
L = 1600;  %length of span mm
Es = 200000; %modulus of elastiicty of steel mpa
Ec = 29934;   %modulus of elastiicty of steel mpa
asl = 0;
Db_c = 20; %dia of bar in compression
n_c = 3;  %no. of bar in compression
Db_s = 20;  %dia of bar in tension
n_s = 3; %no of bar in tension
s = 80;  %spaceing of shear reinf
db_sh = 12;  %dia of bar in shear
Db_w = 20; %dia of bar in web
n_w = 2;  % no of bar in web


Ls_over_h = L / h;
n = Es / Ec;
Ac = n_c * pi * (Db_c^2) / 4;
As = n_s * pi * (Db_s^2) / 4;
d = h - d_prime;
Ash_bar = pi * (db_sh^2) / 4;
no_of_legged = 3;
rho_sh = (no_of_legged * Ash_bar) / (b * s);
Aw = n_w * pi * (Db_w^2) / 4;
rho_v = Aw / (b * d);
delta_prime = d_prime / d;

rho_c = Ac / (b * d);
rho_s = As / (b * d);
v = P / (b * h * fc_prime);

a_t = rho_c + rho_s + rho_v + (P / (b * d * fy));
a_c = rho_c + rho_s + rho_v - (P / (1.8 * n * b * d * fc_prime));

b_t = rho_c + rho_s * delta_prime + 0.5 * rho_v * (1 + delta_prime) + (P / (b * d * fy));
b_c = rho_c + rho_s * delta_prime + 0.5 * rho_v * (1 + delta_prime);

ky_c = sqrt(n^2 * a_c^2 + 2 * n * b_c) - n * a_c;
ky_t = sqrt(n^2 * a_t^2 + 2 * n * b_t) - n * a_t;

phiy_c = 1.8 * 1000 * fc_prime / (Ec * ky_c * d);
phiy_t = fy * 1000 / (Es * (1 - ky_t) * d);

term1_c = (Ec / 2) * ky_c^2 * (0.5 * (1 + delta_prime) - ky_c / 3);
term2_c = (Es / 2) * ((1 - ky_c) * rho_c + (ky_c - delta_prime) * rho_s + (rho_v / 6) * (1 - delta_prime)) * (1 - delta_prime);
My_c = phiy_c * (term1_c + term2_c) * b * d^3 * 10^-9;

term1_t = (Ec / 2) * ky_t^2 * (0.5 * (1 + delta_prime) - ky_t / 3);
term2_t = (Es / 2) * ((1 - ky_t) * rho_c + (ky_t - delta_prime) * rho_s + (rho_v / 6) * (1 - delta_prime)) * (1 - delta_prime);
My_t = phiy_t * (term1_t + term2_t) * b * d^3 * 10^-9;

My = min(My_t, My_c);
phiy = min(phiy_t, phiy_c);

theta_y = (phiy * L / 3000) + 0.0025;

Mc = My * 1.25 * (0.89^v) * (0.91^(0.01 * fc_prime));
theta_cap_pl = 0.13 * (0.13^v) * ((0.02 + 40 * rho_sh)^0.65) * (0.57^(0.01 * fc_prime));
theta_pc = 0.76 * (0.031^v) * (0.02 + 40 * rho_sh)^1.02;

figure;
hold on;
plot([0, theta_y, theta_cap_pl + theta_y, theta_pc + theta_cap_pl + theta_y],[0, 1, Mc/My, 0], 'ro-', 'MarkerSize', 8, 'LineWidth', 1.5, 'DisplayName', 'Moment-Rotation Curve');

grid on;
xlabel('Rotation');
ylabel('Normalized Moment (M/My)');
title('Moment-Rotation Plot');
hold off;
