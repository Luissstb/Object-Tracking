function representa_esfera(centro, radio)
    Xc = centro(1); Yc = centro(2); Zc = centro(3);
    [X,Y,Z] = sphere(100);
    x = radio * X(:) + Xc;
    y = radio * Y(:) + Yc;
    z = radio * Z(:) + Zc;
    plot3(x, y, z, '.b');
end