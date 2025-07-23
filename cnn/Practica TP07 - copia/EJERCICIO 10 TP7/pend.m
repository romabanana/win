% programa de animacion para el pendulo
% Entradas al sistema: Intervalo de tiempo: interp
% valores iniciales ic= [(1,1) y(2,1)], numero de pasos n
% usaremos metodo de un paso Ej trapstep.m
% uso del ejemplo: pend([0 10], [pi/2 0], 200)

function pend(inter,ic,n)
  h=(inter(2)-inter(1))/n; % graficamos n puntos en total
  y(1,:)=ic; % incorporo las condiciones iniciales
  t(1)=inter(1);
  set(gca,'xlim',[-1.2 1.2], 'ylim', [-1.2 1.2], ...
  'XTick',[-1 0 1], 'YTick', [-1 0 1], ...
  'Drawmode', 'fast', 'Visible','on','NextPlot','add');
  cla;
  axis square   % hace razon de aspecto 1-1
  bob=line('color','r','Marker','.','markersize',40,...
      'erase','xor','xdata',[],'ydata',[]);
  rod=line('color','b','LineStyle','-','LineWidth',3,...
      'erase','xor','xdata',[],'ydata',[]);
  
  for k=1:n
    t(k+1)=t(k)+h;
    y(k+1,:)=trapstep(t(k),y(k,:),h);
    xbob=sin(y(k+1,1));
    ybob=-cos(y(k+1,1));
    xrod=[0 xbob];
    yrod=[0 ybob];
    set(rod,'xdata',xrod,'ydata',yrod)
    set(bob,'xdata',xbob,'ydata',ybob)
    drawnow; grid on; grid minor;
    pause(h)
  end
  
  
  
  