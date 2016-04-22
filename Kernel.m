function y = Kernel( Xi,Xj,type,p)
% Compute the value of a chosen kernel
switch type
    case 1
        y = Xi'*Xj;
    otherwise
        y = (Xi'*Xj+1).^p;
end
end

