function h1 = plotRstyleUncert(x,y,err,lineCol)

if nargin<4
    lineCol = 'r';
end

% make sure x and y are rows
x = x(:)';
y = y(:)';
err = err(:)';
grayIntens = 0.8;
hold on
patch([x fliplr(x)],[y+err fliplr(y-err)],lineCol,...
    'FaceAlpha',0.3,'EdgeAlpha',0.3)

h1 = plot(x,y,'Color',lineCol);

