function S=rotacio(a,Z)
    A=[cosd(a),sind(a);-sind(a),cosd(a)];
    S=(A*(Z'))';
end