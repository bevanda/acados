% script to visualize the pendulum

pause(0.05)

%drawnow update
drawnow('expose')

figure(1);
set(gcf, 'Color','white');
clf

plot([x_cur(1); x_cur(1)-sin(x_cur(2))], [0; cos(x_cur(2))], '-ob', 'MarkerSize', 7.5, 'MarkerFaceColor', 'b', 'linewidth', 0.2);
hold on
plot([-10 10], [0 0], 'k');
hold off

xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
